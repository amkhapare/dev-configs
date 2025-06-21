-- vim.o.mouse = false
--set noerrorbells
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.relativenumber = true
vim.o.nu = true

vim.o.wrap = false
-- vim.o.noswapfile=true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.backspace = "indent,eol,start"
-- vim.o.path+=**
-- vim.o.wildignore+=**/node_modules/**
vim.o.updatetime = 100

vim.o.hlsearch = false
vim.o.scrolloff = 10
--vim.o.g:netrw_preview   = 1
--vim.o.g:netrw_liststyle = 3
-- vim.o.g:netrw_winsize = 30
vim.o.termguicolors = true
-- vim.o.background = "dark" -- or "light" for light mode
vim.o.colorcolumn = "80"

-- directory explorer
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {
	noremap = true,
	silent = true,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("i", "jj", "<ESC>", {
	noremap = true,
	silent = true,
})
