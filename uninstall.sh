#!/bin/sh

cd "`dirname "${0}"`"

for symlink in `ls | grep "\.symlink$"`
do
	dotfile="`echo ${symlink} | sed 's/\(.*\)\.symlink/.\1/'`"

	src="${PWD}/${symlink}"
	dst="${HOME}/${dotfile}"
	backup="${HOME}/${dotfile}.bak"

	if [ "`readlink "${dst}"`" = "${src}" ]
	then
		rm "${dst}"
		if [ -e "${backup}" ]
		then
			mv "${backup}" "${dst}"
		fi
	fi
done
