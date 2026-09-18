# Dev Configs

Personal development environment configuration files for macOS. Covers Neovim (AstroNvim), tmux, Ghostty, WezTerm, and ZSH.

## Structure

```
dev-configs/
├── astro_nvim/      # AstroNvim v5+ config (primary Neovim setup)
├── nvim/            # Legacy lazy.nvim Neovim config
├── tmux/
│   ├── tmux.conf    # tmux config with TPM plugins
│   ├── scripts/     # Project-specific tmux session launchers
│   └── plugins/     # TPM-managed plugins (git submodules)
├── ghostty/         # Ghostty terminal config
├── zsh/             # ZSH config with pure prompt
└── .wezterm.lua     # WezTerm terminal config
```

## Setup

Symlink configs into `~/.config` so each tool picks them up automatically:

```sh
ln -s ~/development/local-dev/dev-configs/astro_nvim ~/.config/nvim
ln -s ~/development/local-dev/dev-configs/tmux ~/.config/tmux
ln -s ~/development/local-dev/dev-configs/ghostty ~/.config/ghostty
ln -s ~/development/local-dev/dev-configs/.wezterm.lua ~/.wezterm.lua
```

> **Note:** The `nvim/` directory is an older config kept for reference. The active Neovim config is `astro_nvim/`.

## Neovim (AstroNvim)

Based on [AstroNvim v5+](https://github.com/AstroNvim/AstroNvim) with lazy.nvim for plugin management.

**Key plugins:**

| Plugin | Purpose |
|--------|---------|
| `astrocore` | Core mappings, options, autocommands |
| `astrolsp` | LSP config with format-on-save |
| `astroui` | UI customization |
| `mason` + `mason-tool-installer` | LSP/tool installer |
| `none-ls` | Null-ls sources (formatters/linters) |
| `opencode.nvim` | AI coding assistant integration |
| `diffview.nvim` | Git diff/history viewer |
| `gitsigns.nvim` | Git blame and hunk navigation |
| `treesitter` | Syntax highlighting |
| `rainbow-delimiters` | Bracket colorization |
| `astrocommunity` packs | Lua pack + AI recipes |

**opencode.nvim keymaps:**

| Key | Action |
|-----|--------|
| `<C-a>` | Ask opencode about current context |
| `<C-x>` | Execute an opencode action |
| `<C-.>` | Toggle opencode panel |
| `go` / `goo` | Add range / current line to opencode |

## tmux

Plugin manager: [TPM](https://github.com/tmux-plugins/tpm)

**Plugins:**
- `tmux-sensible` — sensible defaults
- `vim-tmux-navigator` — seamless pane navigation between vim and tmux
- `catppuccin/tmux` — catppuccin mocha status bar theme

**Session scripts** (`tmux/scripts/`): Each script creates a named tmux session pre-wired with windows for a specific project. Run a script to jump straight into a working environment with editors and dev servers open.

| Script | Session | Purpose |
|--------|---------|---------|
| `gc.sh` | `gc` | Project with thin env, dev servers, and editors |
| `mgmt.sh` | `MGMT` | Management project with opencode + Claude windows |
| `fm.sh` | `FM` | Furry/agents project with dev servers |
| `ai.sh` | `PDE-AI` | EAA workspace |
| `mine.sh` | — | Personal workspace |
| `leo.sh` | — | Leo project |
| `lke.sh` | — | LKE project |
| `cm.sh` | — | CM project |
| `zt.sh` | — | ZT project |

`util.sh` provides the shared `session_exists` helper used by all session scripts.

## Ghostty

Config at `ghostty/config`:
- Theme: Catppuccin Mocha (dark)
- Quick terminal toggle: `Ctrl+\``

## WezTerm

Config at `.wezterm.lua`:
- Theme: Tokyo Night
- Font: FiraCode Nerd Font, size 12 (`brew install font-fira-code-nerd-font`)
- Starts maximized, no tab bar

## ZSH

Config at `zsh/.zshrc`:
- Prompt: [pure](https://github.com/sindresorhus/pure) with yellow path, blue arrows, cyan branch
- Sources `~/.bashrc` if present

## Prerequisites

```sh
brew install neovim tmux fd ripgrep
brew install font-fira-code-nerd-font
```
