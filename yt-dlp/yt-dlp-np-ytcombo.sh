#!/bin/bash

# Show usage if no URLs provided...
if [ -z "$1" ] ; then
  # Just "$0" can be too long for absolute paths...
  echo "Usage: $( basename "$0" ) video-or-playlist-url [...]"
  echo "       $( basename "$0" ) -a list-file-name"
  echo "       $( basename "$0" ) --batch-file list-file-name"
  exit
fi

# Figure out current directory...
# We will use it where we need full path (like in HOME variable) and 
# "./" in other places. That's because I can't figure out how 
# to pass quoted filenames to variables which later I pass as param 
# to binary. It never goes like in BAT version. So I give up =_=
# By the way, for same reason I will use only safe file names =_=
MY_DP="$( pwd )"

# Set HOME to current directory. It will be handy in case of files 
# like .netrc, which program will seek in home directory (newer 
# versions have special parameter but old version doesn't)...
export HOME="$MY_DP"
export XDG_CACHE_HOME="$MY_DP/.cache"

# Call other BAT files in script's directory...
"$MY_DP/yt-dlp-np-c9.sh" "$@"
"$MY_DP/yt-dlp-np-c5.sh" "$@"
"$MY_DP/yt-dlp-np-c0.sh" "$@"
