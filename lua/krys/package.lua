return {
    { 'nvim-tree/nvim-tree.lua' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'gbrlsnchs/telescope-lsp-handlers.nvim' },
    { "rose-pine/neovim",                          name = "rose-pine" },
    { 'stevearc/dressing.nvim' },
    { 'julienvincent/nvim-paredit', },
    {
        'NeogitOrg/neogit',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        }
    },
    { "numToStr/FTerm.nvim" },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'navarasu/onedark.nvim' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                "lazy.nvim",
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0,
            })
        end,
    },
    { 'L3MON4D3/LuaSnip' },
    {
        "j-hui/fidget.nvim",
        opts = {},
    }
}
