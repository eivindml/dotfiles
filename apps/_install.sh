#!/bin/bash

function sub_install {
  cd $1
  bash _install.sh
  cd ../
}

# Homebrew should run first, as a lot depends on this
sub_install homebrew/
sub_install mas/
sub_install npm/
sub_install gem/
sub_install latex/

# Custom script installs
# Sketchtool
sh /Applications/Sketch.app/Contents/Resources/sketchtool/install.sh
# Wakatime
curl -fsSL https://raw.githubusercontent.com/wakatime/xcode-wakatime/master/install.sh | sh


