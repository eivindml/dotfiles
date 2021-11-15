#!/bin/zsh
echo "------" >> $HOME/Library/Logs/transmission.log
date >> $HOME/Library/Logs/transmission.log 
echo "$TR_TORRENT_DIR" >> $HOME/Library/Logs/transmission.log
echo "$TR_TORRENT_NAME" >> $HOME/Library/Logs/transmission.log
echo "Trying to extract: $TR_TORRENT_DIR/$TR_TORRENT_NAME" >> $HOME/Library/Logs/transmission.log
find "$TR_TORRENT_DIR/$TR_TORRENT_NAME" -maxdepth 1 -name "*.rar" -execdir /usr/local/bin/7z x {} \;  &>> $HOME/Library/Logs/transmission.log
