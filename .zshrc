# Aliases
alias ls='ls -AG'
# alias yarn-linked='find -L $(find node_modules -type l) -type d -prune'
# alias yarn-links='(cd $HOME/.config/yarn/link && find . -type l | cut -c 3-)'

autoload -U colors && colors	# Load colors

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


export LC_ALL=en_US.UTF-8

[ -d "$HOME/Developer/dotfiles/bin" ] && export PATH="$PATH:$HOME/Developer/dotfiles/bin"
[ -d "$HOME/.bin" ] && export PATH="$PATH:$HOME/.bin"
[ -d "/opt/homebrew/bin" ] && export PATH=/opt/homebrew/bin:$PATH

# Auto cd
setopt autocd

export PROMPT="%F{red}%B[%b%F{yellow}%n%F{cyan}@%F{magenta}%M %F{green}%~%F{red}%B]%b%F{cyan}$ "

# if [[ -n $SSH_CONNECTION ]]; then
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M{SSH} %F{magenta}%~%F{red}]%F{black}$ "
# else
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M %F{magenta}%~%F{red}]%F{black}$ "
# fi

# Environment variables
[ -f "$HOME/.zsh_env_vars" ] && source $HOME/.zsh_env_vars

init-script() {
  if [ ! $1 ]; then
    echo "Usage: init-script ProjectName"
    return
  fi
  mkdir $1 
  cd $1 
  swift package init --type executable --name $1 
  swift package generate-xcodeproj 
  xed .
}

function metatags() {
  curl --compressed -s $1 | xml2 | grep meta | awk -F/ '{print $NF}'
}

function linktags() {
  curl --compressed -s $1 | xml2 | grep link | awk -F/ '{print $NF}'
}


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
source "$HOME/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" 2>/dev/null
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" 2>/dev/null
