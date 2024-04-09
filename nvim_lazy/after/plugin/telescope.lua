local telescope = require("telescope")
telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			hidden = true,
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
	},
})
telescope.load_extension("media_files")


local builtin = require("telescope.builtin")
vim.keymap.set("n", "<S-f>", builtin.find_files, {})
vim.keymap.set("n", "ff", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<S-m>", [[ <Esc><Cmd>Telescope media_files<CR> ]], { noremap = true, silent = true, expr = false })

