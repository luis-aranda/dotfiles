local g = vim.g

-- If running VsCode with Neovim
if g.vscode then
    -- [[Reload VSCode]]
    local function reloadVSCode()
        vim.fn.VSCodeNotify("workbench.action.reloadWindow")
    end
    vim.keymap.set("n", "ZR", reloadVSCode, { desc = "Reload VSCode Window" })

    -- [[Open File Explorer]]
    local function openFileExplorer()
        vim.fn.VSCodeNotify("workbench.view.explorer")
    end
    vim.keymap.set("n", "<leader>e", openFileExplorer, { desc = "Open File Explorer" })

    -- [[Find in Files]]
    local function findFiles()
        vim.fn.VSCodeNotify("workbench.action.quickOpen")
    end
    vim.keymap.set("n", "<leader>ff", findFiles, { desc = "Find in Files" })

    -- [[Open New File]]
    local function newFile()
        vim.fn.VSCodeNotify("workbench.action.files.newUntitledFile")
    end
    vim.keymap.set("n", "<leader>fn", newFile, { desc = "New File" })

    -- [[Open Terminal]]
    local function openTerminal()
        vim.fn.VSCodeNotify("workbench.action.terminal.focus")
    end
    vim.keymap.set("n", "<leader>ft", openTerminal, { desc = "Open Terminal" })

    -- [[Open Recent Files]
    local function openRecentFiles()
        vim.fn.VSCodeNotify("workbench.action.openRecent")
    end
    vim.keymap.set("n", "<leader>fr", openRecentFiles, { desc = "Open Recent Files" })

    -- [[Show all open Editors]]
    local function showAllEditors()
        vim.fn.VSCodeNotify("workbench.action.showAllEditors")
    end
    vim.keymap.set("n", "<leader>fb", showAllEditors, { desc = "Show all editors" })

    -- [[Search in all Editors]]
    local function liveGrep()
        vim.fn.VSCodeNotify("workbench.action.findInFiles")
    end
    vim.keymap.set("n", "<leader>sg", liveGrep, { desc = "Show all editors" })

    -- [[Toggle Comment on normal and visual mode]]
    local function toggleComment()
        vim.fn.VSCodeNotify("editor.action.commentLine")
    end
    vim.keymap.set({ "n", "v" }, "gcc", toggleComment, { desc = "Toggle Comment" })

    -- Keymaps specific to Neovim
else
    -- [[Open netrw]]
    vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = "[e] Open explorer" })

    -- [[Open Lazy]]
    vim.keymap.set('n', '<leader>l', "<cmd>Lazy<cr>", { desc = "[l] Lazy" })

    -- [[New File]]
    vim.keymap.set('n', '<leader>fn', "<cmd>enew<cr>", { desc = "New File" })

    -- [[Open Terminal]]
    vim.keymap.set('n', '<leader>ft', "<cmd>terminal<cr>", { desc = "Open Terminal" })

    -- [[Remap space to no-op: do nothing ]]
    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

    -- [[Remap for dealing with word wrap]]
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- [[Open Find Files]]
    vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })

    -- [[Open Recent]
    vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[F]ind [R]ecent' })

    -- [[Find Buffers]
    vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind [B]uffers' })

    -- [[Find in current Buffer]]
    vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search [G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits, { desc = 'Search [G]it [C]ommits' })
    vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'Search [G]it [B]ranches' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
end

-- Keymaps that work on both VsCode and Neovim

-- Delete without copying into the register and replace with the contents in the current register
-- When using wsl install win32yank so the keymaps below work
vim.keymap.set('x', '<leader>dp', "\"_dP", { desc = '[dp] Delete without copying' })

-- [[Copy to system clipboard]]
vim.keymap.set({ 'n', 'v' }, '<leader>y', '\"+y', { desc = '[y] Yank to clipboard' })

-- [[Paste the contents from the system clipboard]]
vim.keymap.set({ 'n', 'x' }, '<leader>pp', '\"+p', { desc = '[p] Paste from clipboard' })

-- [[Highlight on yank]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- [[Create new lines in normal mode]]
vim.keymap.set('n', '<leader>o', "o<Esc>^Da<Esc>k", { desc = '[O]pen newline below', silent = true })
vim.keymap.set('n', '<leader>O', "O<Esc>^Da<Esc>j", { desc = '[O]pen newline above', silent = true })

-- [[How to use the Windows clipboard from WSL]] https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
-- g.clipboard = {
--     name = 'WslClipboard',
--     copy = {
--         ["+"] = 'clip.exe',
--         ["*"] = 'clip.exe',
--     },
--     paste = {
--         ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--         ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0
-- }

-- Dismiss Noice Message
vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })
