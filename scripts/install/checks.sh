#!/usr/bin/env bash
# scripts/install/checks.sh — Pre-flight validation before installation

run_checks() {
  step "Running pre-flight checks..."

  # --- Root check ---
  if [[ $EUID -eq 0 ]]; then
    error "Do not run this installer as root or with sudo."
  fi

  # --- OS Check ---
  if [[ "$OSTYPE" != linux* ]]; then
    error "Unsupported OS: $OSTYPE. This setup is Linux-only."
  fi
  ok "OS: Linux"

  # --- Wayland Check ---
  if [[ "${XDG_SESSION_TYPE:-}" != "wayland" ]]; then
    warn "Wayland session not detected. Hyprland requires Wayland at runtime."
  else
    ok "Session: Wayland"
  fi

  # --- Required commands ---
  local required=(
    git
    ln
    mkdir
    chmod
    mv
    find
    grep
    basename
    date
    sed
  )
  for cmd in "${required[@]}"; do
    for cmd in "${required[@]}"; do
    require "$cmd"
    
  done &>/dev/null; then
      error "Required command missing: $cmd"
    fi
  done
  ok "Core commands available"

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
