vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Remaps for the refactoring operations currently offered by the plugin
-- vim.api.nvim_set_keymap(
--     "v",
--     "<leader>re",
--     [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )
-- vim.api.nvim_set_keymap(
--     "v",
--     "<leader>rf",
--     [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )
-- vim.api.nvim_set_keymap(
--     "v",
--     "<leader>rv",
--     [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )
-- vim.api.nvim_set_keymap(
--     "v",
--     "<leader>ri",
--     [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )

-- Extract block doesn't need visual mode
-- vim.api.nvim_set_keymap(
--     "n",
--     "<leader>rb",
--     [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )
-- vim.api.nvim_set_keymap(
--     "n",
--     "<leader>rbf",
--     [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
-- vim.api.nvim_set_keymap(
--     "n",
--     "<leader>ri",
--     [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
--     { noremap = true, silent = true, expr = false }
-- )

-- nx
-- vim.keymap.set("n", "<leader>ng", require("nx.generators").generators, { desc = "[N]x [G]enerators" })
