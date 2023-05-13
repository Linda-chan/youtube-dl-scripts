#!/bin/bash

# Show usage if no URLs provided...
if [ -z "$1" ] ; then
  echo "Usage: $0 video-or-playlist-url [...]"
  echo "       $0 -a list-file-name"
  echo "       $0 --batch-file list-file-name"
  exit
fi

# Figure out script's directory...
MY_RP="$( readlink -e "$0" )"
MY_DP="$( dirname "$MY_RP" )"

# Set HOME to script's directory...
export HOME="$MY_DP"
export XDG_CACHE_HOME="$MY_DP/.cache"

# Call other BAT files in script's directory...
"$MY_DP/ytdl-patched-np-c9.sh" "$@"
"$MY_DP/ytdl-patched-np-c5.sh" "$@"
"$MY_DP/ytdl-patched-np-c0.sh" "$@"
