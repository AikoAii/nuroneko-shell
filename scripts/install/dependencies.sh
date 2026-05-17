#!/usr/bin/env bash

install_dependencies() {
    info "Installing dependencies..."

    # --- Arch-based distros ---
    if [[ "$OS_ID" == "arch" || "$OS_LIKE" == *"arch"* ]]; then

        local HELPER=""
        local packages_file="${DOTFILES_DIR}/packages/arch.txt"

        # --- Validate package file ---
        [[ -f "$packages_file" ]] || error "Missing package list: ${packages_file}"

        # --- Detect AUR helper ---
        if command -v yay &>/dev/null; then
            HELPER="yay"

        elif command -v paru &>/dev/null; then
            HELPER="paru"

        else
            warn "No AUR helper detected. Falling back to pacman (AUR packages may fail)."
            HELPER="sudo pacman"
        fi

        info "Using package manager: ${HELPER}"

        # --- Read package list safely ---
        mapfile -t packages < <(
            grep -vE '^\s*#|^\s*$' "$packages_file"
        )

        # --- Validate package list ---
        if [[ ${#packages[@]} -eq 0 ]]; then
            error "No packages found in ${packages_file}"
        fi

        # --- Install packages ---
        $HELPER -S --needed --noconfirm "${packages[@]}" \
            || error "Failed to install Arch dependencies"

    # --- Fedora-based distros ---
    elif [[ "$OS_ID" == "fedora" || "$OS_LIKE" == *"fedora"* ]]; then

        local packages_file="${DOTFILES_DIR}/packages/fedora.txt"

        [[ -f "$packages_file" ]] || error "Missing package list: ${packages_file}"

        mapfile -t packages < <(
            grep -vE '^\s*#|^\s*$' "$packages_file"
        )

        if [[ ${#packages[@]} -eq 0 ]]; then
            error "No packages found in ${packages_file}"
        fi

        info "Using package manager: dnf"

        sudo dnf install -y "${packages[@]}" \
            || error "Failed to install Fedora dependencies"

    else
        warn "Unsupported OS for automatic dependency installation."
        warn "Please install dependencies manually."
        return
    fi

    ok "Dependencies installed successfully."
}
