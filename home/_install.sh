#!/bin/bash

rm ~/.bash_profile
ln .bash_profile ~/.bash_profile

rm ~/.inputrc
ln .inputrc ~/.inputrc

rm ~/.vimrc
ln .vimrc ~/.vimrc

rm ~/.lftprc
ln .lftprc ~/.lftprc

rm ~/.gitconfig
ln .gitconfig ~/.gitconfig

rm -rf ~/.atom
ln -s ~/dotfiles/home/.atom/ ~/.atom

# Used to sync/install packages defined in .atom/packages.cson
apm install package-sync
