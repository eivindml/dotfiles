#!/bin/bash

#
# Check if mas is installed
#
which -s tlmgr
if [[ $? != 0 ]] ; then
    echo "Install basictex/mactex or just tlmgr using homebrew first. ☠️"
    return
fi

echo "Installing latex packages …"
cat Tlmgrfile | xargs tlmgr install
