#!/bin/bash

# Figure out script's directory...
MY_RP=$( readlink -e "$0" )
MY_DP=$( dirname "$MY_RP" )

# Set HOME to script's directory...
HOME=$MY_DP

# Call main program...
sudo youtube-dl --proxy "" -U

# Generate usage in text file...
youtube-dl --help > $MY_DP"/youtube-dl.txt"
