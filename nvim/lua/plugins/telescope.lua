return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config=function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })
        require('telescope').setup({
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        -- ["<C-h>"] = "which_key"
                    },
                },
            },
            layout_strategy = "vertical",
            layout_config = {
                height = 2,
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
                find_files = {
                    hidden = false,
                    theme = "dropdown",
                }
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        })
    end
}
