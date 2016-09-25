#!/bin/bash

function parse_git_dirty {
    if git status | grep -q "Changes not staged for commit:"; then
      echo "💩  "
    elif git status | grep -q "ahead"; then
       echo "🐎  "
   else
       echo "🚿  "
    fi
}

export PS1="🍃  \[\e[37m\]\w\[\e[m\] $(parse_git_dirty)"
