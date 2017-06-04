function get_pwd() {
  echo "${PWD/$HOME/~}"
}

setopt PROMPT_SUBST
PROMPT='
%F{yellow}$(get_pwd)
%f→ '
