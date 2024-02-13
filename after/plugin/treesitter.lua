require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = true,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
      enable = true,
      keymaps = {
          init_selection = "<C-v>",
          scope_incremental = "v",
          scope_decremental = "<BS>",
      }
  }
}
