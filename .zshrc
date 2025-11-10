source ~/.zsh/envs.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/aliases.zsh

# Start tmux on shell start
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  exec tmux
#fi

autoload -U colors && colors	# Load colors

# History in cache directory:
HISTSIZE=120000000
SAVEHIST=100000000
HISTFILE=~/.cache/zsh/history
# Append commands immediately and share history between environments
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

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
zstyle ':vcs_info:git:*' formats '⎇ %F{235}%b'

# This needs prompt_subst set, hence the name. So:
setopt PROMPT_SUBST

export PROMPT='%F{235}%B[%b%F{253}%n%F{245}@%F{237}%M %F{green}%~%F{235}%B]%b%F{235} ${vcs_info_msg_0_}%F{202}
$ '

# if [[ -n $SSH_CONNECTION ]]; then
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M{SSH} %F{magenta}%~%F{red}]%F{black}$ "
# else
#   export PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%M %F{magenta}%~%F{red}]%F{black}$\n$ "
# fi

# Environment variables
[ -f "$HOME/.zsh_env_vars" ] && source $HOME/.zsh_env_vars

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/Users/eivindml/.local/bin:$PATH"
export PATH="/Users/eivindml/scripts:$PATH"
export PATH="/Users/eivindml/.dotnet:$PATH"


source ~/.zsh/envs.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/aliases.zsh

# Load syntax highlighting; should be last.
source "$HOME/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" 2>/dev/null
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" 2>/dev/null
