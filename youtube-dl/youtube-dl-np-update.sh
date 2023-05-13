#!/bin/bash

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

# Call main program...
sudo youtube-dl --proxy "" -U

# Generate usage in text file...
youtube-dl --help > "$MY_DP/youtube-dl.txt"
