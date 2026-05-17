#!/usr/bin/env bash

detect_distro() {
    info "Detecting Linux distribution..."

    # --- Detect os-release ---
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release

        export OS_ID="${ID:-unknown}"
        export OS_LIKE="${ID_LIKE:-}"
        export OS_NAME="${PRETTY_NAME:-Linux}"

        ok "Detected OS: ${OS_NAME}"
    else
        error "Cannot detect OS! /etc/os-release not found."
    fi

    # --- Detect package manager ---
    if command -v pacman &>/dev/null; then
        export PKG_MANAGER="pacman"

    elif command -v dnf &>/dev/null; then
        export PKG_MANAGER="dnf"

    elif command -v apt &>/dev/null; then
        export PKG_MANAGER="apt"

    else
        error "No supported package manager found."
    fi

    ok "Package manager: ${PKG_MANAGER}"
}
