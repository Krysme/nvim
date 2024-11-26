-- local util = require("krys.util")

vim.g.mapleader = ' '
vim.keymap.set('n', 'q', '<nop>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>')


vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

vim.keymap.set('n', '<C-h>', '^')
vim.keymap.set('n', '<C-j>', '5j')
vim.keymap.set('n', '<C-k>', '5k')
vim.keymap.set('n', '<C-l>', '$')
vim.keymap.set('n', '<C-e>', '5<C-e>')
vim.keymap.set('n', '<C-f>', 'zzzv')
vim.keymap.set('n', '<leader><leader>', '<cmd>nohl<cr>')
vim.keymap.set("n", "<leader>p", '"+p')

vim.keymap.set('v', '<C-h>', '^')
vim.keymap.set('v', '<C-j>', '5j')
vim.keymap.set('v', '<C-k>', '5k')
vim.keymap.set('v', '<C-l>', '$')
vim.keymap.set('v', '<C-e>', '5<C-e>')

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])


-- Save file
vim.keymap.set('n', '<C-s>', ':w<cr>')



vim.keymap.set('n', '<C-x><C-c>', ':wqa<CR>')

-- Window jumping
vim.keymap.set('n', '<leader>k', function()
    vim.cmd('bn')
    vim.cmd('bd#')
end)

vim.keymap.set('n', '<leader>wo', '<C-w>o')
vim.keymap.set('n', '<leader>wl', '<C-w>l')
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')

-- open file explorer
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>f', '<cmd>Telescope file_browser<cr>')
vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<C-c>l', builtin.diagnostics)
vim.keymap.set('n', '<leader>mg', function() require('neogit').open({ cwd = "%:p:h" }) end)
vim.keymap.set('n', '<leader>r', builtin.oldfiles)
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

if vim.g.neovide then
    vim.keymap.set('n', '<C-4>', require('FTerm').toggle, {})
    vim.keymap.set('t', '<C-4>', require('FTerm').toggle, {})
else
    vim.keymap.set('n', '<C-\\>', require('FTerm').toggle, {})
    vim.keymap.set('t', '<C-\\>', require('FTerm').toggle, {})
end

vim.keymap.set('n', '<C-4>', require('FTerm').toggle, {})
vim.keymap.set('t', '<C-4>', require('FTerm').toggle, {})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {})

vim.keymap.set("n", "<leader>,r", builtin.live_grep, {})

local function font_scale(opt)
    if opt and opt.factor then
        local new_scale = vim.g.neovide_scale_factor * opt.factor
        if new_scale > 0.99 and new_scale < 1.01 then
            new_scale = 1
        end
        vim.g.neovide_scale_factor = new_scale
    else
        vim.g.neovide_scale_factor = 1
    end
end

vim.opt.linespace = 3

vim.keymap.set({ 'i', 'n', 'v' }, '<C-=>', function() font_scale({ factor = 1.1 }) end, {})
vim.keymap.set({ 'i', 'n', 'v' }, '<C-->', function() font_scale({ factor = 1 / 1.1 }) end, {})
vim.keymap.set({ 'i', 'n', 'v' }, '<C-0>', font_scale, {})
vim.api.nvim_create_user_command('RestoreFontScale', font_scale, {})

local function toggle_full_screen()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end

vim.keymap.set({ 'i', 'n', 'v' }, '<F11>', toggle_full_screen, {})
vim.api.nvim_create_user_command('ToggleFullScreen', toggle_full_screen, {})

vim.g.neovide_fullscreen = false
