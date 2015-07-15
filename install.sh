#!/bin/bash

cd "$(dirname "${0}")"

for symlink in $(ls | grep "\.symlink$"); do
  readonly dotfile="$(echo ${symlink} | sed 's/\(.*\)\.symlink/.\1/')"
  readonly src="${PWD}/${symlink}"
  readonly dst="${HOME}/${dotfile}"
  readonly backup="${HOME}/${dotfile}.bak"
  if [[ -e "${dst}" &&
      ! -e "${backup}" &&
      "$(readlink "${dst}")" != "${src}" ]]; then
    mv "${dst}" "${backup}"
  else
    rm -rf "${dst}"
  fi
  ln -s "${src}" "${dst}"
done
