local M
M.surround_with = function(start, stop)
    -- Get the visual selection range
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    print(csrow, cscol)
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
    print(csrow, cscol)
    -- Adjust for the end of line selection behavior in visual mode
    if cscol > cecol then
        csrow, cerow = cerow, csrow
        cscol, cecol = cecol, cscol
    end

    if cerow == csrow then
        cecol = cecol + 1
    end

    -- Save and restore the cursor position
    local save_cursor = vim.api.nvim_win_get_cursor(0)

    -- Select the text
    vim.api.nvim_buf_set_text(0, csrow - 1, cscol - 1, csrow - 1, cscol - 1, { start })
    vim.api.nvim_buf_set_text(0, cerow - 1, cecol - 1, cerow - 1, cecol - 1, { stop })

    -- Restore the cursor position
    vim.api.nvim_win_set_cursor(0, save_cursor)
end

vim.keymap.set('v', '"', function() M.surround_with('"', '"') end, {})
vim.keymap.set('v', '(', function() M.surround_with('(', ')') end, {})

return M
