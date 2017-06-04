#!/bin/bash

#
# Check if mas is installed
#
which -s gem
if [[ $? != 0 ]] ; then
    echo "Install ruby/gem with homebrew first. ☠️"
    return
fi

echo "Installing global gem files …"
sudo -v
cat Gemfile | xargs sudo gem install
