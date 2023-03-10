local neogit = require('neogit')
neogit.setup {
    disable_commit_confirmation = true
}

--- set key bindings to `COMMIT_EDITMSG`
local function double_control_c_to_save_quit()
    vim.keymap.set({ 'n', 'i' }, '<C-c><C-c>', '<cmd>wq<CR>', { buffer = true })
    vim.keymap.set({ 'n', 'i' }, '<C-c><C-k>', '<cmd>q!<CR>', { buffer = true })
end

local group = vim.api.nvim_create_augroup("lsp-hooks", { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    group = group,
    pattern = "*COMMIT_EDITMSG",
    callback = double_control_c_to_save_quit,
})
