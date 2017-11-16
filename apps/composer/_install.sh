#!/bin/bash

#
# Check if mas is installed
#
which -s composer
if [[ $? != 0 ]] ; then
    echo "Install composer first. ☠️"
    return
fi

echo "Installing global composer files …"
cat Composerfile | xargs composer global require

