# dotfiles

## Why?
The aim is to create a dotfile setup that configures my entire macOS system.

## How?
- Changes macOS settings through defaults writes.
- Symlinks .dotfiles to ~.
- Installs nececary binaries through brew and node/npm.
- Installs .app applications through brew cask.
- Update entire system through `update.sh`.

### atom
Package List
You use the following:

`apm list --installed --bare > package-list.txt`
to create your package list and then apm install --packages-file package-list.txt to install them.
