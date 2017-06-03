#!/bin/bash

#
# Check if mas is installed
#
which -s node
if [[ $? != 0 ]] ; then
    echo "Install node with homebrew first. ☠️"
    return
fi

echo "Installing global npm files …"
cat Npmfile | xargs npm install -g
