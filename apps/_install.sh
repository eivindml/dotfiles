#!/bin/bash

# Homebrew Brews & Casks
################################################################################

if ! type "brew" ; then
	which -s brew
	if [[ $? != 0 ]] ; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	# Add taps for services, and old php compatible with Craft
	brew tap homebrew/services
	# brew tap homebrew/homebrew-php # tap is deprecated

	# Installing brews and casks
	cat Brewfile | xargs brew install
	cat Caskfile | xargs brew cask install
else
	echo "❎  brew is already installed"
fi

# Mac App Store Apps
################################################################################

if ! type "mas" ; then
	which -s mas
	if [[ $? != 0 ]] ; then
	  echo "‼️ Install mas with homebrew first. ☠️"
	  return
	fi

	grep "^[^#]" Masfile | xargs mas install
else
	echo "❎  mas is already installed"
fi

# Node Pacakges
################################################################################

if ! type "npm" ; then
	which -s node
	if [[ $? != 0 ]] ; then
		echo "‼️ Install node with homebrew first. ☠️"
		return
	fi

	cat Npmfile | xargs npm install -g
else
	echo "❎  npm is already installed"
fi

# Ruby Gems
################################################################################
if ! type "gem" ; then

which -s gem
	if [[ $? != 0 ]] ; then
	    echo "‼️ Install ruby/gem with homebrew first. ☠️"
	    return
	fi

	cat Gemfile | xargs sudo gem install
else
	echo "❎  gem/ruby is already installed"
fi

# LaTeX Packages
################################################################################

if ! type "tlmgr" ; then
	which -s tlmgr
	if [[ $? != 0 ]] ; then
	    echo "‼️ Install basictex/mactex or just tlmgr using homebrew first. ☠️"
	    return
	fi

	cat Tlmgrfile | xargs tlmgr install
else
	echo "❎  tlmgr is already installed"
fi

# Custom
################################################################################

# Sketchtool
#sh /Applications/Sketch.app/Contents/Resources/sketchtool/install.sh
