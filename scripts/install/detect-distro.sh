#!/usr/bin/env bash

detect_distro() {

  info "Detecting Linux distribution..."

  # ==========================================================
  # Detect os-release
  # ==========================================================

  if [[ -f /etc/os-release ]]; then

    source /etc/os-release

    export OS_ID="${ID:-unknown}"
    export OS_LIKE="${ID_LIKE:-}"
    export OS_NAME="${PRETTY_NAME:-Linux}"

  else
    error "Cannot detect OS: /etc/os-release not found."
  fi

  ok "Detected OS: ${OS_NAME}"

  # ==========================================================
  # Detect package manager
  # ==========================================================

  local detected_pkg_manager=""

  for manager in pacman dnf apt zypper; do

    if command -v "$manager" >/dev/null 2>&1; then
      detected_pkg_manager="$manager"
      break
    fi
  done

  [[ -n "$detected_pkg_manager" ]] ||
    error "No supported package manager found."

  export PKG_MANAGER="$detected_pkg_manager"

  ok "Package manager: ${PKG_MANAGER}"
}
