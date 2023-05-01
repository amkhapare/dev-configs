# Tested with

**USE NODE 16**
**nvim 0.8.1**

1. Install neovim **brew install neovim**
2. clone repo.
3. create symblink **ln -s PATH_TO_YOUR_REPO/nvim ~/.configs/nvim**
4. Install Packer **https://github.com/wbthomason/packer.nvim**
5. Run **:PackerSync** and **:PackerUpdate**
6. Run _:checkhealth_ and fix diagnostics outputs.
7. _brew install imagemagick_ // to preview svg in file search

#For any error check file
** ~/.cache/nvim/packer.nvim.log **

#Check for installed LSP
:LspInstallInfo

#For available LSPs check
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
