#!/bin/bash

function parse_git_dirty {
    # TODO: Make it recognize .git folder in parent
    if [ -d .git ]; then # Check if git folder
        branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
        if git status | grep -q "fatal: Not a git repository"; then
            echo ""
        elif git status | grep -q "Changes to be committed:"; then
            echo "[$branch 🚦 ]  "
        elif git status | grep -q "Changes not staged for commit:"; then
              echo "[$branch 💩 ] "
          elif git status | grep -q "ahead"; then
             echo "[$branch 🐎 ] "
         else
             echo "[$branch 🚿 ] "
          fi
else
  echo ""
fi;

}

export PS1="🍃  \[\e[37m\]\w\[\e[m\] \$(parse_git_dirty)"
