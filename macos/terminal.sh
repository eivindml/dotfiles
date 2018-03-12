#!/bin/bash

# Change users shell to zsh
chsh -s /bin/zsh

# Change computer name
sudo scutil --set HostName fox

# Change terminal profile to a modified Dracula theme
osascript<<END
tell application "Terminal"
  set themeName to "dracula"
  do shell script "open '" & themeName & ".terminal'"
	set default settings to settings set themeName
end tell
END

