#!/usr/bin/env bash

FILES=$(ls -a | egrep -v "^\.$|^\.\.$|^\.git$|install\.sh")

for FILE in $FILES; do
    if [ -e ~/$FILE ]; then
        echo "File $FILE exists, it will be overriden. To cancel press Ctrl-C"
        read
        rm ~/$FILE
    fi
    ln $FILE ~/$FILE
    echo $FILE
done
