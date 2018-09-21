#!/bin/bash
#
# Description:  Configures macOS Terminal defaults.
# Author:       Eivind Mikael Lindbråten
# Email:        eivindml@icloud.com
# Github:       github.com/eivindml

# Set default shell to fish
chsh -s /usr/local/bin/fish

# Change computer name
sudo scutil --set HostName macbook

# Extend timeout for sudo -v option to 20 minutes (from 5 minutes)
# Useful for scripts requiring sudo for a long time (for instance update script)
echo "Defaults timestamp_timeout=20" > /private/etc/sudoers.d/user
