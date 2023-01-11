#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "Path" }

PASS="$(gpg -d ~/.password-store/christia.gpg)"
STATUS=$?
if [ $STATUS -ne 0 ]; then
  killall gpg-agent
fi

if pass -c "$1" 2> /dev/null ; then
    echo "Password Copied to Clipboard"
else
    pass find "$1"
fi

