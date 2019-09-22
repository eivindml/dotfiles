# Antigen Setup and Plugins
###############################################################################

# source ~/.zsh/antigen/antigen.zsh
#
# # Load the oh-my-zsh's library.
# antigen use oh-my-zsh
#
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle mafredri/zsh-async
# antigen bundle sindresorhus/pure
# antigen bundle dracula/zsh
# antigen bundle zsh-users/zsh-syntax-highlighting
#
# # Tell Antigen that you're done.
# antigen apply

# Source Config Files
###############################################################################

# ZSH_THEME="dracula"
# source ~/.zsh/options.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:$HOME/Repositories/dotfiles/bin"

export PATH="$HOME/.composer/vendor/bin:$PATH"

alias tmux='tmux attach || tmux'

source ~/.profile
#export PATH="$HOME/.fastlane/bin:$PATH"
#export PATH="${PATH}:${HOME}/.composer/vendor/bin"

if [ -f ~/.bashrc ]; then                                                            
 source ~/.bashrc                                                                
fi 

set -o vi

alias ls='ls -G'

git_branch() {
  git describe --contains --all HEAD 2>/dev/null;
}

export PS1="%1d  "

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#export PATH="$PATH:$HOME/.npm-global/bin"
#e�xport PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/lib"
export PATH="$PATH:/usr/local/Cellar/node/11.10.0/bin"
export PATH="$PATH:/usr/local/opt"
