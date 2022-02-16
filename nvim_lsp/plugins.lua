--[[
call plug#begin('~/.vim/plugged')

    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'tomtom/tcomment_vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'sindrets/diffview.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

call plug#end()
]]--

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')



vim.call('plug#end')
