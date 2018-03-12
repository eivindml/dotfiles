#!/bin/bash

function sub_install {
  cd $1
  bash _install.sh
  cd ../
}

# Homebrew should run first, as a lot depends on this

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Add taps
# For cask-upgrade functionality. 'brew cu'
#brew tap buo/cask-upgrade
# For brew services functionality 'brew services start mysql'
brew tap homebrew/services

# For php72 >
brew tap homebrew/homebrew-php

# Installing brews and casks from Brewfile and Caskfile
cat Brewfile | xargs brew install
cat Caskfile | xargs brew cask install


#
# Check if mas is installed
#
which -s mas
if [[ $? != 0 ]] ; then
    echo "Install mas with homebrew first. ☠️"
    return
fi

grep "^[^#]" Masfile | xargs mas install



#
# Check if mas is installed
#
which -s node
if [[ $? != 0 ]] ; then
	echo "Install node with homebrew first. ☠️"
	return
fi

echo "Installing global npm files …"
cat Npmfile | xargs npm install -g

echo "Installing global Yeoman generators …"
# cat Yofile | xargs npm install -g



#!/bin/bash

#
# Check if mas is installed
#
which -s gem
if [[ $? != 0 ]] ; then
    echo "Install ruby/gem with homebrew first. ☠️"
    return
fi

echo "Installing global gem files …"
sudo -v
cat Gemfile | xargs sudo gem install


#
# Check if mas is installed
#
which -s tlmgr
if [[ $? != 0 ]] ; then
    echo "Install basictex/mactex or just tlmgr using homebrew first. ☠️"
    return
fi

echo "Installing latex packages …"
cat Tlmgrfile | xargs tlmgr install



# Custom script installs
# Sketchtool
# sh /Applications/Sketch.app/Contents/Resources/sketchtool/install.sh
