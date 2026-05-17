#!/usr/bin/env bash

backup_existing_configs() {
    info "Backing up existing configurations..."

    local BACKUP_DIR="${HOME}/.config.bak-$(date +%Y%m%d-%H%M%S)"

    mkdir -p "$BACKUP_DIR"

    # --- Iterate through repo configs ---
    for source in "${DOTFILES_DIR}/configs/"*; do

        local name
        name="$(basename "$source")"

        local target="${HOME}/.config/${name}"

        # Special case for single files like starship.toml
        if [[ "$name" == *.toml ]]; then
            target="${HOME}/.config/${name}"
        fi

        if [[ -e "$target" || -L "$target" ]]; then
            info "Backing up ${name}..."

            mv "$target" "$BACKUP_DIR/" \
                || error "Failed to backup ${name}"
        fi
    done

    ok "Backup created at ${BACKUP_DIR}"
}
