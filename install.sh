#!/usr/bin/env bash
set -Eeuo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly DOTFILES_DIR
export DOTFILES_DIR

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

# Source and run modular installer steps
source "${DOTFILES_DIR}/scripts/install/checks.sh"
source "${DOTFILES_DIR}/scripts/install/detect-distro.sh"
source "${DOTFILES_DIR}/scripts/install/dependencies.sh"
source "${DOTFILES_DIR}/scripts/install/backup.sh"
source "${DOTFILES_DIR}/scripts/install/symlink.sh"
source "${DOTFILES_DIR}/scripts/install/services.sh"
source "${DOTFILES_DIR}/scripts/install/permissions.sh"
source "${DOTFILES_DIR}/scripts/install/finalize.sh"

run_checks
detect_distro
install_dependencies
backup_existing_configs
create_symlinks
setup_services
set_permissions
finalize_install



echo ""
ok "Installation complete. Log out and start Hyprland."
