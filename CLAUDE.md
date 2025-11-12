# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages shell configuration, Neovim setup, tmux configuration, and custom scripts through symlinks to the home directory.

## Installation & Setup

The repository uses a shell script to create symlinks from the dotfiles directory to the home directory:

```bash
./init.sh
```

**Warning**: This script will:
- Prompt for each dotfile before symlinking
- Delete existing files in `$HOME` if you choose to overwrite
- Skip `.git`, `.gitignore`, and `.DS_Store` automatically

## Repository Structure

### Shell Configuration (Zsh)
- `.zshrc` - Main zsh configuration with vi mode, history, prompt (vcs_info), and plugin loading
- `.zsh/envs.zsh` - Environment variables (gitignored)
- `.zsh/aliases.zsh` - Shell aliases
- `.zsh/functions.zsh` - Custom shell functions
- `.zsh/plugins/` - Zsh plugins (fast-syntax-highlighting, zsh-autosuggestions)

**Key Zsh Features**:
- Vi mode with custom cursor shapes (block in normal, beam in insert)
- Large history (120M commands) with immediate append and sharing
- Custom prompt with git branch info via vcs_info
- Loads nvm, pyenv, and custom PATH extensions

**Important Aliases**:
- `vim` → `nvim`
- `dev` → cd to `~/Developer/`
- `dat` → bat with GitHub theme

**Useful Functions** (see `.zsh/functions.zsh`):
- `listfuncs` - List all available functions
- `prettyjson` - Pretty print JSON with bat
- `jsontondjson` - Convert JSON array to newline-delimited JSON
- `converttocsv` / `dnbtoynab` - Financial data converters
- `metatags` / `linktags` - Extract meta/link tags from URLs

### Tmux Configuration
- `.tmux.conf` - Tmux configuration with custom keybindings and styling
- `.tmux/plugins/tmux-resurrect` - Session persistence plugin

**Key Tmux Bindings**:
- Prefix: `Ctrl+Space`
- `|` - Split horizontal
- `-` - Split vertical
- `F3` - Enter copy mode (vi bindings enabled)
- `Alt+Arrow` - Resize panes (repeatable with prefix)
- Status bar at top, color239 theme
- Mouse support enabled
- Auto-save/restore sessions on close/start

### Neovim Configuration
- `.config/nvim/` - Neovim configuration (migrating from v1.0 to v2.0)
- `.config/nvim/init.lua` - Main config entry point
- `.config/nvim/lua/plugins.lua` - Packer plugin management
- `.config/nvim/lua/settings.lua` - Editor settings

**IMPORTANT**: The `.config/nvim/` directory should NOT contain a `.git` directory. It was originally cloned from NvChad but should be tracked directly in this repository, not as a submodule.

**Neovim Architecture**:
- Uses Packer for plugin management
- Mason for LSP server auto-installation
- Leader key: `Space`
- LSP servers: ts_ls, eslint, emmet_ls, tailwindcss, html, cssls, biome
- Auto-formatting with Prettier and Biome on save
- Copilot integration for completion

**Key Neovim Bindings** (see `.config/CLAUDE.md` for full details):
- `<leader>w` - Save
- `<leader>nn` - Toggle NvimTree
- `<leader>ff` - Telescope find files
- `<leader>fF` - Telescope live grep
- `<leader>r` - LSP rename
- `gd` - Go to definition

### Custom Scripts & Binaries
- `bin/` - Executable scripts in PATH
  - `macos-init` - macOS system initialization script
  - `password` - Password utility
  - `archive` - Archive utility
- `scripts/` - Additional scripts in PATH
  - AppleScript utilities for Mail, Safari
  - Video/image processing helpers

### FlexGet Configuration
- `.flexget/` - FlexGet RSS/torrent automation
- `.flexget/config.yml` - Main configuration (references variables.yml)
- `.flexget/variables.yml` - Credentials and secrets (gitignored)

FlexGet is configured to automatically download TV series from RSS feeds to Transmission.

## Working with Neovim Config

When modifying Neovim configuration:

1. **Never commit a `.git` directory** inside `.config/nvim/` - if one appears, remove it with `rm -rf .config/nvim/.git`
2. The `.config/nvim/.gitignore` controls what's tracked:
   - Tracks: `custom/`, `after/`, `ftplugin/`, `syntax/`, `lazy-lock.json`
   - Ignores: `plugin/` (generated), `spell/*.add.spl`, `.luarc.json`
3. Plugin configurations auto-compile on save of `plugins.lua`
4. Keep `.config/CLAUDE.md` updated with architecture changes

## Path Configuration

The following directories are added to PATH (in `.zshrc`):
- `~/.local/bin`
- `~/scripts` (symlinked from this repo)
- `~/.dotnet`
- Pyenv shims
- NVM

## File Naming Conventions

- Kebab case for file names (as per user's global CLAUDE.md)
- Zsh config files use `.zsh` extension
- Lua files for Neovim use `.lua` extension

## Important Notes

- **Sensitive files gitignored**: `.zsh/envs.zsh`, `.flexget/variables.yml`
- **Vim vs Neovim**: `vim` alias points to `nvim`, always use Neovim
- **Tmux sessions**: Auto-restored on tmux server start via resurrect plugin
- **Symlink workflow**: All dotfiles are symlinked, not copied, so edits in `~` affect this repo
