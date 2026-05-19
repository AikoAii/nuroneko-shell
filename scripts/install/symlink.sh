#!/usr/bin/env bash

create_symlinks() {
  info "Creating symlinks..."

  ensure_dir "${HOME}/.config"
  ensure_dir "${HOME}/.local/bin"

  # --- Symlink configs ---
  for conf in "${DOTFILES_DIR}/configs/"*; do

    local target="${HOME}/.config/$(basename "$conf")"

    if safe_symlink "$conf" "$target"; then
    info "Symlinked $(basename "$conf")"
    ((CREATED_SYMLINKS++))
fi

  done

  # --- Symlink scripts ---
  for script_dir in "${DOTFILES_DIR}/scripts/"*; do

    [[ -d "$script_dir" ]] || continue

    [[ "$(basename "$script_dir")" == "install" ]] && continue

    for script in "$script_dir"/*; do

      [[ -f "$script" && -x "$script" ]] || continue

      local target="${HOME}/.local/bin/$(basename "$script")"

      if safe_symlink "$script" "$target"; then
        info "Symlinked script $(basename "$script")"
        ((CREATED_SYMLINKS++))
      fi

    done
  done

  ok "Symlinks created successfully."

}
