## Colors ##
## Use tput to generate escape codes
## protect with \[\]
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4;tput bold)\]"
magenta="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"
reset="\[$(tput sgr0)\]"
bold="\[$(tput bold)\]"
