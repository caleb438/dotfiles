omp_status() {

  if command -v oh-my-posh >/dev/null; then
    echo "Installed"
    oh-my-posh version
  else
    echo "Not installed"
  fi

  echo

  echo "Configuration:"
  check_symlink \
    "$DOTFILES_DIR/ohmyposh" \
    "$HOME/.config/ohmyposh"
}

omp_install() {

  cmd='
    mkdir -p ~/bin

    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin
  '

  run_commands "$cmd"

}

omp_configure() {
  preview_symlink \
    "$DOTFILES_DIR/ohmyposh" \
    "$HOME/.config/ohmyposh"
}

omp_menu() {
  show_application_menu \
    "Oh My Posh" \
    omp_status \
    "Official install script" \
    omp_install \
    omp_configure
}
