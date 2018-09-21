#!/bin/bash
#
# Description:  Helper script to install apps
#               to the system, using various package managers.
# Author:       Eivind Mikael Lindbråten
# Email:        eivindml@icloud.com
# Github:       github.com/eivindml

# Declares a dictionary containing the
# name of the app file and the accociated
# command needed to install apps specified the file.
declare -A files
files=(
  ["Brewfile"]="brew install"
  ["Caskfile"]="brew cask install"
  ["Gemfile"]="sudo gem install"
  ["Masfile"]="mas install"
  ["Npmfile"]="npm install -g"
)

# Installs nececary dependencies for
# running this script; Homebrew and latest
# Bash for dictionary support.
install_dependencies() {
  # Install Homebrew
  which -s brew
  if [[ $? != 0 ]] ; then
  	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install bash
  fi
}

# Installs all apps on the system.
# It skips lines starting with a #,
# allowing for comments in the appfiles.
# The output from each install sequence is silenced.
install_apps() {
  for file in "${!files[@]}"; do
    echo -e "Installing apps in \e[33m$file\e[39m …"
    grep "^[^# ]" $file | xargs ${files[$file]} &> /dev/null
  done
}

# Make sure script is run
# with the folder containing
# the script as the current directory.
cd $(dirname $0)

install_dependencies
install_apps
