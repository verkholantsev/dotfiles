#!/usr/bin/env bash

set -eu

FILES_TO_LINK=$(find . -maxdepth 1 | sed 's/^\.\///g' | grep -Ev "^\\.$|^\\.\\.$|^\\.git$|^install\\.sh$|.+\\.terminfo|^LICENSE$|^README.md$")

for FILE in $FILES_TO_LINK
do
    if [ -e "$HOME/$FILE" ]; then
        echo "File $FILE exists, it will be overriden. To cancel press Ctrl-C"
        read -r
        rm "$HOME/$FILE"
    fi
    echo ln "$FILE" "$HOME/$FILE"
    ln "$FILE" "$HOME/$FILE"
done

TERMINFO_FILES=$(find . -maxdepth 1 | grep -E ".+\\.terminfo")

for FILE in $TERMINFO_FILES
do
    echo tic -x "$FILE"
    tic -x "$FILE"
done
