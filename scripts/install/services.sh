#!/usr/bin/env bash

setup_services() {

    info "Setting up services..."

    local init_detect="${DOTFILES_DIR}/scripts/install/init/detect-init.sh"
    local init_common="${DOTFILES_DIR}/scripts/install/init/common.sh"

    # ==========================================================
    # Validate init modules
    # ==========================================================

    [[ -f "$init_detect" ]] \
        || error "Missing init detection module"

    [[ -f "$init_common" ]] \
        || error "Missing init common module"

    source "$init_detect" \
        || error "Failed to source init detection module"

    source "$init_common" \
        || error "Failed to source init common module"

    require_function detect_init
    require_function load_init_backend
    require_function enable_service

    # ==========================================================
    # Detect init system
    # ==========================================================

    detect_init

    load_init_backend \
        || error "Failed to load init backend"

    # ==========================================================
    # Audio services
    # ==========================================================

    local user_services=(
        wireplumber
        pipewire-pulse
        pipewire
    )

    for service in "${user_services[@]}"; do

        if enable_service "$service" "user"; then

            ((ENABLED_SERVICES++))

        else

            warn "Failed to enable ${service}"

        fi

    done

    ok "Audio services configured for ${INIT_SYSTEM}."
}