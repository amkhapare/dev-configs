return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "angularls",
                "bashls",
                "cssmodules_ls",
                "dockerls",
                "docker_compose_language_service",
                "eslint",
                "emmet_language_server",
                -- "gopls",
                "html",
                "jsonls",
                "tsserver",
                "marksman",
                "pyright",
                "svelte",
                "tailwindcss",
                "somesass_ls"
            },
        }
    end
}, {
    "neovim/nvim-lspconfig",
    dependencies = { "lukas-reineke/lsp-format.nvim" },
    config = function()
        local lspconfig = require('lspconfig')
        local util = require("lspconfig.util")

        require("lsp-format").setup({})

        local on_attach = function(client)
            require("lsp-format").on_attach(client)
        end


        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },

        })
        lspconfig.angularls.setup({
            root_dir = util.root_pattern("nx.json", "angular.json", "project.json"),
            on_attach = on_attach
        })
        lspconfig.bashls.setup({})
        lspconfig.cssmodules_ls.setup({})
        lspconfig.dockerls.setup({})
        lspconfig.docker_compose_language_service.setup({})
        lspconfig.eslint.setup({
                on_attach = on_attach
            -- on_attach = function(client, bufnr)
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            -- buffer = bufnr,
            -- command = "EslintFixAll",
            -- })
            -- end,

        })
        lspconfig.emmet_language_server.setup({})
        -- lspconfig.gopls.setup({})
        lspconfig.html.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.marksman.setup({})
        lspconfig.pyright.setup({})
        lspconfig.svelte.setup({})
        lspconfig.tailwindcs.setup({})
        lspconfig.somesass_ls.setup({})

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'tD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'td', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'ti', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
}
