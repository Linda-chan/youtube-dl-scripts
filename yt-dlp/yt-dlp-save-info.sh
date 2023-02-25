#!/bin/bash

# Figure out script's directory...
MY_RP="$( readlink -e "$0" )"
MY_DP="$( dirname "$MY_RP" )"

# Set HOME to script's directory...
export HOME="$MY_DP"
export XDG_CACHE_HOME="$MY_DP/.cache"

# Set text file name for easy access...
FILE_NAME="$MY_DP/yt-dlp-info.txt"

# Clear text file...
cp /dev/null "$FILE_NAME"

# Call main program in script's directory...
echo "===[ User agent ]====================================================" >> "$FILE_NAME"
echo "" >> "$FILE_NAME"
yt-dlp --dump-user-agent >> "$FILE_NAME"
echo "" >> "$FILE_NAME"

echo "===[ Extractors ]====================================================" >> "$FILE_NAME"
echo "" >> "$FILE_NAME"
yt-dlp --list-extractors >> "$FILE_NAME"
echo "" >> "$FILE_NAME"

echo "===[ Extractor descriptions ]========================================" >> "$FILE_NAME"
echo "" >> "$FILE_NAME"
yt-dlp --extractor-descriptions >> "$FILE_NAME"
echo "" >> "$FILE_NAME"

# All done!
echo "Info was saved to: "$FILE_NAME
