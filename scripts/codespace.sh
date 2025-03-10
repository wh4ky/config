#!/usr/bin/env bash

echo "Updating"
sudo apt-get update
sudo apt-get install build-essential

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < <(yes "\n") # install brew

# Put brew packages in $PATH
echo >>$HOME/.zshrc
echo >>$HOME/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>$HOME/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>$HOME/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install gcc nvim tree-sitter
