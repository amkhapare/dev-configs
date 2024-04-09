require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "javascript", "typescript", "angular" },
    highlight = { enable = true },
    indent = { enable = true }
})
