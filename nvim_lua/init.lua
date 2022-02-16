--set noerrorbells
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true
vim.o.smartindent=true
vim.o.relativenumber=true
vim.o.nu=true
vim.o.wrap=false
-- vim.o.noswapfile=true
vim.o.undodir="~/.vim/undodir"
vim.o.undofile=true
vim.o.incsearch=true
vim.o.backspace="indent,eol,start"
-- vim.o.path+=**
-- vim.o.wildignore+=**/node_modules/**
vim.o.updatetime=100
vim.o.hlsearch=false
vim.o.scrolloff=10
--vim.o.g:netrw_preview   = 1
--vim.o.g:netrw_liststyle = 3
--vim.o.g:netrw_winsize   = 30
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode

--Setup with Plug
-- vim.cmd([[colorscheme gruvbox]])


packer = require('plugins')
packer.startup(function(use)
	--All configurations go here
	
	vim.cmd([[colorscheme gruvbox]])
end)

require'lspconfig'.pyright.setup{}
