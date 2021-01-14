#!/bin/bash
#A simple script to extract a rar file inside a directory downloaded by Transmission.
#It uses environment variables passed by the transmission client to find and extract any rar files from a downloaded torrent into the folder they were found in.
find /$TR_TORRENT_DIR/$TR_TORRENT_NAME -name "*.rar" -execdir unrar e -o- "{}" \;
