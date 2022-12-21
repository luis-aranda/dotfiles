-- Delete without copying into the register and replace with the contents in the current register
-- When using wsl install win32yank so the keymaps below work
vim.keymap.set('x', '<Leader>dp', "\"_dP", {})

-- Copy to system clipboard
vim.keymap.set('n', '<Leader>y', '\"+y', {})
vim.keymap.set('v', '<Leader>y', '\"+y', {})

-- Copy from system clipboard
vim.keymap.set('n', '<Leader>p', '\"+p', {})

-- open netrw
vim.keymap.set('n', '<Leader>pv', vim.cmd.Ex)

-- Move code in visual mode 
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Center the screen after moving half a page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Center the screen after moving to the next search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Abbreviations
vim.cmd[[iab _bash #! /usr/bin/env bash]]
