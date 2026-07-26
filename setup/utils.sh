#!/usr/bin/env bash

print_header() {
  clear
  echo "=================================="
  echo "========= Dotfiles Setup ========="
  echo "=================================="
  echo
}

pause() {
  echo
  read -rp "Press Enter to continue..."
}

confirm() {
  echo
  read -rp "Continue? [y/N] " answer

  [[ "$answer" =~ ^[Yy]$ ]]
}

run_commands() {

  local cmd="$1"

  while true; do

    print_header

    echo "The following commands will be run:"
    echo "-----------------------------------"
    echo
    printf "%s\n" "$cmd"
    echo
    echo "-----------------------------------"
    echo

    echo "1) Run"
    echo "2) Back"
    echo

    read -rp "Choice: " choice

    case "$choice" in
    1)
      eval "$cmd"
      if eval "$cmd"; then
        echo
        echo "✓ Completed successfully."
      else
        echo
        echo "✗ Command failed."
      fi

      pause
      pause
      return
      ;;
    2)
      return
      ;;
    *)
      echo "Invalid choice."
      pause
      ;;
    esac

  done
}

preview_symlink() {
  local source="$1"
  local destination="$2"

  echo
  echo "Source"
  echo "$source"

  echo
  echo "Destination"
  echo "$destination"

  echo

  cmd="
        rm -rf \"$destination\"

        mkdir -p \"$(dirname "$destination")\"

        ln -s \"$source\" \"$destination\"
    "

  run_commands "$cmd"
}

show_application_menu() {
  local title="$1"
  local status_fn="$2"
  local install_description="$3"
  local install_fn="$4"
  local configure_fn="$5"

  while true; do

    print_header

    echo "$title"
    printf '%*s\n' "${#title}" '' | tr ' ' '-'
    echo

    "$status_fn"

    echo
    echo "Installation Method"
    echo "-------------------"
    echo "$install_description"

    echo
    echo "1) Install"
    echo "2) Configure"
    echo "3) Back"
    echo

    read -rp "Choice: " choice

    case "$choice" in
    1) "$install_fn" ;;
    2) "$configure_fn" ;;
    3) return ;;
    *)
      echo "Invalid choice."
      pause
      ;;
    esac

  done
}


check_symlink() {

    local source="$1"
    local destination="$2"

    if [ ! -e "$destination" ] && [ ! -L "$destination" ]; then
        echo "Not configured"
        return
    fi

    if [ ! -L "$destination" ]; then
        echo "Exists, but is not a symlink"
        return
    fi

    local target
    local expected

    target=$(realpath "$destination")
    expected=$(realpath "$source")

    if [ "$target" = "$expected" ]; then
        echo "Configured"
    else
        echo "Symlink points elsewhere"
        echo "  Current: $target"
        echo "  Expected: $expected"
    fi
}
