alias ls='ls -G'
# alias yarn-linked='find -L $(find node_modules -type l) -type d -prune'
# alias yarn-links='(cd $HOME/.config/yarn/link && find . -type l | cut -c 3-)'
alias used_ports='sudo lsof -nP -i4TCP:3000 | grep LISTEN'
alias search_google_images="pbpaste | sed 's|^|\"https://www.google.com/search?tbm=isch\&q=|' | sed 's|$|\"|' | xargs -n1 open"
alias dat='bat --theme="GitHub" -p'
alias dev="cd ~/Developer/"
alias -s json=nova
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias vim='nvim'
