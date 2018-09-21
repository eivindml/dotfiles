#!/bin/bash

# Homebrew Brews & Casks
################################################################################

which -s brew
if [[ $? != 0 ]] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Installing brews and casks
cat Brewfile | xargs brew install
cat Caskfile | xargs brew cask install

# Mac App Store Apps
################################################################################

which -s mas
if [[ $? != 0 ]] ; then
  echo "Install mas with homebrew first. ☠️"
  return
fi

grep "^[^#]" Masfile | xargs mas install

# Node Pacakges
################################################################################

which -s node
if [[ $? != 0 ]] ; then
	echo "Install node with homebrew first. ☠️"
	return
fi

cat Npmfile | xargs npm install -g

# Ruby Gems
################################################################################

which -s gem
if [[ $? != 0 ]] ; then
    echo "Install ruby/gem with homebrew first. ☠️"
    return
fi

cat Gemfile | xargs sudo gem install

# Custom
################################################################################

# Sketchtool
sh /Applications/Sketch.app/Contents/Resources/sketchtool/install.sh
