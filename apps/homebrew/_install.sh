#!/bin/bash

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi

# Add taps
brew tap buo/cask-upgrade

# Installing brews and casks from Brewfile and Caskfile
cat Brewfile | xargs brew install
cat Caskfile | xargs brew cask install
