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

# Declares a dictionary containing the
# name of package manager and commands to
# update the given packages.
declare -A files
files=(
  ["macOS"]="softwareupdate --install --all"
  ["Brew"]="brew update && brew upgrade && brew cleanup"
  ["Brew Cask"]="brew cask upgrade && brew cleanup -s"
  ["App Store"]="mas upgrade"
  ["Npm"]="npm update -g"
  ["Gem"]="sudo gem update --system && sudo gem update --no-verbose && sudo gem cleanup"
)

# Installs apps (apps/),
# system settings (macos)
# and symlinks (symlink/).
run_install() {
  for i in * ; do
  if [ -d "$i" ]; then
    bash $(basename "$i")'/_install.sh'
  fi
done
}

# Update all apps
# installed on the system.
run_update() {
  for file in "${!files[@]}"; do
    echo -e "Updating \e[33m$file\e[39m apps …"
    ${files[$file]} &> /dev/null
  done
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
