#!/bin/bash

cd "$(dirname "${0}")"

for symlink in $(ls | grep "\.symlink$"); do
  readonly dotfile="$(echo ${symlink} | sed 's/\(.*\)\.symlink/.\1/')"
  readonly src="${PWD}/${symlink}"
  readonly dst="${HOME}/${dotfile}"
  readonly backup="${HOME}/${dotfile}.bak"
  if [[ "$(readlink "${dst}")" == "${src}" ]]; then
    rm "${dst}"
    if [[ -e "${backup}" ]]; then
      mv "${backup}" "${dst}"
    fi
  fi
done
