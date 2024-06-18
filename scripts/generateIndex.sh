#!/usr/bin/env sh

# function to generate index.html for the given directory
generateIndex() {
    echo "" > "$1/index.html" # clear out any existing indexes
    for file in "$1"/*; do
        if [ "${file##*/}" = "index.html" ]; then
            continue
        fi
        if [ -d "$file" ]; then
            echo "${file##*/}/" >> "$1/index.html"
        else
            echo "Processing ${file##*}"
            echo "${file##*/}" >> "$1/index.html"
        fi
    done
}

# generate index.html for personas
generateIndex personas