#!/usr/bin/env bash

backup_existing_configs() {

  info "Backing up existing configurations..."

  local BACKUP_DIR="${HOME}/.config.bak-$(date +%Y%m%d-%H%M%S)"
  local BACKUP_MANIFEST=""
  local HAS_BACKUP=false
  local BACKUP_COUNT=0

  # ==========================================================
  # Iterate through repo configs
  # ==========================================================

  for source in "${DOTFILES_DIR}/configs/"*; do

    local name
    name="$(basename "$source")"

    local target="${HOME}/.config/${name}"

    # ------------------------------------------------------
    # Special case for standalone config files
    # ------------------------------------------------------

    if [[ "$name" == *.toml ]]; then
      target="${HOME}/.config/${name}"
    fi

    # ------------------------------------------------------
    # Backup existing target
    # ------------------------------------------------------

    if [[ -e "$target" || -L "$target" ]]; then

      # Lazy-create backup dir only when needed
      if [[ "$HAS_BACKUP" == false ]]; then

        mkdir -p "$BACKUP_DIR" ||
          error "Failed to create backup directory"

        BACKUP_MANIFEST="${BACKUP_DIR}/manifest.txt"

        HAS_BACKUP=true
      fi

      info "Backing up ${name}..."

      if mv "$target" "$BACKUP_DIR/"; then

        echo "$target" >>"$BACKUP_MANIFEST"
        ((BACKUP_COUNT++))
        ((BACKED_UP_ITEMS++))

        ok "Backed up ${name}"

      else
        error "Failed to backup ${name}"
      fi
    fi
  done
  # ==========================================================
  # Summary
  # ==========================================================

  if [[ "$HAS_BACKUP" == true ]]; then

    ok "Backup completed successfully."
    info "Backup location: ${BACKUP_DIR}"
    info "Items backed up: ${BACKUP_COUNT}"

  else

    info "No existing configurations required backup."
  fi

}
