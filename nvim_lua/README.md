# Tested with
**USE NODE 14**
**nvim 0.6.1**

1. Install neovim **brew install neovim**
2. clone repo.
3. create symblink **ln -s PATH_TO_YOUR_REPO/nvim ~/.configs/nvim**
4. Install Packer **https://github.com/wbthomason/packer.nvim**
5. Run **:PackerSync** and **:PackerUpdate**
6. Run **npm i -g pyright eslint @angular/language-server vscode-langservers-extracted @tailwindcss/language-server typescript typescript-language-server neovim**
7. Run **brew install lua-language-server**
6. Run *:checkhealth* and fix diagnostics outputs.


#For any error check file
** ~/.cache/nvim/packer.nvim.log **

#Check for installed LSP
:LspInstallInfo
