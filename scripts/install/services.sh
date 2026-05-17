#!/usr/bin/env bash

setup_services() {
    info "Setting up services..."

    local init_detect="${DOTFILES_DIR}/scripts/install/init/detect-init.sh"
    local init_common="${DOTFILES_DIR}/scripts/install/init/common.sh"

    # --- Validate init modules ---
    [[ -f "$init_detect" ]] \
        || error "Missing init detection module"

    [[ -f "$init_common" ]] \
        || error "Missing init common module"

    source "$init_detect"
    source "$init_common"

    # --- Detect init system ---
    detect_init
    load_init_backend

    # --- Audio services ---
    enable_service "wireplumber" "user" \
        || warn "Failed to enable wireplumber"

    enable_service "pipewire-pulse" "user" \
        || warn "Failed to enable pipewire-pulse"

    enable_service "pipewire" "user" \
        || warn "Failed to enable pipewire"

    ok "Audio services configured for ${INIT_SYSTEM}."
}
