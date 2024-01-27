vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'gbrlsnchs/telescope-lsp-handlers.nvim'
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use { 'stevearc/dressing.nvim' }
    use { 'monkoose/matchparen.nvim' }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use "numToStr/FTerm.nvim"
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            use { 'j-hui/fidget.nvim' }
        }
    }
    use {
        'kosayoda/nvim-lightbulb',
        --requires = 'antoinemadec/FixCursorHold.nvim',
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }


    use { 'nvim-lua/lsp-status.nvim' }

    use { -- Theme inspired by Atom
        'navarasu/onedark.nvim',
        config = function()
            vim.cmd.colorscheme 'onedark'
        end,
    }

    use({
        "folke/neodev.nvim",
        config = function()
            require('neodev').setup()
        end
    })
end)
