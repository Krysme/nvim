local actions = require('telescope.actions')

local telescope = require('telescope')

local mappings = {
    i = {
        ['<C-g>'] = actions.close,
        ['<Tab>'] = actions.select_default,
    },
}




local fb_actions = require "telescope".extensions.file_browser.actions
telescope.setup({
    defaults = { mappings = mappings },
    extensions = {
        file_browser = {
            mappings = {
                i = {
                    ['<C-l>'] = fb_actions.goto_parent_dir
                },
                n = {
                    ['<C-l>'] = fb_actions.goto_parent_dir
                }
            }
        }
    }
})


telescope.load_extension "file_browser"




