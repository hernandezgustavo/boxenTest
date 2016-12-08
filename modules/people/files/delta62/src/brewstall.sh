#!/bin/bash
#
# Install Homebrew stuff from a file
#

if [ "$#" -ne 1 ]; then
    echo 1>&2 "Usage: $0 file"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo 1>&2 "\"$1\" does not exist."
    exit 1
fi

BREW_REGEX='^([^[:space:]]+)$'
COMMENT_REGEX='^#'
EMPTY_LINE_REGEX='^$'
TAP_REGEX='^tap[:space:]+([^[:space:]]+)'

while read -r LINE || [ -n "$LINE" ]; do
    if [[ $LINE =~ $COMMENT_REGEX ]]; then
        continue
    elif [[ $LINE =~ $EMPTY_LINE_REGEX ]]; then
        continue
    elif [[ $LINE =~ $TAP_REGEX ]]; then
        # brew tap "${BASH_REMATCH[1]}"
        echo "tap ${BASH_REMATCH[1]}"
    elif [[ $line =~ $BREW_REGEX ]]; then
        # brew install "${BASH_REMATCH[1]}"
        echo "install ${BASH_REMATCH[1]}"
    else
        echo 1>&2 "Error parsing line \"$LINE\""
        exit 1
    fi
done < "$1"
