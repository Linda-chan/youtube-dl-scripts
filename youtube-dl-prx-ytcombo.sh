#!/bin/bash

MY_RP=$( readlink -e "$0" )
MY_DP=$( dirname "$MY_RP" )

if [ -z "$1" ] ; then
  echo Usage: $0 video-or-playlist-url
  exit
fi

"$MY_DP/youtube-dl-prx-c9.sh" "$1"
"$MY_DP/youtube-dl-prx-c5.sh" "$1"
"$MY_DP/youtube-dl-prx-c0.sh" "$1"
