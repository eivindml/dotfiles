# Plugins
###############################################################################

# Autojump
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Syntax highlting
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestions
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Color of autosuggestion
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# Paths
###############################################################################

# export PATH=$HOME/.composer/vendor/bin:$HOME/.gem/ruby/2.3.0/bin:$HOME/.fastlane/bin:$HOME/Documents/projects/dotfiles/bin:$PATH

# Aliases
###############################################################################

alias \#=':' # Do nothing command. Usefule for commenting.
alias ls='ls -Gp' # Adds coloring and trailing slash to folders.

# Useful Commands
###############################################################################

# Resize images for web
# mogrify -path output -resize 1280x1280 -format jpg *.jpg

# Configurations
###############################################################################

# Prompt Styling
setopt PROMPT_SUBST
PROMPT='%F{cyan}${PWD/$HOME/~}
%B%F{white}❯%f%b '

# History
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

