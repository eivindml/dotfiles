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

# Remove all brews
# brew remove --force $(brew list)

brew install git
# This installs `npm` too using the recommended installation method
brew install node
# Handles app store downloads
brew install mas
brew install lftp
brew install heroku
brew instapp php70
brew install composer
# mysql
brew install mariadb
# valet
composer global require laravel/valet
valet install
# Wordpress comand line interface & stuff
brew install homebrew/php/wp-cli


# Get Cask
# brew tap caskroom/cask

# Casks
brew cask install atom
brew cask install 1password
brew cask install google-chrome
brew cask install dropbox
brew cask install transmit
brew cask install github-desktop
brew cask install droplr
brew cask install java
brew cask install slack
brew cask install transmission
brew cask install sketch
brew cask install caskroom/cask/sequel-pro

# Remove outdated versions from the cellar
brew cleanup
