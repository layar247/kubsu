#!/bin/bash

# Проверка количества аргументов
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path1> <path2>"
    exit 1
fi

# Проверка, существует ли path1
if [ ! -d "$1" ]; then
    echo "Error: path1 does not exist."
    exit 1
fi

# Проверка и создание path2 при необходимости
if [ ! -d "$2" ]; then
    mkdir -p "$2" || { echo "Error: failed to create directory $2"; exit 1; }
fi

# Обход подкаталогов в path1
for dir in "$1"/*; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -mindepth 1 -maxdepth 1 | wc -l)
        echo "$count" > "$2/$(basename "$dir")"
    fi
done
