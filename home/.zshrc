# PLUGINS

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Syntax highlting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATHS
export PATH=~/Documents/projects/dotfiles/bin:$PATH
export PATH="$HOME/.fastlane/bin:$PATH"

# ALIASES
alias \#=':' # Do nothing command. Usefule for commenting.
alias ls='gls -XF --color'

# CONFIGURATIONS

# Prompt
ZLE_RPROMPT_INDENT=0
setopt PROMPT_SUBST
PROMPT='%F{cyan}${PWD/$HOME/~}
%B%F{white}❯%f%b '
RPROMPT='$(git-status)'

# History
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Auto start tmux session
if [ "$TMUX" = "" ]; then tmux; fi
