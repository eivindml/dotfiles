#!/bin/zsh
echo "------" >> /Users/eivindml/Library/Logs/transmission.log
date >> /Users/eivindml/Library/Logs/transmission.log 
echo "$TR_TORRENT_DIR" >> /Users/eivindml/Library/Logs/transmission.log
echo "$TR_TORRENT_NAME" >> /Users/eivindml/Library/Logs/transmission.log
echo "Trying to extract: $TR_TORRENT_DIR/$TR_TORRENT_NAME" >> /Users/eivindml/Library/Logs/transmission.log
# find "$TR_TORRENT_DIR/$TR_TORRENT_NAME" -type d -maxdepth 1 -exec /bin/zsh -c 'cd "{}" && find . -name "*.rar" | xargs /usr/local/bin/7z x' \; &>> /Users/eivindml/Library/Logs/transmission.log
find "$TR_TORRENT_DIR/$TR_TORRENT_NAME" -maxdepth 1 -name "*.rar" -execdir /usr/local/bin/7z x {} \;  &>> /Users/eivindml/Library/Logs/transmission.log