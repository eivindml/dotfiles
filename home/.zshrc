[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


alias \#=':' # Do nothing command. Usefule for commenting.
alias ls='gls -XF --color'

export PATH=~/Documents/projects/dotfiles/bin:$PATH

# Auto start tmux session
if [ "$TMUX" = "" ]; then tmux; fi

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

ZLE_RPROMPT_INDENT=0
setopt PROMPT_SUBST
PROMPT='%F{cyan}$(get_pwd)
%B%F{white}❯%f%b '
RPROMPT='$(git-status)'

# Better history
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
