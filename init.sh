#!/bin/zsh

# Loop over hidden files (first char is dot, but not second)
for FILE in .[!.]*; do
	# Skip .git folder
	[ $FILE = ".git" ] && continue
	
	echo -n "Should we symlink $PWD/$FILE to $HOME/$FILE? (yes/no) " && read SYMLINK_PROMPT
	
	# Skip if we don't get yes or y
	[[ ! $SYMLINK_PROMPT =~ "^(yes|y)$" ]] && echo "Skipping …" && continue
	
	[[ -f $HOME/$FILE ]] && echo -n "File exists. Should we overwrite? (yes/no) " && read OVERWRITE_PROMPT
	
	# Don't overwrite
	[[ ! -z $OVERWRITE_PROMPT && ! $OVERWRITE_PROMPT =~ "^(yes|y)$" ]] && continue
	
	# Overwrite (delete old file)
	[[ $OVERWRITE_PROMPT =~ "^(yes|y)$" ]] && rm $HOME/$FILE
	
	# Create Symlink!
	ln -s $PWD/$FILE $HOME/$FILE
done