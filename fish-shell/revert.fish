#!/usr/local/bin/fish

set -l DIR ~/.config/fish

if not test -d "$DIR.bak"
  echo "No backup found"
else
  rm -r $DIR 2> /dev/null
  mv "$DIR.bak" $DIR
end

