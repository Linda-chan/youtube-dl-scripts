#!/bin/bash

# Show usage if no URLs provided...
if [ -z "$1" ] ; then
  echo Usage: $0 video-or-playlist-url [video-or-playlist-url [...]]
  exit
fi

# Figure out script's directory...
MY_RP=$( readlink -e "$0" )
MY_DP=$( dirname "$MY_RP" )

# Set HOME to script's directory...
export HOME=$MY_DP
export XDG_CACHE_HOME=$MY_DP

# Call other BAT files in script's directory...
"$MY_DP/youtube-dl-prx-c9.sh" "$@"
"$MY_DP/youtube-dl-prx-c5.sh" "$@"
"$MY_DP/youtube-dl-prx-c0.sh" "$@"
