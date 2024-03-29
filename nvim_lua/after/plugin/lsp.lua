local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
	"angularls",
	"cssls",
	"html",
	"jsonls",
	"pyright",
	"tailwindcss",
	"dockerls",
	"yamlls",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- start angular LSP when any of the 3 files are found
local util = require("lspconfig.util")
lsp.configure("angularls", {
	root_dir = util.root_pattern("nx.json", "angular.json", "project.json"),
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- if client.name == "eslint" then
	--     vim.cmd.LspStop('eslint')
	--     return
	-- end

	vim.keymap.set("n", "tD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "td", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "ti", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "tr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})

	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	buffer = bufnr,
	-- 	callback = function()
	-- 		vim.lsp.buf.format({ bufnr = bufnr })
	-- 	end,
	-- })
end)

lsp.detached = false

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
