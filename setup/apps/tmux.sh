tmux_status() {

  if command -v tmux >/dev/null; then
    echo "Installed"
    tmux -V
  else
    echo "Not installed"
  fi

  echo

  echo "Configuration:"
  check_symlink \
    "$DOTFILES_DIR/tmux" \
    "$HOME/.config/tmux"
}

tmux_install() {

  cmd='
    sudo apt update

    sudo apt install -y tmux
  '

  run_commands "$cmd"

}

tmux_configure() {
  preview_symlink \
    "$DOTFILES_DIR/tmux" \
    "$HOME/.config/tmux"
}

tmux_menu() {
  show_application_menu \
    "tmux" \
    tmux_status \
    "APT package" \
    tmux_install \
    tmux_configure
}
