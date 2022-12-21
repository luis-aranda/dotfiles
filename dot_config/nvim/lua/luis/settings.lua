local g = vim.g
local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

-- Set the leader key to space
g.mapleader = ' '

-- Colorscheme
vim.cmd[[colorscheme tokyonight]]
