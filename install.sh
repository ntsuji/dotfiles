#!/bin/sh

cd "`dirname "${0}"`"

for symlink in `ls | grep '\.symlink$'`
do
	dotfile="`echo ${symlink} | sed 's/\(.*\)\.symlink/.\1/'`"

	src="${PWD}/${symlink}"
	dest="${HOME}/${dotfile}"
	backup="${HOME}/${dotfile}.bak"

	if [ -e "${dest}" -a ! -e "${backup}" -a "`readlink "${dest}"`" != "${src}" ]
	then
		mv "${dest}" "${HOME}/${backup}"
	else
		rm -rf "${dest}"
	fi

	ln -s "${src}" "${dest}"
done
