local g = vim.g

-- Bootstrap Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins for VScode extension
if g.vscode then
  require("lazy").setup({
    { 'echasnovski/mini.surround', version = '*', config = true }
  })

  -- Setup plugins for ordinary Neovim
else
  require("lazy").setup {
    spec = {
      { import = "plugins" },
    }
  }
end
