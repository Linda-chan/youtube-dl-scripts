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
HOME=$MY_DP

# Call other BAT files in script's directory...
"$MY_DP/youtube-dl-np-c9.sh" "$@"
"$MY_DP/youtube-dl-np-c5.sh" "$@"
"$MY_DP/youtube-dl-np-c0.sh" "$@"
