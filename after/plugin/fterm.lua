local status_ok, fterm = pcall(require, "FTerm")
if not status_ok then
    return
end

if vim.fn.has('win32') == 1 then
    vim.opt.shellcmdflag = '-c'
end

fterm.setup({
    border     = 'double',
    dimensions = {
        height = 0.9,
        width = 0.9,
        x = 0.5,
        y = 0.5
    },
})
