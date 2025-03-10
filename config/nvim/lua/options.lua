vim.o.compatible = false

-- Show matching brackets
vim.o.showmatch = true

-- Case insensitive search
vim.o.ignorecase = true

-- Middle-click paste with mouse
vim.o.mouse = "v"

-- Highlight search results
vim.o.hlsearch = true

-- Incremental search
vim.o.incsearch = true

-- Number of columns occupied by a tab
vim.o.tabstop = 2

-- See multiple spaces as tabstops so <BS> does the right thing
vim.o.softtabstop = 2

-- Convert tabs to white space
vim.o.expandtab = true

-- Width for autoindents
vim.o.shiftwidth = 2

-- Indent a new line the same amount as the line just typed
vim.o.autoindent = true

-- Add line numbers
vim.wo.number = true

-- Get bash-like tab completions
vim.o.wildmode = "longest,list"

-- Set an 80 column border for good coding style
vim.o.cc = "80"

-- Allow auto-indenting depending on file type
vim.cmd("filetype plugin indent on")

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable mouse click
vim.o.mouse = "a"

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Highlight current cursor line
vim.wo.cursorline = true

-- Speed up scrolling in Neovim
vim.o.ttyfast = true

-- Enable spell check (uncomment if needed)
-- vim.o.spell = true

-- Disable creating swap file (uncomment if needed)
-- vim.o.swapfile = false
