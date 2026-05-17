#!/usr/bin/env bash
# scripts/utils/lib.sh — Shared helper library
# Source this file at the top of any script:
#   source "$(dirname "$(realpath "$0")")/../utils/lib.sh"

# ==============================================================
# Colors
# ==============================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ==============================================================
# Logging
# ==============================================================
info()    { echo -e "${BLUE}[INFO]${NC}  $*"; }
ok()      { echo -e "${GREEN}[ OK ]${NC}  $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error()   { echo -e "${RED}[ERR ]${NC}  $*" >&2; exit 1; }
step()    { echo -e "\n${BOLD}${CYAN}==> $*${NC}"; }

# ==============================================================
# Dependency checks
# ==============================================================
require() {
    local cmd="$1"
    if ! command -v "$cmd" &>/dev/null; then
        error "Required command not found: $cmd"
    fi
}

require_any() {
    for cmd in "$@"; do
        if command -v "$cmd" &>/dev/null; then
            return 0
        fi
    done
    error "None of the required commands found: $*"
}

# ==============================================================
# Desktop notifications (optional, non-fatal)
# ==============================================================
notify() {
    local title="$1"
    local body="${2:-}"
    if command -v notify-send &>/dev/null; then
        notify-send "$title" "$body" 2>/dev/null || true
    fi
}

# ==============================================================
# Safe file helpers
# ==============================================================
safe_symlink() {
    local src="$1"
    local dst="$2"
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        warn "Skipping symlink — $dst exists and is not a symlink"
        return 1
    fi
    ln -sf "$src" "$dst"
}

ensure_dir() {
    local dir="$1"
    [[ -d "$dir" ]] || mkdir -p "$dir"
}
