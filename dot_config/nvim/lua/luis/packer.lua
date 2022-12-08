return require('packer').startup(function()

	--Packer can manage itself
	use 'wbthomason/packer.nvim'

	--Telescope and dependencies
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                          , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
	}

	--Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = false }
	}

	--Color scheme
	use 'folke/tokyonight.nvim'

	--vim surround
	use 'tpope/vim-surround'

    --lspconfig
    use 'neovim/nvim-lspconfig'

end)
