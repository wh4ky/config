--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
--  NOTE: Leader is set as space.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.g.have_nerd_font = false -- Set to true if you have a Nerd Font installed and selected in the terminal
vim.o.relativenumber = true

-- [[ Options ]]
require("options")

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("lazy-plugins")
