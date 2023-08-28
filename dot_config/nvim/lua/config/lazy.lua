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

-- Setup plugins with lazy for regular Neovim
if not g.VSCode then
  require("lazy").setup {
    spec = {
      { import = "plugins" },
    }
  }

-- Setup plugins with lazy for Vscode Neovim
else
  require("lazy").setup({
    { 'echasnovski/mini.surround', version = '*', config = true }
  })
end
