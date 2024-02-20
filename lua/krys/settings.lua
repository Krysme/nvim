vim.o.mouse = "a"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.autochdir = true
vim.opt.timeoutlen = 10000
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 5
vim.o.fileformats = 'unix'





vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true

local wayland_env = os.getenv("WAYLAND_DISPLAY")

if wayland_env ~= nil then
    vim.o.guifont = "Jetbrains Mono:h15"
else
    vim.o.guifont = "Jetbrains Mono:h10"
end

-- for NeoVide
vim.g.neovide_scale_factor = 1.0
vim.opt.linespace = 0
-- vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_antialiasing = true
vim.o.guifont = "JetBrains Mono:h15"
vim.g.neovide_transparency = 1
