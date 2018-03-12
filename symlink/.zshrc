# PLUGINS

# Autojump
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Syntax highlting
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto suggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Color of autosuggestion
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'


# PATHS

#export PATH=$HOME/.composer/vendor/bin:$HOME/.gem/ruby/2.3.0/bin:$HOME/.fastlane/bin:$HOME/Documents/projects/dotfiles/bin:$PATH

# ALIASES
alias \#=':' # Do nothing command. Usefule for commenting.
#alias ls='gls -xf --color'
# alias ls='ls -gap'

# configurations

# Prompt
ZLE_RPROMPT_INDENT=0
setopt PROMPT_SUBST
PROMPT='%F{cyan}${PWD/$HOME/~}
%B%F{white}❯%f%b '
#RPROMPT='$(git-status)'

# History
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Auto start tmux session
#if [ "$TMUX" = "" ]; then tmux; fi
#export PATH="/usr/local/sbin:$PATH"

# .zshrc
#autoload -U promptinit; promptinit
#prompt pure


#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
