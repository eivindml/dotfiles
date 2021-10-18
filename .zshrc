# Aliases
alias ls='ls -AG'
alias tower='gittower'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

alias yarn-linked='find -L $(find node_modules -type l) -type d -prune'
alias yarn-links='(cd $HOME/.config/yarn/link && find . -type l | cut -c 3-)'

export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/Developer/dotfiles/bin"
export PATH=/Applications/Chia.app/Contents/Resources/app.asar.unpacked/daemon:$PATH

if [[ -n $SSH_CONNECTION ]]; then
  export PS1="%1d (SSH)  "
else
  export PS1="%1d  "
fi

# Environment variables
source ~/.zsh_env_vars

init-script() {
  if [ ! $1 ]; then
    echo "Usage: init-script ProjectName"
    return
  fi
  mkdir $1 
  cd $1 
  swift package init --type executable --name $1 
  swift package generate-xcodeproj 
  xed .
}

function metatags() {
  curl --compressed -s $1 | xml2 | grep meta | awk -F/ '{print $NF}'
}

function linktags() {
  curl --compressed -s $1 | xml2 | grep link | awk -F/ '{print $NF}'
}
export PATH="/usr/local/opt/node@14/bin:$PATH"
