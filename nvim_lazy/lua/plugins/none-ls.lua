return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				require("none-ls.formatting.eslint"),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.completion.spell,
			},
			on_attach = function(client, bufnr)
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							print("formatting buf")
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>hf", vim.lsp.buf.format, {})
	end,
}
