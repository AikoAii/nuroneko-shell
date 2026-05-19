#!/usr/bin/env bash

install_dependencies() {

  local SUDO=""
  local HELPER=""

  # --- Privilege escalation detection ---
  if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"

  elif command -v doas >/dev/null 2>&1; then
    SUDO="doas"

  else
    error "Neither sudo nor doas found."
  fi

  info "Installing dependencies..."
  info "Privilege escalation tool: ${SUDO}"

  case "$PKG_MANAGER" in

  # ==========================================================
  # Pacman-based distros (Arch / Artix)
  # ==========================================================

  pacman)

    local official_file=""
    local aur_file="${DOTFILES_DIR}/packages/arch-aur.txt"

    # --- Select package manifest ---
    if [[ "$OS_ID" == "artix" ]]; then
      official_file="${DOTFILES_DIR}/packages/artix.txt"
    else
      official_file="${DOTFILES_DIR}/packages/arch-official.txt"
    fi

    [[ -f "$official_file" ]] ||
      error "Missing package list: ${official_file}"

    # --- Read official packages ---
    mapfile -t packages < <(
      grep -vE '^\s*#|^\s*$' "$official_file"
    )

    [[ ${#packages[@]} -gt 0 ]] ||
      error "No packages found in ${official_file}"

    info "Installing official packages..."

    "$SUDO" pacman -S --needed --noconfirm "${packages[@]}" ||
      error "Failed to install official packages"

    INSTALLED_PACKAGES="${#packages[@]}"

    # ======================================================
    # AUR Packages
    # ======================================================

    if [[ -f "$aur_file" ]]; then

      mapfile -t aur_packages < <(
        grep -vE '^\s*#|^\s*$' "$aur_file"
      )

      if [[ ${#aur_packages[@]} -gt 0 ]]; then

        # --- Detect AUR helper ---
        if command -v yay >/dev/null 2>&1; then
          HELPER="yay"

        elif command -v paru >/dev/null 2>&1; then
          HELPER="paru"

        else
          warn "No AUR helper detected. Skipping AUR packages."
        fi

        # --- Install AUR packages ---
        if [[ -n "$HELPER" ]]; then

          info "Installing AUR packages using ${HELPER}..."

          "$HELPER" -S --needed --noconfirm "${aur_packages[@]}" ||
            warn "Failed to install some AUR packages"
        fi
      fi
    fi
    ;;

  # ==========================================================
  # Fedora
  # ==========================================================

  dnf)

    local packages_file="${DOTFILES_DIR}/packages/fedora.txt"

    [[ -f "$packages_file" ]] ||
      error "Missing package list: ${packages_file}"

    mapfile -t packages < <(
      grep -vE '^\s*#|^\s*$' "$packages_file"
    )

    [[ ${#packages[@]} -gt 0 ]] ||
      error "No packages found in ${packages_file}"

    info "Installing Fedora packages..."

    "$SUDO" dnf install -y "${packages[@]}" ||
      error "Failed to install Fedora dependencies"
    ;;

  # ==========================================================
  # Unsupported package manager
  # ==========================================================

  *)

    warn "Unsupported package manager: ${PKG_MANAGER}"
    warn "Please install dependencies manually."
    return
    ;;
  esac

  ok "Dependencies installed successfully."
}
