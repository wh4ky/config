#!/usr/bin/env bash

OS=$(uname)
ARCH=$(uname -m)
CONFIGDIR=""

if [ "$XDG_CONFIG_HOME" = "" ]; then
  echo "XDG_CONFIG_HOME not found, using $HOME/.config/"
  CONFIGDIR=$HOME/.config/
else
  CONFIGDIR=$XDG_CONFIG_HOME
fi

echo "Detected OS: $OS $ARCH"

# Set up for different distros
case $OS in
"Darwin")
  cp -vr ./config/nvim $CONFIGDIR/nvim
  cp -v ./config/zsh/zshrc $HOME/.zshrc
  if [ $(uname -m) = "arm64" ]; then
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

  case $LINUX in
  "Ubuntu")
    bash scripts/codespace.sh
    ;;
  esac
  ;;

*)
  echo "unknown os, exiting"
  exit 0
  ;;
esac

exit 0
