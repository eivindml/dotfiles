# Aliases
alias ls='ls -AG'
# alias yarn-linked='find -L $(find node_modules -type l) -type d -prune'
# alias yarn-links='(cd $HOME/.config/yarn/link && find . -type l | cut -c 3-)'
alias used_ports='sudo lsof -nP -i4TCP:3000 | grep LISTEN'
# lsof -i tcp:3000 

autoload -U colors && colors	# Load colors

# History in cache directory:
HISTSIZE=100000000
SAVEHIST=100000000
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
bindkey '^R' history-incremental-search-backward
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

# PROMPT
# vcs_info needs to be marked for autoloading first, so you'd
# do this somewhere in your setup:
autoload -Uz vcs_info

# Also known as the Quick-Start-Way. Probably the simplest way to add
# vcs_info functionality to existing setups. You just drop a vcs_info call
# to your `precmd' (or into a `precmd_functions[]' entry) and include a
# single-quoted ${vcs_info_msg_0_} in your PS1 definition:
precmd() { 
  vcs_info 
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '⎇ %F{yellow}%b'

# This needs prompt_subst set, hence the name. So:
setopt PROMPT_SUBST

PROMPT='%F{red}%B[%b%F{yellow}%n%F{cyan}@%F{magenta}%M %F{green}%~%F{red}%B]%b%F{red} ${vcs_info_msg_0_}%F{cyan}
$ '

# if [[ -n $SSH_CONNECTION ]]; then
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M{SSH} %F{magenta}%~%F{red}]%F{black}$ "
# else
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M %F{magenta}%~%F{red}]%F{black}$\n$ "
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

export PNPM_HOME="/Users/eivindml/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"


# Pretty print of code
#alias prettyjson='python3 -m json.tool | bat'
prettyjson() {
    python3 -m json.tool "$1" | /opt/homebrew/bin/bat --theme="GitHub" -p
}
alias dat='bat --theme="GitHub" -p'

# navigation aliases
alias dev="cd ~/Developer/"

# Suffix Aliases
alias -s json=nova

whitebg() {
  convert "$1" -background white -alpha remove -alpha off "$1"
}

export PATH=/Applications/Chia.app/Contents/Resources/app.asar.unpacked/daemon:$PATH




#### capture-website https://kalit.no --output=kalit-desktop.png --full-page --overwrite --delay=7 --launch-options='{"headless": false}' --emulate-device="iPhone X"
#### ffmpeg -ss 00:00:00 -i output.mp4 -to 00:00:44.68 -c:v copy -c:a copy output10.mp4
#### ffmpeg -i test.mp4 -vf blackdetect=d=0:pix_th=0.4 -f rawvideo -y /dev/null
#### ffmpeg -f lavfi -i color=s=1920x1080 -loop 1 -t 10 -i "kalit-desktop.png" -filter_complex "[0:v]overlay=y=-'t*h*0.02'" output.mp4
#
#

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion






alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/Users/eivindml/.local/bin:$PATH"
export PATH="/Users/eivindml/scripts:$PATH"
