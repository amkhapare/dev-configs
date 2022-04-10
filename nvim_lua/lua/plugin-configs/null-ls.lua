local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local completion = require("null-ls").builtins.completion
require("null-ls").setup({
    sources = {
        formatting.stylua,
        formatting.black,
        formatting.prettier,
        diagnostics.eslint,
        completion.spell,
    },
})
