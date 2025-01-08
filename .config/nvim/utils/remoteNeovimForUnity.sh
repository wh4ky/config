#!/usr/bin/env bash
# this file should be made executable and pointed to in `External Script Editor` in your Unity options.
# [Neovim Remote](https://github.com/mhinz/neovim-remote) must be installed for this script to work.

# The following should go into the `External Script Editor Args` in your Unity options.
#  --remote-silent +$(Line) $(File)

termemu="kitty"
nvr_session=$(nvr --serverlist | grep "Unity")

if [-z "$nvr_session"]; then
  $termemu -- nvr -s --servername Unity $@
  exit 0
fi

$termemu -- nvr --servername $nvr_session $@
