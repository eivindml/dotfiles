#!/bin/bash

# Make sure the folder is root
cd $(dirname $0)

# TODO: Simplify this file so that a function does everything
# TODO: Add comment support for all files
# TODO: Get highlighting of files, and add icons to them

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install brews, casks, macos apps, node packages and gems
grep "^[^# ]" Brewfile | xargs brew install
grep "^[^# ]" Caskfile | xargs brew cask install
grep "^[^# ]" Masfile | xargs mas install
grep "^[^# ]" Npmfile | xargs npm install -g
grep "^[^# ]" Gemfile | xargs sudo gem install
