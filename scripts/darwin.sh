#!/usr/bin/env bash

xcode-select --install

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # install brew

# Put brew packages in $PATH
echo >>$HOME/.zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"
