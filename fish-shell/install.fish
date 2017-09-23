#!/usr/local/bin/fish

set -l DIR  "$HOME/.config/fish"

# Make a backup
cp -r "$DIR" "$DIR.bak"

cp config.fish "$DIR/config.fish"
echo $DIR/config.fish

# Create functions directory in case it doesn't exist
mkdir -p "$DIR/functions"

for f in (find functions/*.fish)
  set -l new_file "$DIR/$f"
  cp $f $new_file
  echo $new_file
end
