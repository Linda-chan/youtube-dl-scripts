#!/bin/bash

MY_RP=$( readlink -e "$0" )
MY_DP=$( dirname "$MY_RP" )

HOME=$MY_DP

sudo youtube-dl -U
youtube-dl --help > $HOME"/youtube-dl.txt"
