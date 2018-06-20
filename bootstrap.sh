#!/bin/bash

install_title() {
	read -r -p "Do you want to update $1? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then
		echo "✅"
		return 0
	else
		echo "⛔️"
		return 1
	fi
}

install_commands() {
	while read -r line
	do 
		eval $line
	done
}

echo "It's recomended you perform an data backup before you proceed"

if install_title "symbolic links"
then
sh symlink/_install.sh
fi

if install_title "/ install apps"
then
sh apps/_install.sh
fi

if install_title "/ change macOS app settings"
then
sh macos/_install.sh
fi

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
brew cu --all --cleanup
brew cask cleanup
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

if install_title "LaTeX"
then
install_commands <<EOF
sudo tlmgr update --self
sudo tlmgr update --list
sudo tlmgr update --all
EOF
fi

