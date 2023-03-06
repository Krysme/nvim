local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({ 'rust_analyzer' })


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
})


lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local hover_lsp_doc = false

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

local function lsp_highlight_document(client, bufnr)
    if client.supports_method "textDocument/documentHighlight" then
        local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

lsp.on_attach(function(client, bufnr)
    vim.opt_global.updatetime = 100
    lsp_highlight_document(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set("n", "<C-c><C-f>", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("i", "<C-c><C-f>", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "<leader>i", function() hover_lsp_doc = not hover_lsp_doc end, opts)





    -- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI', {
    --     pattern = { "*.rs", "*.c", "*.go", "*.lua" },
    --     group = vim.api.nvim_create_augroup('HighlightObject', { clear = true }),
    --     callback = function()
    --         pcall(vim.lsp.buf.clear_references)
    --         pcall(vim.lsp.buf.document_highlight)
    --         if hover_lsp_doc then
    --             pcall(vim.lsp.buf.hover)
    --         end
    --     end
    -- })
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --     pattern = { "*.rs", "*.c", "*.go", "*.lua" },
    --     group = vim.api.nvim_create_augroup('FormatBuffer', { clear = true }),
    --     callback = function()
    --         vim.lsp.buf.format()
    --     end
    -- })
end)





lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
