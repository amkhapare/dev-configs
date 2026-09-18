return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      -- pass --hidden and --no-ignore to ripgrep for live_grep
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--no-ignore",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
    },
  },
}
