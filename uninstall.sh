#!/bin/bash
cd "$(dirname "${0}")"
for symlink in $(ls -d *.symlink); do
  dotfile=".${symlink%%.*}"
  src="${PWD}/${symlink}"
  dst="${HOME}/${dotfile}"
  backup="${HOME}/${dotfile}.bak"
  if [[ "$(readlink "${dst}")" == "${src}" ]]; then
    rm "${dst}"
    if [[ -e "${backup}" ]]; then
      mv "${backup}" "${dst}"
    fi
  fi
done
