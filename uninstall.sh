#!/bin/sh

cd "`dirname "${0}"`"

for symlink in `ls *.symlink`
do
	dotfile="`echo ${symlink} | sed 's/\(.*\)\.symlink/.\1/'`"

	src="${PWD}/${symlink}"
	dest="${HOME}/${dotfile}"
	backup="${HOME}/${dotfile}.bak"

	if [ "`readlink "${dest}"`" = "${src}" ]
	then
		rm "${dest}"
		if [ -e "${backup}" ]
		then
			mv "${backup}" "${dest}"
		fi
	fi
done
