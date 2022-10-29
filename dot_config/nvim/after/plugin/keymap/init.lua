-- Delete without copying into the register and replace with the contents in the current register
-- When using wsl install win32yank so the keymaps below work
vim.keymap.set('x', '<Leader>dp', "\"_dP", {})

-- Copy to system clipboard
vim.keymap.set('n', '<Leader>y', '\"+y', {})
vim.keymap.set('v', '<Leader>y', '\"+y', {})

-- Copy from system clipboard
vim.keymap.set('n', '<Leader>p', '\"+p', {})
