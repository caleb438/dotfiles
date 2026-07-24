# Neovim Configuration

My personal Neovim configuration built from scratch using lazy.nvim

---

## Features
- Lazy loading
- Native LSP
- Treesitter
- Blink completion
- Oil file explorer
- Git integration
- Custom status line

---

## Installation

### Prerequisites
- Neovim 0.12+
- Git
- Nerd Font
- ripgrep
- fd (optional)

### Clone

```
git clone https://github.com/caleb438/neovim-dotfiles.git
```

---

## Plugin Overview

### lazy.nvim

Plugin manager

Chose lazy.nvim because of the nice file system and lazy loading.
You can a seperate file for each of the plugins.
Lazy loading keeps startup times down.

---

### Oil

File explorer

Let's you edit directories like a buffer.
Allows for fast, simple editing of many files and directoires.

Custom keymaps:
<leader>pv : open directory

---

### Treesitter

Builds syntax trees allowing for syntax highlighting, and other cool features.

---

### LSP

Handles features like code completion, error detection, etc.

Mason.nvim allows for easy downloading of language servers, formatters, and linters.

Blink.cmp provides code completion using the tab key

Fidget.nvim adds window for LSP progress status

nvim-lspconfig helps combine everything together

---

## Directory Layout

```
lua/
    config/
    plugins/
init.lua
README.md
```

---

## Important Keybindings

| Key | Action |
|------|--------|
| <leader>ff | Find files (including hidden) |
| <leader>fg | Live grep |
| <leader>pv | Open Oil |
| gd | Go to Definition |
| <leader>gf | Format current buffer|

---

## Appearance

Theme:
Catppuccin Mocha

Font: UbuntuMono Nerd Font Mono

Icons:
nvim-web-devicons

---

## License
MIT


