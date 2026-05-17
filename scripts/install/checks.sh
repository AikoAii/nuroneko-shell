#!/usr/bin/env bash
# scripts/install/checks.sh — Pre-flight validation before installation

run_checks() {
    step "Running pre-flight checks..."

    # --- OS Check ---
    if [[ "$OSTYPE" != "linux-gnu"* ]]; then
        error "Unsupported OS: $OSTYPE. This setup is Linux-only."
    fi
    ok "OS: Linux"

    # --- Wayland Check ---
    if [[ -z "${WAYLAND_DISPLAY:-}" ]] && [[ -z "${XDG_SESSION_TYPE:-}" ]]; then
        warn "WAYLAND_DISPLAY not set. Ensure you are running a Wayland session."
    else
        ok "Session: Wayland"
    fi

    # --- Required commands ---
    local required=(git stow ln mkdir cp chmod)
    for cmd in "${required[@]}"; do
        if ! command -v "$cmd" &>/dev/null; then
            error "Required command missing: $cmd"
        fi
    done
    ok "Core commands available"

    # --- Package manager check ---
    if command -v pacman &>/dev/null; then
        ok "Package manager: pacman"
    elif command -v dnf &>/dev/null; then
        ok "Package manager: dnf"
    else
        warn "No supported package manager detected. Manual dependency install may be required."
    fi

    # --- XDG directories ---
    ensure_dir "${XDG_CONFIG_HOME:-$HOME/.config}"
    ensure_dir "${XDG_DATA_HOME:-$HOME/.local/share}"
    ensure_dir "$HOME/.local/bin"
    ok "XDG directories ready"

    # --- Config source check ---
    if [[ ! -d "${DOTFILES_DIR}/configs" ]]; then
        error "configs/ directory not found in DOTFILES_DIR: ${DOTFILES_DIR}"
    fi
    ok "Dotfiles source directory validated"

    ok "Pre-flight checks passed."
}
