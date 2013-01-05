#!/bin/sh

cd "`dirname "$0"`"

for dotfile in `cat .gitignore | grep '^!\.' | grep -v '^!\.git' | sed 's/^!//g'`
do
	if [ "`ls -al "$HOME" | fgrep " $dotfile " | sed 's/.*-> \(.*\)/\1/'`" = "$PWD/$dotfile" ]
	then
		rm -rf "$HOME/$dotfile"
		mv "$HOME/$dotfile.bak" "$HOME/$dotfile"
	fi
done
