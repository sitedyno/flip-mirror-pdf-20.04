#!/bin/env sh

RESULT_PATH=/mnt/c/Users/Heath/Documents/pdf-flip-test/flipped
INPUT_PATH=/mnt/c/Users/Heath/Documents/pdf-flip-test/to-flip

walk_dir () {
    for pathname in "$1"/*; do
        if [ -d "$pathname" ]; then
            walk_dir "$pathname"
        elif [ -e "$pathname" ]; then
            case "$pathname" in *.pdf)
                printf '%s\n' "$pathname"
                /usr/bin/pdfjam --suffix flipped --reflect true --fitpaper true "$pathname"
                /usr/bin/rm "$pathname"
            esac
        fi
    done
}

cd $RESULT_PATH
pwd

walk_dir $INPUT_PATH

