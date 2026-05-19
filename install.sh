#!/usr/bin/env bash
set -Eeuo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly INSTALL_START_TIME="$(date +%s)"
readonly DOTFILES_DIR
export DOTFILES_DIR

export INSTALLED_PACKAGES=0
export CREATED_SYMLINKS=0
export BACKED_UP_ITEMS=0
export ENABLED_SERVICES=0
export INSTALL_WARNINGS=0

source "${DOTFILES_DIR}/scripts/utils/lib.sh"

trap 'error "Installation failed in ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}: ${BASH_COMMAND}"' ERR

require_function() {
  declare -F "$1" >/dev/null || {
    error "Missing required function: $1"
    exit 1
  }
}

require_function info
require_function warn
require_function error
require_function ok
require_function step
require_function ensure_dir
require_function safe_symlink

step "Hyprland Dotfiles Installer"
info "Source: ${DOTFILES_DIR}"

safe_source() {

  local file="$1"

  [[ -f "$file" ]] ||
    error "Missing required module: ${file}"

  source "$file" ||
    error "Failed to source module: ${file}"
}

# Source and run modular installer steps
safe_source "${DOTFILES_DIR}/scripts/install/checks.sh"
safe_source "${DOTFILES_DIR}/scripts/install/detect-distro.sh"
safe_source "${DOTFILES_DIR}/scripts/install/dependencies.sh"
safe_source "${DOTFILES_DIR}/scripts/install/backup.sh"
safe_source "${DOTFILES_DIR}/scripts/install/symlink.sh"
safe_source "${DOTFILES_DIR}/scripts/install/services.sh"
safe_source "${DOTFILES_DIR}/scripts/install/permissions.sh"
safe_source "${DOTFILES_DIR}/scripts/install/finalize.sh"
safe_source "${DOTFILES_DIR}/scripts/install/validate.sh"
safe_source "${DOTFILES_DIR}/scripts/install/summary.sh"

require_function run_checks
require_function detect_distro
require_function install_dependencies
require_function backup_existing_configs
require_function create_symlinks
require_function setup_services
require_function set_permissions
require_function finalize_install
require_function validate_installation
require_function show_install_summary

run_step() {

    local fn="$1"

    require_function "$fn"

    info "Running step: ${fn}"

    "$fn"
}

run_step run_checks
run_step detect_distro
run_step install_dependencies
run_step backup_existing_configs
run_step create_symlinks
run_step setup_services
run_step set_permissions
run_step finalize_install
run_step validate_installation

readonly INSTALL_END_TIME="$(date +%s)"
readonly INSTALL_DURATION="$((INSTALL_END_TIME - INSTALL_START_TIME))"

run_step show_install_summary

echo ""
ok "Installation complete. Log out and start Hyprland."


