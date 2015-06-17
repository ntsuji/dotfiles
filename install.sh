#!/bin/sh

cd "`dirname "${0}"`"

for symlink in `ls *.symlink`
do
	dotfile="`echo ${symlink} | sed 's/\(.*\)\.symlink/.\1/'`"

	src="${PWD}/${symlink}"
	dst="${HOME}/${dotfile}"
	backup="${HOME}/${dotfile}.bak"

	if [ -e "${dst}" -a ! -e "${backup}" -a "`readlink "${dst}"`" != "${src}" ]
	then
		mv "${dst}" "${backup}"
	else
		rm -rf "${dst}"
	fi

	ln -s "${src}" "${dst}"
done
