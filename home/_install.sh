#!/bin/bash

rm ~/.zshrc
ln .zshrc ~/.zshrc

rm ~/.tmux.conf
ln .tmux.conf ~/.tmux.conf

rm ~/.vimrc
ln .vimrc ~/.vimrc

rm ~/.vim
ln -s .vim/ ~/.vim

rm ~/.lftprc
ln .lftprc ~/.lftprc

rm ~/.gitconfig
ln .gitconfig ~/.gitconfig

rm ~/.gitignore
ln .gitignore ~/.gitignore

rm -rf ~/.atom
ln -s .atom/ ~/.atom
