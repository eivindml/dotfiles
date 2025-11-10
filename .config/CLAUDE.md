# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Architecture

This is a personal Neovim configuration in the process of being migrated from v1.0 to v2.0. The current structure is:

- `init.lua` - Main configuration entry point that sets up LSP, completion, key mappings, and plugins
- `lua/plugins.lua` - Plugin management using Packer
- `lua/settings.lua` - Core editor settings and options
- `colors/mist.lua` - Custom color scheme (currently empty)

## Key Configuration Components

### Plugin Management
Uses Packer (`wbthomason/packer.nvim`) for plugin management. Plugins auto-compile on save of `plugins.lua`.

### LSP Setup
Comprehensive LSP configuration with Mason for automatic installation:
- TypeScript/JavaScript: `ts_ls`, `eslint`
- Web: `emmet_ls`, `tailwindcss`, `html`, `cssls`
- Formatting: `biome` (auto-format on save)
- File extensions supported: `.ts`, `.tsx`, `.js`, `.jsx`, `.html`, `.css`, `.scss`, `.less`

### Key Mappings (Leader: Space)
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>nn` - Toggle NvimTree
- `<leader>no` - Focus NvimTree  
- `<leader>ff` - Telescope find files
- `<leader>fF` - Telescope live grep
- `<leader>S` - Open Spectre (global search/replace)
- `<leader>d` - Show diagnostics in floating window
- `<leader>n`/`<leader>p` - Next/previous diagnostic
- `<leader>r` - LSP rename
- `cA` - Code actions
- `K` - LSP hover
- `gd` - Go to definition

### Auto-formatting
- Prettier for TypeScript/TSX files on save
- Biome for JS/TS formatting  
- HTML formatting with Neoformat
- Lua formatting with stylua

### Development Features
- Auto-completion with nvim-cmp and GitHub Copilot integration
- TreeSitter syntax highlighting
- Auto-pairs and auto-tags for HTML/JSX
- Emmet support (leader: `,`)
- LazyGit integration
- File browser with Telescope
- Custom light theme with specific highlight colors

## File Structure Migration
The configuration is migrating from a more complex structure (with core/, plugins/configs/ directories) to a simplified structure. Many files have been deleted and consolidated into the current structure.