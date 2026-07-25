# tmux

My personal tmux configuration.

## Structure

tmux.conf
    Entry point.

options.conf
    General behavior.

keybinds.conf
    Keyboard shortcuts.

status.conf
    Status bar layout.

plugins.conf
    TPM and plugins.

themes/
    Theme-specific configuration.

## Installation

Clone the repository and symlink the directory to:

~/.config/tmux

Install TPM:

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Start tmux.

Press:

Prefix + I

to install plugins.

## Changing Themes

Replace the sourced theme in tmux.conf:

source-file ~/.config/tmux/themes/catppuccin.conf

with another theme file.

## Useful Shortcuts

Prefix + r
    Reload configuration.

Prefix + |
    Vertical split.

Prefix + -
    Horizontal split.

Prefix + c
    New window in current directory.

Prefix + (
    Previous session.

Prefix + )
    Next session.

