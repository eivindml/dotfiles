#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Disable the App Store origin security
sudo spctl --master-disable

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set Desktop as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Projects/"

# Remove thick scrollbar
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# TODO: Set scaled resolution to more space

# TODO: Set os theme to dark mode

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Plain text default for text edit
defaults write com.apple.TextEdit RichText -int 0


# Dark mode
osascript <<'END'
do shell script ("sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true") with administrator privileges
tell application "Finder" to activate
delay 0.2
tell application "System Events"
key code "17" using {option down, control down, command down}     #Option+Control+Command+T
end tell
END
