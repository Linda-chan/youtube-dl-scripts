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

# Main options...
PARAMS="$PARAMS --force-ipv4"
PARAMS="$PARAMS --buffer-size 2097152"

# Fanservice options...
PARAMS="$PARAMS --xattrs"
PARAMS="$PARAMS --add-metadata"
PARAMS="$PARAMS --embed-chapters"

# Instead of --all-subs from youtube-dl: download all subs except 
# live chat which leads to errors and uninteresting anyway...
PARAMS="$PARAMS --sub-langs=all,-live_chat"
PARAMS="$PARAMS --embed-subs"

PARAMS="$PARAMS --write-thumbnail"
PARAMS="$PARAMS --embed-thumbnail"

PARAMS="$PARAMS --console-title"

# Don't stop if program is unable to import thumbnail...
PARAMS="$PARAMS --ignore-errors"

# Set timeout to 180 sec...
PARAMS="$PARAMS --socket-timeout 180"

# Mark YouTube videos as watched...
PARAMS="$PARAMS --mark-watched"

# Custom config file in current directory...
if [[ -e "./ytdl-patched.cfg" ]] ; then
  PARAMS="$PARAMS --config-location ./ytdl-patched.cfg"
fi

# Rare options...
#PARAMS="$PARAMS --write-description"
#PARAMS="$PARAMS --write-info-json"
#PARAMS="$PARAMS --write-annotations"
#PARAMS="$PARAMS --write-auto-sub"

# Add support for .netrc file only if it exist. Also change rights 
# on this file for yt-dlp pleasure... Both things will fight 
# error messages.
if [[ -e "./.netrc" ]] ; then
  PARAMS="$PARAMS --netrc"
  chmod 600 "./.netrc"
fi

# Add support for cookies.txt file only if it exist.
if [[ -e "./cookies.txt" ]] ; then
  PARAMS="$PARAMS --cookies ./cookies.txt"
fi

# Call main program...
yt-dlp --proxy "" --format best $PARAMS "$@"
