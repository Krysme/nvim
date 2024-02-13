return {
	{ 'nvim-tree/nvim-tree.lua' },
	{ 'wbthomason/packer.nvim' },

	{ 'nvim-telescope/telescope.nvim' },
	dependencies = { 'nvim-lua/plenary.nvim' },

	{ 'nvim-telescope/telescope-file-browser.nvim' },
	{ 'gbrlsnchs/telescope-lsp-handlers.nvim' },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ 'stevearc/dressing.nvim' },
	{ 'julienvincent/nvim-paredit', },
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
	{ "numToStr/FTerm.nvim" },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'navarasu/onedark.nvim' },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {},
	},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{
		"j-hui/fidget.nvim",
		opts = { },
	},
    { "folke/neodev.nvim", opts = {} }
}




