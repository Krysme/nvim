require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "rust",
        "bash", "python", "yaml", "make", "cmake",
        "ini", "markdown", "git_config", "gitignore", "ssh_config" },
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
