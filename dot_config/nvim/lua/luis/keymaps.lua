local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})

-- Fuzzy find in current buffer sorting to match the order of the actual file
vim.keymap.set('n', '<Leader>fc', '<Cmd> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending <CR>', {})

-- Delete without copying into the register and replace with the contents in the current register
vim.keymap.set('x', '<Leader>p', "\"_dP", {})

-- Copy to system clipboard
vim.keymap.set('n', '<Leader>y', '\"+y', {})
vim.keymap.set('v', '<Leader>y', '\"+y', {})

-- Copy from system clipboard
vim.keymap.set('n', '<Leader>p', '\"+p', {})
