#!/bin/bash

function parse_git_dirty {
    # TODO: Make it recognize .git folder in parent
    if [ -d .git ]; then # Check if git folder
        if git status | grep -q "fatal: Not a git repository"; then
            echo ""
        elif git status | grep -q "Changes to be committed:"; then
            echo "🚦  "
        elif git status | grep -q "Changes not staged for commit:"; then
              echo "💩  "
          elif git status | grep -q "ahead"; then
             echo "🐎  "
         else
             echo "🚿  "
          fi
else
  echo ""
fi;

}

export PS1="🍃  \[\e[37m\]\w\[\e[m\] \$(parse_git_dirty)"
