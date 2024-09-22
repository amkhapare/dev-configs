return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            -- vimgrep_arguments = {
            --     hidden = true,
            --     ignore = false,
            -- },
            pickers = {
                find_cmd = {
                    -- hidden = true,
                    -- no_ignore = true,
                },
                find_files = {
                    -- hidden = true,
                    -- no_ignore = true,
                },
                live_grep = {
                    -- hidden = true,
                },
            },
            extensions = {
                media_files = {
                    -- filetypes whitelist
                    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                    filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
                    -- find command (defaults to `fd`)
                    find_cmd = "rg",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),
                },
            },
        })
        telescope.load_extension("media_files")

        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        vim.keymap.set("n", "ff", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set(
            "n",
            "<S-m>",
            [[ <Esc><Cmd>Telescope media_files<CR> ]],
            { noremap = true, silent = true, expr = false }
        )
    end,
}
