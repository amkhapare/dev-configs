local lspconfig = require 'lspconfig'

require("lsp-format").setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client)
    require("lsp-format").on_attach(client)
end

lspconfig.gopls.setup({ on_attach = on_attach })
lspconfig.lua_ls.setup({ on_attach = on_attach })
lspconfig.angularls.setup({ on_attach = on_attach })
lspconfig.bashls.setup({ on_attach = on_attach })

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
    capabilities = capabilities,
}

lspconfig.cssmodules_ls.setup {}

lspconfig.docker_compose_language_service.setup {}

lspconfig.dockerls.setup {}

lspconfig.emmet_language_server.setup {}

lspconfig.emmet_ls.setup {}

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

lspconfig.graphql.setup {}

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities,
}

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup {
    capabilities = capabilities,
}

lspconfig.custom_elements_ls.setup {}
