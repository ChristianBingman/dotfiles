#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "Path" }

if pass -c "$1" 2> /dev/null ; then
    echo "Password Copied to Clipboard"
else
    pass find "$1"
fi

