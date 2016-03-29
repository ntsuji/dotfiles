#!/bin/bash
cd "$(dirname "${0}")"
for symlink in "$(ls -d *.symlink)"; do
  dotfile=".${symlink%%.*}"
  src="${PWD}/${symlink}"
  dst="${HOME}/${dotfile}"
  backup="${HOME}/${dotfile}.bak"
  if [[ -e "${dst}" &&
      ! -e "${backup}" &&
      "$(readlink "${dst}")" != "${src}" ]]; then
    mv "${dst}" "${backup}"
  else
    rm -rf "${dst}"
  fi
  ln -s "${src}" "${dst}"
done
