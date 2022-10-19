-- Delete without copying into the register and replace with the contents in the current register
vim.keymap.set('x', '<Leader>dp', "\"_dP", {})

-- Copy to system clipboard
vim.keymap.set('n', '<Leader>y', '\"+y', {})
vim.keymap.set('v', '<Leader>y', '\"+y', {})

-- Copy from system clipboard
vim.keymap.set('n', '<Leader>p', '\"+p', {})
