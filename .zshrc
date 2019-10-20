alias ls='ls -G'

export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/Developer/dotfiles/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export PS1="%1d (SSH)  "
else
  export PS1="%1d  "
fi
