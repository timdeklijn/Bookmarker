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

# Based on the operating system open firefox and open the url in a new tab.
if [[ $OSTYPE =~ ^darwin ]]; then
  # There is not really a nice command line interface for firefox on MacOS. So
  # we have to call firefox from the `Applications` folder. This is not ideal,
  # but works.
  open -a /Applications/Firefox.app $url
elif [[ $OSTYPE =~ ^linux ]]; then
  # Linux has a nice way to open a new tab in firefox.
  firefox --new-tab $url
else
  echo "OS not supported"
fi
