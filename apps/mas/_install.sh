#!/bin/bash

#
# Check if mas is installed
#
which -s mas
if [[ $? != 0 ]] ; then
    echo "Install mas with homebrew first. ☠️"
    return
fi

grep "^[^#]" Masfile | xargs mas install
