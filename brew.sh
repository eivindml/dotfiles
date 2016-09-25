#!/bin/bash

# Check if brew command exists
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed."
fi

# Make sure we’re using the latest Homebrew
# Upgrade any already-installed formulae
brew update
brew upgrade

brew install git
# This installs `npm` too using the recommended installation method
brew install node

# Get Cask
brew tap caskroom/cask

# Casks
brew cask install atom

# Remove outdated versions from the cellar
brew cleanup
