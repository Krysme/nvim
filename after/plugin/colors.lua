
local function set_color_scheme(color)
    color = color or 'onedark'
    vim.cmd.colorscheme(color)
end

set_color_scheme()
