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

rm ~/.gitignore_global
ln .gitignore_global ~/.gitignore_global

rm ~/.hushlogin
ln .hushlogin ~/.hushlogin

rm ~/.vim
ln -s $(pwd)/.vim/ ~/

rm -rf ~/.atom
ln -s $(pwd)/.atom/ ~/

rm -rf ~/.flexget
ln -s $(pwd)/.flexget/ ~/
