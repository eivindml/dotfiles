#!/bin/bash

# Updates all software components of the system.

softwareupdate --install --all
brew update
brew upgrade
mas upgrade
npm update -g
gem update —system
gem update
