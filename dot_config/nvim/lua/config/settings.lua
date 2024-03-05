local g = vim.g
local opt = vim.opt
local o = vim.o

-- Set the leader key to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Show line numbers
opt.number = true
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = "a"

-- Every wrapped line will continue visually indented
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight the searc while typing
opt.incsearch = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
-- o.updatetime = 250
-- o.timeoutlen = 300

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- Enables 24-bit RGC color in the TUI
opt.termguicolors = true

-- Split windows to the bottom
opt.splitbelow = true

-- Split windows to the right
opt.splitright = true
