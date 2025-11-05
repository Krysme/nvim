local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)


vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {},
    },
})
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'clangd', 'lua_ls' },
    handlers = {
        lsp_zero.default_setup,
    }
})

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['rust_analyzer'] = { 'rust' },
        ['clangd'] = { 'c', 'cpp' },
        ['lua_ls'] = { 'lua' },
    }
})




local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

    })
})
--
local function lsp_autocmd(client, buffer)
    local group_name = string.format('lsp-hook-%d', buffer)
    local group = vim.api.nvim_create_augroup(group_name, { clear = true })
    if client.supports_method 'textDocument/documentHighlight' then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = group,
            buffer = buffer,
            callback =
                function()
                    vim.lsp.buf.document_highlight()
                end
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = buffer,
            callback = vim.lsp.buf.clear_references,
        })
    end
end


local function lsp_attach(client, bufnr)
    vim.opt_global.updatetime = 200
    lsp_autocmd(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set({ 'n', 'i' }, "<C-c><C-c>", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>o", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    vim.keymap.set("n", "[r", vim.lsp.buf.rename, opts)

    vim.keymap.set("n", "<C-c><C-f>", vim.lsp.buf.format, opts)
    vim.keymap.set("i", "<C-c><C-f>", vim.lsp.buf.format, opts)
end

lsp_zero.on_attach(lsp_attach)
