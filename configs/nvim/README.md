# 🌙 Aiko's Neovim Config

Minimal and modern Neovim configuration powered by LazyVim.

Designed for:

* C/C++ development
* Web development
* Linux workflow
* Clean and transparent UI

## ✨ Features

* Lazy.nvim plugin management
* Catppuccin Mocha theme
* Transparent background
* LSP support
* Mason package manager
* Treesitter syntax highlighting
* WhichKey integration
* Formatter & linter setup

## 📦 Included Tools

### Languages

* C / C++
* TypeScript
* JavaScript
* HTML
* CSS
* Lua
* JSON
* YAML

### LSP & Development

* clangd
* typescript-language-server
* tailwindcss-language-server
* lua-language-server
* eslint-lsp

### Formatter

* prettier
* stylua
* clang-format

### Debugger

* codelldb
* js-debug-adapter

## 🎨 Theme

* Catppuccin Mocha
* Transparent UI
* Rounded WhichKey window
* Minimal floating windows

## 📁 Structure

```txt
nvim/
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── LICENSE
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── example.lua
│       ├── mason.lua
│       ├── theme.lua
│       └── whichkey.lua
├── README.md
└── stylua.toml
```

## 🚀 Installation

```bash
git clone https://github.com/AikoAii/nvim ~/.config/nvim
```

Open Neovim:

```bash
nvim
```

Plugins and tools will install automatically.

## 🛠 Requirements

* Neovim >= 0.9
* Git
* Nerd Font
* ripgrep
* fd

## 📸 Preview

Add screenshots here.

## 📄 License

MIT
