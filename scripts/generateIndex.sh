#!/usr/bin/env sh

# function to generate index.html for the given directory
generateIndex() {
    for file in $1/*; do
        if [ "${file##*/}" == "index.html" ]; then
            continue
        fi
        if [ -d "$file" ]; then
            echo "${file##*/}/"
        else
            echo "${file##*/}"
        fi
    done
}

# generate index.html for personas
generateIndex personas > personas/index.html