#!/usr/bin/env bash

validate_installation() {

  step "Validating installation..."

  # ==========================================================
  # Required binaries
  # ==========================================================

  local required_binaries=(
    hyprctl
    Hyprland
    waybar
    kitty
    fuzzel
    pipewire
    wireplumber
  )

  local missing_binaries=0

  info "Checking required binaries..."

  for binary in "${required_binaries[@]}"; do

    if command -v "$binary" >/dev/null 2>&1; then
      ok "Found binary: ${binary}"

    else
      warn "Missing binary: ${binary}"
      ((missing_binaries++))
    fi
  done

  # ==========================================================
  # Symlink validation
  # ==========================================================

  info "Checking symlink integrity..."

  local broken_symlinks=0

  while IFS= read -r symlink; do

    if [[ ! -e "$symlink" ]]; then
      warn "Broken symlink: ${symlink}"
      ((broken_symlinks++))
    fi

  done < <(find "${HOME}/.config" -xtype l 2>/dev/null)

  if [[ $broken_symlinks -eq 0 ]]; then
    ok "No broken symlinks detected."
  fi

  # ==========================================================
  # Hyprland configuration validation
  # ==========================================================

  local hypr_config="${HOME}/.config/hypr/hyprland.conf"

  if [[ -f "$hypr_config" ]]; then

    info "Validating Hyprland configuration..."

    if command -v Hyprland >/dev/null 2>&1; then

      if Hyprland --config "$hypr_config" >/dev/null 2>&1; then
        ok "Hyprland configuration looks valid."
      else
        warn "Hyprland configuration validation failed."
      fi

    else
      warn "Hyprland binary not found. Skipping config validation."
    fi

  else
    warn "Hyprland config not found: ${hypr_config}"
  fi

  # ==========================================================
  # Runtime service validation
  # ==========================================================

  info "Checking PipeWire services..."

  local services=(
    pipewire
    wireplumber
  )

  for service in "${services[@]}"; do

    if pgrep -x "$service" >/dev/null 2>&1; then
      ok "Service running: ${service}"

    else
      warn "Service not running: ${service}"
    fi
  done

  # ==========================================================
  # Validation summary
  # ==========================================================

  echo ""

  if [[ $missing_binaries -eq 0 && $broken_symlinks -eq 0 ]]; then

    ok "Installation validation completed successfully."

  else

    warn "Validation completed with warnings."
    warn "Missing binaries: ${missing_binaries}"
    warn "Broken symlinks: ${broken_symlinks}"
  fi
}
