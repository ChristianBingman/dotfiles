#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pass
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "Path" }

pass -c "$1"

