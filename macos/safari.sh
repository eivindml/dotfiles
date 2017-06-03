#!/bin/bash

# SAFARI

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# View full URL i status bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
