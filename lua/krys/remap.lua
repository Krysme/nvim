vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

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
vim.keymap.set('n', '<leader><leader>', ':nohl<cr>')

vim.keymap.set('v', '<C-h>', '^')
vim.keymap.set('v', '<C-j>', '5jzzzv')
vim.keymap.set('v', '<C-k>', '5kzzzv')
vim.keymap.set('v', '<C-l>', '$')
vim.keymap.set('v', '<C-e>', '5<C-e>')
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])


-- Save file
vim.keymap.set('n', '<C-s>', ':w<cr>')



vim.keymap.set('n', '<C-x><C-c>', ':wqa<CR>')

-- Window jumping
vim.keymap.set('n', '<leader>k', '<CMD>bd<cr>')
vim.keymap.set('n', '<leader>wo', '<C-w>o')
vim.keymap.set('n', '<leader>wl', '<C-w>l')
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')

-- open file explorer
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>f', '<cmd>Telescope file_browser<cr>')
vim.keymap.set('n', '<leader>md', builtin.diagnostics)
vim.keymap.set('n', '<leader>mg', '<cmd>Neogit<cr>')
vim.keymap.set('n', '<leader>r', builtin.oldfiles)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<C-4>', require('FTerm').toggle, {})
vim.keymap.set('t', '<C-4>', require('FTerm').toggle, {})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {})

vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

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

vim.keymap.set({ 'i', 'n', 'v' }, '<C-=>', function() font_scale({ factor = 1.1 }) end, {})
vim.keymap.set({ 'i', 'n', 'v' }, '<C-->', function() font_scale({ factor = 1 / 1.1 }) end, {})
vim.api.nvim_create_user_command('RestoreFontScale', font_scale, {})
