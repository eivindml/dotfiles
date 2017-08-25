#!/bin/bash

# Updates all software components of the system.

# Lists outdated updates and updates core macOS
softwareupdate --list
softwareupdate --install --all

# Updates local package list, lists outdated packages and upgrades them. Then does a cleanup.
brew update
brew outdated
brew upgrade
brew cleanup -s
# Diagnostics for a healty system
brew doctor
brew missing
# Brew cask
brew cask outdated
brew cu --all --cleanup
brew cask cleanup

# Mas: List outdated App Store apps and update them
mas outdated
mas upgrade

# Update global npm packages. Node and npm itself are updated through brew.
brew outdated -g
npm update -g

# List outdated gems, update RubyGems itself, update installed gems. Cleanup.
sudo gem outdated
sudo gem update --system
sudo gem update
sudo gem cleanup

# Update atom plugins without any questions
apm upgrade -c false

# Update latex pacakge manager and its packages
sudo tlmgr update --self
sudo tlmgr update --list
sudo tlmgr update --all
