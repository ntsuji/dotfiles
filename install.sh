#!/bin/sh

cd "`dirname "$0"`"

for dotfile in `cat .gitignore | grep '^!\.' | grep -v '^!\.git' | sed 's/^!//g' | sed 's/\/$//g'`
do
	if [ -e "$HOME/$dotfile" -a ! -e "$HOME/$dotfile.bak" \
		-a "`ls -al "$HOME" | fgrep " $dotfile " | sed 's/.*-> \(.*\)/\1/' | sed 's/\/$//'`" != "$PWD/$dotfile" ]
	then
		mv "$HOME/$dotfile" "$HOME/$dotfile.bak"
	else
		rm -rf "$HOME/$dotfile"
	fi

	ln -s "$PWD/$dotfile" "$HOME"
done
