#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfn $DIR/hyper_plugins/ ~/.hyper_plugins
ln -sfn $DIR/zsh/ ~/.zsh
ln -sfn $DIR/flexget/ ~/.flexget
ln -sfn $DIR/nginx /usr/local/etc/nginx
ln -sfn	/usr/local/Cellar/ruby/2.4.2/bin/gem ~/.gem
ln -sfn $DIR/vim/ ~/.vim
ln -sfn	$DIR/config/ ~/.config # nvim
ln -f	$DIR/vimrc $DIR/init.vim # nvim
ln -f	$DIR/init.vim $DIR/config/nvim/init.vim # nvim
ln -f 	$DIR/gitconfig ~/.gitconfig
ln -f 	$DIR/gitignore_global ~/.gitignore_global
ln -f 	$DIR/hushlogin ~/.hushlogin
ln -f 	$DIR/lftprc ~/.lftprc
ln -f 	$DIR/tmux.conf ~/.tmux.conf
ln -f 	$DIR/hyper.js ~/.hyper.js
ln -f 	$DIR/zshrc ~/.zshrc
ln -f 	$DIR/vimrc ~/.vimrc
ln -f 	$DIR/vimrc ~/.gvimrc
