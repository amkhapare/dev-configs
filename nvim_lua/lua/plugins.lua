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

--[[ Plug lua config

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')



vim.call('plug#end')

]]--

-- Packer: automatic bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- gruvbox color scheme
    use "ellisonleao/gruvbox.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
