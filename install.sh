#!/usr/bin/env bash

# The following code is derived from Oh My Zsh
# https://github.com/ohmyzsh/ohmyzsh
# Licensed under the MIT License.

# Start of borrowed code

# Make sure important variables exist if not already defined
#
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"

# End of borrowed code

OS=$(uname)
ARCH=$(uname -m)
# Set config directory
CONFIGDIR=$HOME/.config
# Set OhMyZsh install directory
ZSH=$CONFIGDIR/ohmyzsh # If you change this, also change the ZSH variable in ./config/zsh/zshrc

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

printhelp() {
  cat <<EOF
Available arguments:
  -h    This help dialog.
  -r    Setup for remote (aimed at old Ubuntu-based servers or GitHub codespaces).
EOF
}

main() {
  while getopts "rh" opt; do
    case $opt in
    r) bash ./scripts/codespace.sh ;;
    \?)
      printhelp
      exit 1
      ;;
    :)
      printhelp
      exit 1
      ;;
    esac
  done

  echo "Detected OS: $OS $ARCH"

  exit 0
  # Set up for different distros
  case $OS in
  "Darwin")
    cp -vr ./config/nvim $CONFIGDIR/nvim
    cp -v ./config/zsh/zshrc $HOME/.zshrc
    if [ $ARCH = "arm64" ]; then
      bash scripts/darwin.sh
    else
      echo "Only Apple Silicon is supported."
    fi
    ;;

  "Linux")
    LINUX=$(grep '^NAME=' /etc/os-release | cut -d '=' -f 2)
    LINUX=${LINUX//\"/}
    echo "Detected distribution: $LINUX"

    cp -vr ./config/foot $CONFIGDIR/foot
    cp -vr ./config/hypr $CONFIGDIR/hypr
    cp -vr ./config/nvim $CONFIGDIR/nvim
    cp -v ./config/zsh/zshrc $HOME/.zshrc
    ;;
  *)
    echo "Unknown os!"
    ;;
  esac
}
main "$@"
exit 0
