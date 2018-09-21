#!/bin/bash
#
# Description:  Helper script to execute scripts
#               configuring macOS.
# Author:       Eivind Mikael Lindbråten
# Email:        eivindml@icloud.com
# Github:       github.com/eivindml

run_configuration() {
  bash os.sh
  bash safari.sh
  bash terminal.sh
}

# Make sure script is run
# with the folder containing
# the script as the current directory.
cd $(dirname $0)

run_configuration
