#alias tmux='tmux attach || tmux'
alias ls='ls -G'

export PATH="$PATH:$HOME/Developer/dotfiles/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export PS1="%1d (SSH)  "
else
  export PS1="%1d  "
fi
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
