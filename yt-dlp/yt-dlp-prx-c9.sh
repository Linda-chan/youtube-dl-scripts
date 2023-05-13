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

# Rare options...
#PARAMS="$PARAMS --write-description"
#PARAMS="$PARAMS --write-info-json"
#PARAMS="$PARAMS --write-annotations"
#PARAMS="$PARAMS --write-auto-sub"

# Add support for .netrc file only if it exist. Also change rights 
# on this file for yt-dlp pleasure... Both things will fight 
# error messages.
if [[ -e "$MY_DP/.netrc" ]] ; then
  PARAMS="$PARAMS --netrc"
  chmod 600 "$MY_DP/.netrc"
fi

# Call main program...
# Unlike BAT file version, check custom config file here. I was able 
# to add full file path in PARAMS varianle with quotes but when 
# I call yt-dlp binary for some reason it get this path without 
# quotes =_= So I give up =_=
if [[ -e "$MY_DP/yt-dlp.cfg" ]] ; then
  yt-dlp --format worst $PARAMS --config-location "$MY_DP/yt-dlp.cfg" "$@"
else
  yt-dlp --format worst $PARAMS "$@"
fi
