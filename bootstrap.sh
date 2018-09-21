#!/bin/bash

# TODO: Differentiate between install and update,
# add call to install scripts in subdirs

cd apps/
sh _install.sh

cd ../macos/
sh _install.sh

cd ../symlink/
sh _install.sh

# TODO: Add argument commands to script (for install vs update)

# TODO: Add nice printouts throughout, and remove unwanted printouts. Maybe just a loading spinner for each step.

# TODO: Ask for sudo as first thing, so we don't need it later on.

#!/bin/bash

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
