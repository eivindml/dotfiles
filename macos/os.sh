#!/bin/bash
#
# Description:  Configures macOS defaults.
# Author:       Eivind Mikael Lindbråten
# Email:        eivindml@icloud.com
# Github:       github.com/eivindml

# Disable the App Store origin security
sudo spctl --master-disable

# Remove thick scrollbar
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Change desktop background
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Sierra 2.jpg"'

# Change defalt finder window
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Enable fullscreen for Simulator
defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES
