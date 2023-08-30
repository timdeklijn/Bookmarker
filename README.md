# Bookmarker

![shell badge](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

A simple bash script to take descriptors + URLs from a file, use `fzf` to filter
and open the URL as a new tab in `firefox`.

## Installation

Make sure [fzf](https://github.com/junegunn/fzf) is installed.

Make the script executable and link it to a local bin folder (`usr/local/bin` on
Mac for example). Create a file called `.links.txt` in the user root folder
(`~/.links.txt`). The script can be called using `bookmarker`, and a `fzf`
window should appear.

## Usage

Write URLs into the links file in the following format:

``` text
name:    https://www.URL.com
```

The formatting of the file should follow these rules:

- The white space can be tabs or spaces,
- The URL should **always** start with `http://`.

## TODO

- [ ] Switch how to open browser based on OS
- [ ] select browser
