## Themes

List the available built-in themes and preview them right in the terminal:

```
ghostty +list-themes
```

Set one by adding `theme = <name>` to the config file.

## Install

Ghostty reads its config from `~/.config/ghostty/config`. Copy the config from this repo to that path:

```
mkdir -p ~/.config/ghostty
cp terminals/ghostty/config ~/.config/ghostty/config
```

Restart Ghostty (or reload with `cmd+shift+,`) to apply the changes.

## Config

Once installed, open the config in your `$EDITOR` with:

```
ghostty +edit-config
```
