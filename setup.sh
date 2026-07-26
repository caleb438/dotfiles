#!/usr/bin/env bash

export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source setup/utils.sh
source setup/menu.sh

main_menu
