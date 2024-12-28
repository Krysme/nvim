require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "bash", "python", "yaml", "make" },
    ignore_install = {},
    modules = {},
    sync_install = true,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            scope_incremental = "v",
        }
    }
}
