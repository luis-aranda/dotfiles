-- Jump to the previous problem/diagnostic
local function gotoPreviousProblem()
	if vim.g.vscode then
		require("vscode-neovim").action("editor.action.marker.prev")
	else
		pcall(vim.diagnostic.goto_prev)
	end
end

-- Jump to the next problem/diagnostic
local function gotoNextProblem()
	if vim.g.vscode then
		require("vscode-neovim").action("editor.action.marker.next")
	else
		pcall(vim.diagnostic.goto_next)
	end
end

-- View to the next problem/diagnostic view
local function showQuickfixList()
	if vim.g.vscode then
		require("vscode-neovim").action("workbench.panel.markers.view.focus")
	else
		pcall(vim.diagnostic.setloclist)
	end
end

-- Diagnostic keymaps
vim.keymap.set("n", "[d", gotoPreviousProblem, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", gotoNextProblem, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>e", showProblemView, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", showQuickfixList, { desc = "Open diagnostic [Q]uickfix list" })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. 
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[Create new lines in normal mode]]
vim.keymap.set("n", "<leader>o", "o<Esc>^Da<Esc>k", { desc = "[O]pen newline below", silent = true })
vim.keymap.set("n", "<leader>O", "O<Esc>^Da<Esc>j", { desc = "[O]pen newline above", silent = true })

-- View to the next problem/diagnostic view
local function showExplorer()
	if vim.g.vscode then
		require("vscode-neovim").action("workbench.view.explorer")
	else
		pcall(vim.cmd.Ex)
	end
end

-- Show Explorer
vim.keymap.set("n", "<leader>e", showExplorer, { desc = "Show [E]xplorer" })

-- [[VSCode Neovim keymaps]]
if vim.g.vscode then
	local function reloadVSCode()
		require("vscode-neovim").action("workbench.action.reloadWindow")
	end
	vim.keymap.set("n", "ZR", reloadVSCode, { desc = "[R]eload VSCode" })

	local function searchFiles()
		require("vscode-neovim").action("workbench.action.quickOpen")
	end
	vim.keymap.set("n", "<leader>sf", searchFiles, { desc = "[S]earch [F]iles" })

	local function searchWord()
		require("vscode-neovim").action("workbench.action.findInFiles")
	end
	vim.keymap.set("n", "<leader>sg", searchWord, { desc = "[S]earch by [G]rep" })

	local function searchRecentFiles()
		require("vscode-neovim").action("workbench.action.openRecent")
	end
	vim.keymap.set("n", "<leader>s.", searchRecentFiles, { desc = "[S]earch Recent Files" })

	local function searchEditors()
		require("vscode-neovim").action("workbench.action.showAllEditors")
	end
	vim.keymap.set("n", "<leader><leader>", searchEditors, { desc = "[ ] Find existing buffers" })

	local function searchCurrentEditor()
		require("vscode-neovim").action("actions.find")
	end
	vim.keymap.set("n", "<leader>/", searchCurrentEditor, { desc = "Search Current Editor " })

	-- local builtin = require("telescope.builtin")
	-- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	-- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
	-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
	-- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
	-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	-- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
	--
	-- -- It's also possible to pass additional configuration options.
	-- --  See `:help telescope.builtin.live_grep()` for information about particular keys
	-- vim.keymap.set("n", "<leader>s/", function()
	-- 	builtin.live_grep({
	-- 		grep_open_files = true,
	-- 		prompt_title = "Live Grep in Open Files",
	-- 	})
	-- end, { desc = "[S]earch [/] in Open Files" })
	--
	-- -- Shortcut for searching your Neovim configuration files
	-- vim.keymap.set("n", "<leader>sn", function()
	-- 	builtin.find_files({ cwd = vim.fn.stdpath("config") })
	-- end, { desc = "[S]earch [N]eovim files" })
end

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})