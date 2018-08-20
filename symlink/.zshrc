# Aliases
###############################################################################

alias \#=':' # Do nothing command. Useful for commenting.
alias ls='ls -Gp' # Adds coloring and trailing slash to folders.


# Configurations
###############################################################################

# Prompt Styling
setopt PROMPT_SUBST
PROMPT='${PWD/$HOME/~}
> '

# History
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY