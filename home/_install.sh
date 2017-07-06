#!/bin/bash

rm ~/.zshrc
ln .zshrc ~/.zshrc

rm ~/.tmux.conf
ln .tmux.conf ~/.tmux.conf

rm ~/.vimrc
ln .vimrc ~/.vimrc

rm ~/.lftprc
ln .lftprc ~/.lftprc

rm ~/.gitconfig
ln .gitconfig ~/.gitconfig

rm -rf ~/.atom
ln -s ~/Documents/projects/dotfiles/home/.atom/ ~/.atom
