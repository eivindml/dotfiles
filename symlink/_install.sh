#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -f $DIR/.gitconfig ~/.gitconfig
ln -f $DIR/.gitignore_global ~/.gitignore_global
ln -f $DIR/.hushlogin ~/.hushlogin
ln -f $DIR/.lftprc ~/.lftprc
ln -f $DIR/.vimrc ~/.vimrc
ln -f $DIR/.zshrc ~/.zshrc
ln -sfn $DIR/.flexget/ ~/.flexget
ln -sfn $DIR/.vim/ ~/.vim
