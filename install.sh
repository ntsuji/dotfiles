#!/bin/sh

cd "`dirname "$0"`"

for dotfile in `cat .gitignore | grep '^!\.' | grep -v '^!\.git' | sed 's/^!//g'`
do
	mv -f "$HOME/$dotfile" "$HOME/$dotfile".bak
	if [ -z "$CYGWIN" ]
	then
		ln -s "$PWD/$dotfile" "$HOME"
	else
		runas /user:administrator "mklink /d "`cygpath -w "$HOME/$dotfile"`" "`cygpath -w "$PWD/$dotfile"`""
	fi
done
