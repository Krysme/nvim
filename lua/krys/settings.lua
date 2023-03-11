vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.autochdir = true
vim.opt.timeoutlen = 10000





vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true


local wayland_env = os.getenv("WAYLAND_DISPLAY")

if wayland_env ~= nil then
    vim.o.guifont = "Jetbrains Mono:h15"
else
    -- X11 with a smaller font
    vim.o.guifont = "Jetbrains Mono:h10"
end

-- for NeoVide
vim.g.neovide_scale_factor = 1.0
vim.opt.linespace = 0
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_antialiasing = true
