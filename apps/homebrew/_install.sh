#!/bin/bash

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi

# Add taps
# For cask-upgrade functionality. 'brew cu'
brew tap buo/cask-upgrade
# For brew services functionality 'brew services start mysql'
brew tap homebrew/services

# Installing brews and casks from Brewfile and Caskfile
cat Brewfile | xargs brew install
cat Caskfile | xargs brew cask install
