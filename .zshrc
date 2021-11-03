# Aliases
alias ls='ls -AG'
# alias yarn-linked='find -L $(find node_modules -type l) -type d -prune'
# alias yarn-links='(cd $HOME/.config/yarn/link && find . -type l | cut -c 3-)'

export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/Developer/dotfiles/bin:$HOME/bin"

export PROMPT="%F{red}%B[%b%F{yellow}%n%F{cyan}@%F{magenta}%M %F{green}%~%F{red}%B]%b%F{black}$ "

# if [[ -n $SSH_CONNECTION ]]; then
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M{SSH} %F{magenta}%~%F{red}]%F{black}$ "
# else
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M %F{magenta}%~%F{red}]%F{black}$ "
# fi

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
