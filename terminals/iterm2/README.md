## Themes

One theme I like to use is the [iterm Dracula](https://github.com/dracula/iterm) theme. There's also a [Dracula theme for tmux](https://github.com/dracula/tmux).

## Key Remapping

To remap `Cmd + Arrow` keys for moving to the start/end of a line, go to:

**iTerm2 → Settings → Profiles → Keys → Key Mappings**

Add the following mappings:

| Shortcut | Action | Value |
|---|---|---|
| `Cmd + ←` | Send Hex Code | `0x01` |
| `Cmd + →` | Send Hex Code | `0x05` |
| `Option + Backspace` | Send Hex Code | `0x1b 0x7f` |

`0x01` moves the cursor to the start of the line and `0x05` moves it to the end. `0x1b 0x7f` deletes the entire word to the left of the cursor.
