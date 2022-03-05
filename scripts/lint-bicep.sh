#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=scripts/.env
. "$SCRIPT_DIR"/.env

for FILE in "$SCRIPT_DIR"/../infra/*.bicep
do
    echo "$FILE"
    
    if ! az bicep build --file "$FILE" > output.log 2>&1
    then
        echo Error: Lint Failed
        cat output.log
        exit 1
    elif [ "$( wc -l < output.log )" -ne "0" ]
    then
        echo Warnings: Lint Failed
        cat output.log
        exit 1
    fi
done

exit 0