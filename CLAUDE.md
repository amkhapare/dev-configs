# CLAUDE.md

This repo is a personal dotfiles/config collection for macOS. All configs are meant to be symlinked into `~/.config/` — nothing here is built or compiled.

## Repo layout

```
astro_nvim/          # Active Neovim config (AstroNvim v5+, lua)
nvim/                # Legacy Neovim config — kept for reference, not active
tmux/
  tmux.conf          # Main tmux config
  scripts/           # Bash scripts that create project tmux sessions
  plugins/           # TPM plugins as git submodules
ghostty/config       # Ghostty terminal settings
zsh/.zshrc           # ZSH settings
.wezterm.lua         # WezTerm settings
```

## Key conventions

- **Active Neovim config is `astro_nvim/`**, not `nvim/`. The `nvim/` directory is a legacy config.
- **Lua files in `astro_nvim/lua/plugins/` that start with `if true then return {} end`** are disabled example files from the AstroNvim template — they are intentionally inert unless that guard line is removed.
- **tmux session scripts** in `tmux/scripts/` each source `util.sh` for the `session_exists` helper. They use project-specific shell aliases (`gc`, `fm`, `mgmt`, `ew`, etc.) that are defined in the user's shell environment, not in this repo.
- **No build step** — changes take effect when the symlinked tool is restarted/reloaded.

## Working with AstroNvim config

- Plugin files live in `astro_nvim/lua/plugins/`. Each file returns a lazy.nvim spec table.
- `community.lua` imports AstroCommunity packs — currently `pack.lua` (Lua) and `recipes.ai`.
- `opencode.lua` wires the `opencode.nvim` AI plugin with keymaps (`<C-a>`, `<C-x>`, `<C-.>`, `go`/`goo`).
- To add a new plugin: create a new file in `astro_nvim/lua/plugins/` returning a lazy spec. No registration needed — AstroNvim auto-discovers files in that directory.
- `lazy-lock.json` tracks exact plugin versions. Update it intentionally with `:Lazy update` inside Neovim.

## Working with tmux scripts

- Each script in `tmux/scripts/` follows the same pattern: check `session_exists`, create a new session, set up named windows with send-keys, then attach.
- Scripts assume the user's shell aliases resolve project directories. Don't inline absolute paths into these scripts.
- `util.sh` must be sourced before calling `session_exists`. All scripts already do this via `source $HOME/development/local-dev/dev-configs/tmux/scripts/util.sh`.

## Symlink paths

The expected symlink targets are:

```sh
~/.config/nvim       -> .../dev-configs/astro_nvim
~/.config/tmux       -> .../dev-configs/tmux
~/.config/ghostty    -> .../dev-configs/ghostty
~/.wezterm.lua       -> .../dev-configs/.wezterm.lua
```

The old `README.md` references `nvim_lsp` — that is outdated; the correct target is `astro_nvim`.

## Active setup — scope of changes

**Only `astro_nvim/` and `tmux/` are in active use.** All other configs (`nvim/`, `ghostty/`, `zsh/`, `.wezterm.lua`) are present for reference but not actively maintained. Any request to change editor, terminal, or shell behaviour should be applied exclusively to `astro_nvim/` and/or `tmux/` — never to the other directories unless the user explicitly names them.

## What not to do

- Don't add comments explaining what Lua/tmux config options do — the config files should stay clean.
- Don't create new files unless adding a genuinely new tool config or tmux session script.
- Don't modify files inside `tmux/plugins/` — those are third-party submodules.
- Don't touch `nvim/`, `ghostty/`, `zsh/`, or `.wezterm.lua` for any change request — they are out of scope.
