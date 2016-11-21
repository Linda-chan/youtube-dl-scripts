#!/bin/bash

#MY_RP=$( realpath "$0" )
MY_RP=$( readlink -e "$0" )
MY_DP=$( dirname "$MY_RP" )

HOME=$MY_DP

if [ -z "$1" ] ; then
  echo Usage: $0 video-or-playlist-url
  exit
fi

chmod 600 "$MY_DP/.netrc"
youtube-dl "$1" --proxy "" --format worst --netrc --all-subs --force-ipv4 --xattrs
