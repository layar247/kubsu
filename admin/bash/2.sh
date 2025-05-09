#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path1> <path2>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: path1 does not exist."
    exit 1
fi

if [ ! -d "$2" ]; then
    mkdir -p "$2" || { echo "Error: failed to create directory $2"; exit 1; }
fi

for dir in "$1"/*; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -mindepth 1 -maxdepth 1 | wc -l)
        echo "$count" > "$2/$(basename "$dir")"
    fi
done
