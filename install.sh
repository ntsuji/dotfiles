#!/bin/sh

dotfiles=".screenrc .zshrc"
srcdir=`dirname $0`

for dotfile in $dotfiles
do
	mv ~/"$dotfile" ~/"$dotfile".bak
	if [ -z $CYGWIN ]
	then
		ln -s "$srcdir"/"$dotfile" ~/"$dotfile"
	else
		runas /user:administrator "mklink "`cygpath -w ~/"$dotfile"`" "`cygpath -w "$srcdir"/"$dotfile"`""
	fi
done
