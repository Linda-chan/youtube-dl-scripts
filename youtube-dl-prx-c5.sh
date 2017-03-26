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

# Main options...
PARAMS=$PARAMS" --netrc"
PARAMS=$PARAMS" --force-ipv4"
PARAMS=$PARAMS" --buffer-size 2097152"

# Fanservice options...
PARAMS=$PARAMS" --xattrs"
PARAMS=$PARAMS" --add-metadata"

PARAMS=$PARAMS" --all-subs"
PARAMS=$PARAMS" --embed-subs"

PARAMS=$PARAMS" --write-thumbnail"
PARAMS=$PARAMS" --embed-thumbnail"

# Don't stop if program is unable to import thumbnail...
PARAMS=$PARAMS" --ignore-errors"

# Rare options...
#PARAMS=$PARAMS" --write-description"
#PARAMS=$PARAMS" --write-info-json"
#PARAMS=$PARAMS" --write-annotations"

# Change rights on .netrc file for youtube-dl pleasure...
chmod 600 "$MY_DP/.netrc"

# Call main program...
youtube-dl --format webm $PARAMS "$@"
