#!/bin/bash

# Change users shell to zsh
chsh -s /bin/zsh

osascript<<END
tell application "Terminal"
  set themeName to "misty"
  do shell script "open '" & themeName & ".terminal'"
	set default settings to settings set themeName
end tell
END

sudo scutil --set HostName rocketship
