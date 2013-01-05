#!/bin/sh

cd "`dirname "$0"`"

for dotfile in `cat .gitignore | grep '^!\.' | grep -v '^!\.git' | sed 's/^!//g'`
do
	if [ -e "$HOME/$dotfile" -a ! -e "$HOME/$dotfile".bak \
		-a "`ls -al "$HOME" | fgrep " $dotfile " | sed 's/.*-> \(.*\)/\1/'`" != "$PWD/$dotfile" ]
	then
		mv "$HOME/$dotfile" "$HOME/$dotfile.bak"
	else
		rm -rf "$HOME/$dotfile"
	fi

	if [ -z "$CYGWIN" ]
	then
		ln -s "$PWD/$dotfile" "$HOME"
	else
		runas /user:administrator "mklink /d "`cygpath -w "$HOME/$dotfile"`" "`cygpath -w "$PWD/$dotfile"`""
	fi
done
