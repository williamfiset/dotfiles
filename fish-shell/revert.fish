#!/usr/local/bin/fish

set -l DIR ~/.config/fish
rm -r $DIR 2> /dev/null; and mv "$DIR.bak" $DIR

