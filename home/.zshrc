alias ls='ls -G'

# Auto start tmux session
if [ "$TMUX" = "" ]; then tmux; fi

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

setopt PROMPT_SUBST
PROMPT='%F{green}$(get_pwd)
%F{white}→%f '
