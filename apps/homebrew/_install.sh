#!/bin/bash

#
# Check if Homebrew is installed
#
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi

# Installing brews from Brewfile
cat Brewfile | xargs brew install

# Installing casks form Caskfile
cat Caskfile | xargs brew cask install
