vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    })

    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })
    use("matthewsimo/angular-vim-snippets")

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
    })
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-telescope/telescope-media-files.nvim")
    use("terrortylor/nvim-comment")
    use("jiangmiao/auto-pairs")
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

    use("kyazdani42/nvim-web-devicons")
    -- use("jose-elias-alvarez/null-ls.nvim")
    use("lukas-reineke/lsp-format.nvim")

    -- Git decorations
    use({
        "lewis6991/gitsigns.nvim",
        tag = "release", -- To use the latest release
    })

    use({ "mbbill/undotree" })

    use({
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    })
    use({ "kessejones/git-blame-line.nvim" })
    use({
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup({
                -- options
            })
        end,
    })
    use {
        'Equilibris/nx.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require("nx").setup {}
        end
    }
end)
