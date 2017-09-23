#!/usr/local/bin/fish

# Fish config directory
set -l DIR  "$HOME/.config/fish"

mkdir -p $DIR

# Make a backup
if not cp -r "$DIR" "$DIR.bak"
  echo "Error occured in backup phase"
  exit 1
end

cp config.fish "$DIR/config.fish"
echo $DIR/config.fish

# Create functions directory in case it doesn't exist
mkdir -p "$DIR/functions"

for f in (find functions/*.fish)
  set -l new_file "$DIR/$f"
  cp $f $new_file
  echo $new_file
end
