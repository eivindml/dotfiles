alias ls='gls -XF --color'

export PATH=~/Documents/projects/dotfiles/bin:$PATH

# Auto start tmux session
if [ "$TMUX" = "" ]; then tmux; fi

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

setopt PROMPT_SUBST
PROMPT='%F{cyan}$(get_pwd)
%B%F{white}❯%f%b '
RPROMPT='$(git-status)'

source ~/Documents/projects/dotfiles/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
