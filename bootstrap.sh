#!/bin/bash
#
# Description:  Minimal boostrap script for dotfiles.
#               Install and update apps and dotfiles to the system.
# Author:       Eivind Mikael Lindbråten
# Email:        eivindml@icloud.com
# Github:       github.com/eivindml
#
# Usage:
## dotfiles Bootstrap.
##
## Usage:
##   ./bootstrap.h -i
##   ./bootstrap.h -u
##
## Options:
##   -h      Show this screen.
##   -i      Install dotfiles to system.
##   -u      Updates all software packages on system.


# Installs apps (apps/),
# system settings (macos)
# and symlinks (symlink/).
run_install() {
  sh */_install.sh
}

# Update all apps
# installed on the system.
run_update() {
  echo "Updating macOS System …"
  softwareupdate --install --all &> /dev/null

  echo "Updating Brew …"
  brew update &> /dev/null
  brew upgrade &> /dev/null
  brew cleanup -s &> /dev/null

  echo "Updating Brew Casks …"
  brew cask upgrade &> /dev/null
  brew cleanup &> /dev/null

  echo "Updating App Store …"
  mas upgrade &> /dev/null

  echo "Updating Npm Packages …"
  npm update -g &> /dev/null

  echo "Updating Gems …"
  sudo gem update --system &> /dev/null
  sudo gem update &> /dev/null
  sudo gem cleanup &> /dev/null
}

# Shows help/usage information.
# This is parsed from the header,
# using lines starting with two #'s.
run_usage() {
  sed -n '/^##/,/^$/s/^## \{0,1\}//p' $0
}

# Ask for password up front
# so we don't have to ask for that
# at a later point in the execution.
# Default timeout is 5 minutes, but is
# extended to 20 minutes in terminal.sh.
sudo -v

# Parse command line arguments
# and do corresponding action.
while getopts "iuh" opt; do
  case $opt in

    i) # Install option
      run_install
      ;;

    u) # Update option
      run_update
      ;;

    h|\?) # Help or unknown argument
      run_usage
      ;;

  esac
done
