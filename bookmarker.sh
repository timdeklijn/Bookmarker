#!/bin/bash
# bookmarker script. Use a specified file that contains a description and a
# link. This will be piped into fzf which filters it to a single line. The url
# on the line is passed to firefox which opens the url on a new tab.

# TODO: create the links file if it does not exist.
#
# from the text in the "links" file, use the first column as search in fzf.
# Thene give back the second column, place this in the `url` variable.
url=$(echo "$(cat ~/.links.txt)" | \
  fzf --color 16 | \
  awk '{print $NF}' \
)

# Early exit, if url is not set, exit the script and DO NOT open firefox.
if [ "$url" = "" ]; then
  echo "no link selected, exiting"
  exit 0
fi


# TODO: switch firefox call based on current OS. Currently this is only working
#       on MacOS, want to make it work on Linux too
if [[ $OSTYPE == 'darwin'* ]]; then
  echo 'macOS'
  open -a /Applications/Firefox.app $url
fi
