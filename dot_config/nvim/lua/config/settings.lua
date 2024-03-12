local g = vim.g
local opt = vim.opt

-- Set the leader key to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Show line numbers
opt.number = true
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = "a"

-- Every wrapped line will continue visually indented
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight the searc while typing
opt.incsearch = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- Enables 24-bit RGC color in the TUI
opt.termguicolors = true

-- Split windows to the bottom
opt.splitbelow = true

-- Split windows to the right
opt.splitright = true
