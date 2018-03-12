#!/bin/bash

# TODO: Make headings, sort and add whats nececery more tips: https://github.com/orrsella/dotfiles/blob/master/setup-macos.sh
# Add print description of what is happening?

# Disable the App Store origin security
sudo spctl --master-disable

# Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "

# Remove thick scrollbar
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Expand save panel by default
#defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
#defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
#defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
#defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Plain text default for text edit
#defaults write com.apple.TextEdit RichText -int 0

# Install fonts
#cp ./fonts/*.ttf /Library/Fonts


# Set Dark Mode
#osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Set background image
#sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = 'background.png'"
#killall Dock

# Enable auto hiding of Dock
defaults write com.apple.Dock autohide -bool true

osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Yosemite 4.jpg"'

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
#defaults write com.apple.finder NewWindowTarget -string "PfLo"
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Documents/"
# Set HOME as the default location for new Finder windows
#defaults write com.apple.finder NewWindowTarget -string "PfHm"
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false


# Disable mouse pointer acceleration
#defaults write .GlobalPreferences com.apple.mouse.scaling -1
# Disable mouse wheel acceleration
#defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1