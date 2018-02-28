#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Zsh
ln -f $DIR/.zshrc ~/.zshrc
ln -f $DIR/.hushlogin ~/.hushlogin

# Tmux
ln -f $DIR/.tmux.conf ~/.tmux.conf

# Lftp
ln -f $DIR/.lftprc ~/.lftprc

# Git
ln -f $DIR/.gitconfig ~/.gitconfig
ln -f $DIR/.gitignore_global ~/.gitignore_global

# Flexget
ln -sfn $DIR/.flexget/ ~/.flexget

# Sublime Text
ln -sfn $DIR/sublime ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# Atom 
ln -sfn $DIR/atom ~/.atom

# Nginx
ln -sfn $DIR/nginx /usr/local/etc/nginx