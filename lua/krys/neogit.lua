local function double_control_c_to_save_quit()
    vim.keymap.set({ 'n', 'i' }, '<C-c><C-c>', ':wq<CR>', { buffer = 0 })
end

local group = vim.api.nvim_create_augroup("lsp-hooks", { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    group = group,
    pattern = "*/COMMIT_EDITMSG",
    callback = double_control_c_to_save_quit,
})
