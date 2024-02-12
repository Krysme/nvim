return {
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
        opts = {} 
    },
}




