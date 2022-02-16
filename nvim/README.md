# Setup NeoVIM
**USE NODE 14**

1. Install neovim **brew install neovim**
2. clone repo.
3. create symblink **ln -s PATH_TO_YOUR_REPO/nvim ~/.configs/nvim**
4. Install [vim-plug](https://github.com/junegunn/vim-plug)
5. Open *~/.configs/nvim/init.vim* and run **:PlugInstall** to install all plugins.
6. Restart neovim.
7. Run *:checkhealth* and fix diagnostics outputs.
