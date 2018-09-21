#!/bin/bash
#
# Description:  Helper script install dotfile symlinks.
# Author:       Eivind Mikael Lindbråten
# Email:        eivindml@icloud.com
# Github:       github.com/eivindml

# Dictionary defining source file/folder,
# and destination of the given source.
declare -A paths
paths=(
  [".gitconfig"]="~/.gitconfig"
  [".gitignore_global"]="~/.config/git/ignore"
  [".vimrc"]="~/.vimrc"
  [".flexget/"]="~/.flexget"
  [".vim/"]="~/.vim"
  ["fish/"]="~/.config/fish"
)

# Sets up symlinks, and informs
# of symlink being created.
setup_symlinks() {
  for path in "${!paths[@]}"; do
    echo "Installing symlink for $path to ${paths[$path]} …"
    if [ -d $path ]; then
      ln -sfn $path ${paths[$path]}
    else
      ln -f $path ${paths[$path]}
    fi
  done
}

# Setup nececarry directories.
# Some procedures requires existence
# of certain paths.
setup_directories() {
  mkdir -p ~/.config/git/
}

# Installs dependencies
install_dependencies() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Make sure script is run
# with the folder containing
# the script as the current directory.
cd $(dirname $0)

setup_directories
setup_symlinks
install_dependencies
