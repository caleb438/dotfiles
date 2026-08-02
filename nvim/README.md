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

## Appearance

Theme:
Petrol (custom theme)

Font: UbuntuMono Nerd Font Mono

Icons:
nvim-web-devicons

---

## License
MIT


