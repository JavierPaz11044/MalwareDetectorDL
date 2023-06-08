#!/bin/bash
search_and_extract() {
  local dir="$1"
  for file in "$dir"/*; do
    if [[ -d "$file" ]]; then
      search_and_extract "$file"
    elif [[ -f "$file" ]]; then
      if [[ "$file" == *.zip ]]; then
        unzip "$file" -d "$dir"
      fi
    fi
  done
}

ruta="./dataset"

search_and_extract "$ruta"
