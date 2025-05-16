return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "rust",
                "json",
                "lua",
                "javascript",
                "typescript",
                "angular",
                "java",
                "bash",
                "markdown",
            },
            ignore_install = {},
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
