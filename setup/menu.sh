#!/usr/bin/env bash

source "$DOTFILES_DIR/setup/apps/neovim.sh"
source "$DOTFILES_DIR/setup/apps/tmux.sh"
source "$DOTFILES_DIR/setup/apps/ohmyposh.sh"

main_menu() {

  while true; do
    print_header

    echo "1) Check system"
    echo "2) Dependencies"
    echo "3) Applications"
    echo "4) Configure dotfiles"
    echo "5) Quit"
    echo

    read -rp "Choice: " choice

    case "$choice" in
    1) status_menu ;;
    2) dependency_menu ;;
    3) application_menu ;;
    4) configure_menu ;;
    5) exit ;;
    *)
      echo "Invalid choice."
      pause
      ;;
    esac
  done
}

status_menu() {

  print_header

  echo "Applications"
  echo "------------"
  echo

  echo "Neovim"
  neovim_status
  echo

  echo "tmux"
  tmux_status
  echo

  echo "Oh My Posh"
  omp_status
  echo

  pause
}

application_menu() {

  while true; do

    print_header

    echo "Applications"
    echo
    echo "1) Neovim"
    echo "2) tmux"
    echo "3) Oh My Posh"
    echo "4) Back"
    echo

    read -rp "Choice: " choice

    case "$choice" in
    1) neovim_menu ;;
    2) tmux_menu ;;
    3) omp_menu ;;
    4) return ;;
    *)
      echo "Invalid choice."
      pause
      ;;
    esac

  done
}

configure_menu() {

  while true; do

    print_header

    echo "Configure Dotfiles"
    echo
    echo "1) Neovim"
    echo "2) tmux"
    echo "3) Oh My Posh"
    echo "4) Configure Everything"
    echo "5) Back"
    echo

    read -rp "Choice: " choice

    case "$choice" in
    1) neovim_configure ;;
    2) tmux_configure ;;
    3) omp_configure ;;
    4)
      neovim_configure
      tmux_configure
      omp_configure
      ;;
    5) return ;;
    *)
      echo "Invalid choice."
      pause
      ;;
    esac

  done
}

dependency_menu() {

  print_header

  echo "Dependencies"
  echo
  echo "Coming soon."

  pause
}
