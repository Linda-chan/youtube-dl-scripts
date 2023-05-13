#!/bin/bash

# Show usage if no URLs provided...
if [ -z "$1" ] ; then
  # Just "$0" can be too long for absolute paths...
  echo "Usage: $( basename "$0" ) video-or-playlist-url [...]"
  echo "       $( basename "$0" ) -a list-file-name"
  echo "       $( basename "$0" ) --batch-file list-file-name"
  exit
fi

# Figure out script's directory...
MY_RP="$( readlink -e "$0" )"
MY_DP="$( dirname "$MY_RP" )"

# Set HOME to script's directory...
export HOME="$MY_DP"
export XDG_CACHE_HOME="$MY_DP/.cache"

# Call other BAT files in script's directory...
"$MY_DP/youtube-dl-prx-c9.sh" "$@"
"$MY_DP/youtube-dl-prx-c5.sh" "$@"
"$MY_DP/youtube-dl-prx-c0.sh" "$@"
