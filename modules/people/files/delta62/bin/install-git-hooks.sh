#!/bin/bash
#
# Install git hook scripts into a local repository
#
# Run this script in the root of a git repository. It won't work if you run it from
# somewhere under the repo root.
#

if [[ ! -d '.git' ]]; then
    &>2 echo 'This is not the root of a git repository. Cannot install git hook scripts.'
fi

cp -rv "$BOXEN_USER_FILES/.git" .
