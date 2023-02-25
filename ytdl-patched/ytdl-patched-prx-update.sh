#!/bin/bash

# Figure out script's directory...
MY_RP="$( readlink -e "$0" )"
MY_DP="$( dirname "$MY_RP" )"

# Set HOME to script's directory...
export HOME="$MY_DP"
export XDG_CACHE_HOME="$MY_DP/.cache"

# Call main program...
sudo ytdl-patched -U

# Generate usage in text file...
ytdl-patched --help > "$MY_DP/ytdl-patched.txt"
