#!/usr/bin/env bash

show_install_summary() {

  step "Installation Summary"

  printf "%-24s %s\n" "Packages installed:" "${INSTALLED_PACKAGES}"
  printf "%-24s %s\n" "Symlinks created:" "${CREATED_SYMLINKS}"
  printf "%-24s %s\n" "Configs backed up:" "${BACKED_UP_ITEMS}"
  printf "%-24s %s\n" "Services enabled:" "${ENABLED_SERVICES}"
  printf "%-24s %s\n" "Warnings:" "${INSTALL_WARNINGS}"
  printf "%-24s %ss\n" "Install duration:" "${INSTALL_DURATION:-0}"

  echo ""

  ok "Installation completed."
}
