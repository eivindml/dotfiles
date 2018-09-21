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


# TODO: Add nice printouts throughout, and remove unwanted printouts. Maybe just a loading spinner for each step.
# TODO: Ask for sudo as first thing, so we don't need it later on.
# TODO: Add nice comments
# TODO: Remove install and run install title and commands.

install_title() {
	read -r -p "Do you want to update $1? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then
		return 0
	else
		return 1
	fi
}

install_commands() {
	while read -r line
	do
		eval $line
	done
}

run_install() {
  # TODO: Do this in a cleaner way.
  cd apps/
  sh _install.sh

  cd ../macos/
  sh _install.sh

  cd ../symlink/
  sh _install.sh
}

run_update() {
  # TODO: Simplify this code
if install_title "core macOS software"
then
install_commands <<EOF
softwareupdate --list
softwareupdate --install --all
EOF
fi

if install_title "brew packages"
then
install_commands <<EOF
brew update
brew outdated
brew upgrade
brew cleanup -s
brew doctor
brew missing
EOF
fi

if install_title "brew cask packages"
then
install_commands <<EOF
brew cask outdated
brew cask upgrade
brew cleanup
EOF
fi

if install_title "App Store apps"
then
install_commands <<EOF
mas outdated
mas upgrade
EOF
fi

if install_title "npm packages"
then
install_commands <<EOF
npm outdated -g
npm update -g
EOF
fi

if install_title "gem packages"
then
install_commands <<EOF
sudo gem outdated
sudo gem update --system
sudo gem update
sudo gem cleanup
EOF
fi
}

run_help() {
  # This parses the usage description from the comment
  # header. Parses lines starting with double hashtags.
  sed -n '/^##/,/^$/s/^## \{0,1\}//p' $0
}


# Parse command line arguments and do corresponding action.
while getopts ":hiu" opt; do
  case $opt in

    # Help option
    h)
      run_help
      ;;

    # Install option
    i)
      run_install
      ;;

    # Update option
    u)
      run_update
      ;;

    # Invalid argument. Show help
    \?)
      run_help
      ;;

  esac
done

# No arguments specified, show help
if (($# == 0)); then
  run_help
fi
