neovim_status() {

  if command -v nvim >/dev/null; then
    echo "Installed"
    nvim --version | head -n1
  else
    echo "Not installed"
  fi

  echo

  echo "Configuration:"
  check_symlink \
    "$DOTFILES_DIR/nvim" \
    "$HOME/.config/nvim"
}

neovim_install() {

  cmd='
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage

    chmod +x nvim-linux-x86_64.appimage

    sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
  '

  run_commands "$cmd"

}

neovim_configure() {
  preview_symlink \
    "$DOTFILES_DIR/nvim" \
    "$HOME/.config/nvim"
}

neovim_menu() {
  show_application_menu \
    "Neovim" \
    neovim_status \
    "Latest AppImage from GitHub Releases" \
    neovim_install \
    neovim_configure
}
