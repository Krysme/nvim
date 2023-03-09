local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({ 'rust_analyzer', 'clangd' })


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
})


require "fidget".setup {}

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

local function lsp_autocmd(client, bufnr)
    local group = vim.api.nvim_create_augroup("lsp-hooks", { clear = true })
    if client.supports_method "textDocument/documentHighlight" then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = bufnr,
            callback =
                function()
                    vim.lsp.buf.document_highlight()
                    --       vim.lsp.buf.hover()
                end
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format() end,
    })
end


local function lsp_attach(client, bufnr)
    vim.opt_global.updatetime = 200
    lsp_autocmd(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set({ 'n', 'i' }, "<C-c><C-c>", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>o", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "[r", vim.lsp.buf.rename, opts)

    vim.keymap.set("n", "<C-c><C-f>", vim.lsp.buf.format, opts)
    vim.keymap.set("i", "<C-c><C-f>", vim.lsp.buf.format, opts)
end

lsp.on_attach(lsp_attach)



require('nvim-lightbulb').setup({
    -- LSP client names to ignore
    -- Example: {"sumneko_lua", "null-ls"}
    ignore = {},
    sign = {
        enabled = false,
        priority = 10,
    },
    float = {
        enabled = false,
        text = "💡",
        win_opts = {},
    },
    virtual_text = {
        enabled = true,
        -- Text to show at virtual text
        -- text = "💡",
        text = "💡",
        -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
        hl_mode = "replace",
    },
    status_text = {
        enabled = false,
        -- Text to provide when code actions are available
        text = "💡",
        -- Text to provide when no actions are available
        text_unavailable = ""
    },
    autocmd = {
        enabled = true,
        -- see :help autocmd-pattern
        pattern = { "*" },
        -- see :help autocmd-events
        events = { "CursorHold", "CursorHoldI" }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})



local nvim_lsp = require 'lspconfig'


nvim_lsp.rust_analyzer.setup({
    on_attach = lsp_attach,
    settings = {
            ["rust-analyzer"] = {

            procMacro = {
                enable = true
            },
        }
    }
})
