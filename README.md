<p align="center">
  <img src=".meta/assets/banner.png" width="75%" alt="Nuroneko Shell Banner">
</p>

<h1 align="center">Nuroneko Shell</h1>

<p align="center">
  A modular and aesthetic Hyprland environment for Arch & Artix Linux.
</p>

<p align="center">
  Wayland-native • Cross-init • Keyboard-driven • Maintainable
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#preview">Preview</a> •
  <a href="#installation">Installation</a> •
  <a href="#repository-structure">Structure</a> •
  <a href="#keybindings">Keybindings</a>
</p>

---

## About

Nuroneko Shell is a clean and modular desktop environment built around Hyprland.

The project focuses on:

* Maintainable configuration architecture
* Safe and reproducible installation
* Wayland-native tooling
* Cross-init compatibility
* Keyboard-driven workflows
* Consistent Catppuccin Mocha styling

Designed primarily for Arch Linux and Artix Linux users.

---

## Features

* Modular Hyprland configuration architecture
* Cross-init support:

  * systemd
  * OpenRC
  * runit
  * dinit
* Distro-aware package management
* Safe symlink orchestration
* Automatic configuration backup system
* Runtime reload support
* Wayland-native ecosystem
* Catppuccin Mocha integration
* Minimal and keyboard-focused workflow

---

## Preview

<p align="center">
  <img src=".meta/assets/preview.png" width="100%" alt="Nuroneko Shell Preview">
</p>

---

## Core Components

| Component        | Application            |
| ---------------- | ---------------------- |
| Window Manager   | Hyprland               |
| Status Bar       | Waybar                 |
| Launcher         | Fuzzel / Rofi Wayland  |
| Terminal         | Kitty                  |
| Shell            | Fish / Zsh             |
| Notifications    | SwayNC / Mako          |
| OSD              | SwayOSD                |
| File Manager     | Yazi                   |
| Audio Stack      | PipeWire + WirePlumber |
| System Utilities | Fastfetch, Btop, Cava  |

---

## Supported Distributions

| Distribution | Status       |
| ------------ | ------------ |
| Arch Linux   | Supported    |
| Artix Linux  | Supported    |
| Fedora       | Experimental |

Artix Linux support includes:

* OpenRC
* runit
* dinit

---

## Installation

### Clone Repository

```bash
git clone https://github.com/AikoAii/nuroneko-shell.git ~/.config/nuroneko-shell
cd ~/.config/nuroneko-shell
```

### Make Installer Executable

```bash
chmod +x install.sh
```

### Run Installer

```bash
./install.sh
```

---

## Installer Workflow

The installer automatically:

* Detects your Linux distribution
* Installs required dependencies
* Creates configuration backups
* Applies symlinks safely
* Configures services dynamically
* Reloads supported components

Existing configurations are backed up automatically before installation.

For Arch and Artix Linux users, installing an AUR helper such as `yay` or `paru` is recommended.

---

## Repository Structure

```text
configs/    Application configurations
scripts/    Installers and utility scripts
packages/   Distribution package manifests
themes/     Shared themes, palettes, and wallpapers
docs/       Additional documentation
.meta/      Repository assets and branding
```

---

## Keybindings

The workflow is designed around the `SUPER` modifier.

Useful references:

* `docs/keybinds.md`
* `SUPER + SHIFT + /`

---

## Installer Features

* Official repository & AUR package separation
* Cross-init service abstraction
* Safe symlink management
* Runtime component reload support
* Non-destructive installation flow
* Modular installation architecture

---

## Project Status

Current status: Public Beta

Feedback, bug reports, issues, and pull requests are welcome.

---

## Credits

Projects and communities that inspired or power this setup:

* Hyprland
* Catppuccin
* Waybar
* Fuzzel
* Kitty

---

## License

Released under the MIT License.
