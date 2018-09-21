#!/bin/bash

# Make sure the folder is root
cd $(dirname $0)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO: Automate this. Maybe have an array with source + dest string (can assume dest string if not present)

ln -f $DIR/.gitconfig ~/.gitconfig
ln -f $DIR/.gitignore_global ~/.gitignore_global
ln -f $DIR/.vimrc ~/.vimrc
ln -sfn $DIR/.flexget/ ~/.flexget
ln -sfn $DIR/.vim/ ~/.vim
ln -sfn $DIR/fish/ ~/.config/fish

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
