# Aliases
alias ls='ls -G'
alias tower='gittower'

export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/Developer/dotfiles/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export PS1="%1d (SSH)  "
else
  export PS1="%1d  "
fi

# Environment variables
source ~/.zsh_env_vars

