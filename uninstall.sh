#!/bin/sh

cd "`dirname "$0"`"

for dotfile in `cat .gitignore | grep '^!\.' | grep -v '^!\.git' | sed 's/^!//g' | sed 's/\/$//g'`
do
	if [ "`ls -al "$HOME" | fgrep " $dotfile " | sed 's/.*-> \(.*\)/\1/' | sed 's/\/$//'`" = "$PWD/$dotfile" ]
	then
		rm "$HOME/$dotfile"
		if [ -e "$HOME/$dotfile.bak" ]
		then
			mv "$HOME/$dotfile.bak" "$HOME/$dotfile"
		fi
	fi
done
