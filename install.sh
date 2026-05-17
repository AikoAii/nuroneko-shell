#!/usr/bin/env bash
set -euo pipefail

# AikoAi Dotfiles Installer
# A modular, safe installer for Hyprland dotfiles

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES_DIR

# Define Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export NC='\033[0m'

# Logger functions
export LOG_INFO="[ ${BLUE}INFO${NC} ]"
export LOG_OK="[  ${GREEN}OK${NC}  ]"
export LOG_WARN="[ ${YELLOW}WARN${NC} ]"
export LOG_ERROR="[ ${RED}FAIL${NC} ]"

info() { echo -e "${LOG_INFO} $1"; }
ok() { echo -e "${LOG_OK} $1"; }
warn() { echo -e "${LOG_WARN} $1"; }
error() { echo -e "${LOG_ERROR} $1"; exit 1; }
export -f info ok warn error

info "Starting Dotfiles Installation..."

# Source modular scripts
source "${DOTFILES_DIR}/scripts/install/detect-distro.sh"
source "${DOTFILES_DIR}/scripts/install/dependencies.sh"
source "${DOTFILES_DIR}/scripts/install/backup.sh"
source "${DOTFILES_DIR}/scripts/install/symlink.sh"
source "${DOTFILES_DIR}/scripts/install/fonts.sh"
source "${DOTFILES_DIR}/scripts/install/services.sh"
source "${DOTFILES_DIR}/scripts/install/permissions.sh"
source "${DOTFILES_DIR}/scripts/install/finalize.sh"

detect_distro
install_dependencies
backup_existing_configs
create_symlinks
install_fonts
setup_services
set_permissions
finalize_install

ok "Installation completed successfully!"
