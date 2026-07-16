My personal configuration files. Feel free to snoop and take whatever you please.

## tmux

The tmux config uses `ctrl + arrow keys` for pane selection (without prefix). On macOS, these key combinations are mapped to Mission Control by default (e.g., Ctrl+Up for Mission Control, Ctrl+Down for App Windows, Ctrl+Left/Right for switching desktops). You need to unmap them:

1. Open **System Settings** > **Keyboard** > **Keyboard Shortcuts** > **Mission Control**
2. Uncheck or remap:
   - **Mission Control** (Ctrl+Up)
   - **Application Windows** (Ctrl+Down)
   - **Move left a space** (Ctrl+Left)
   - **Move right a space** (Ctrl+Right)

### tcd

`bin/tcd` changes the working directory of multiple tmux panes at once. Symlink or copy it onto your `$PATH` (e.g. `~/.local/bin`) to use it.

```
tcd [DIR]           cd panes in the CURRENT window (default: $PWD)
tcd -s [DIR]        cd panes in the whole current session
tcd -a [DIR]        cd panes in all sessions
tcd -f [DIR]        force: send to every pane, even non-shell ones
```

It works by listing the target panes' pane IDs and current running command via `tmux list-panes -F '#{pane_id} #{pane_current_command}'`, then using `tmux send-keys` to type ` cd '<dir>'` followed by Enter into each one. By default it only sends the `cd` to panes whose foreground process is a plain shell (`bash`, `zsh`, `fish`, `sh`, `ksh`, `dash`) — panes running something else (vim, a REPL, a long-lived process) are skipped and reported, so you don't inject text into the wrong program. Pass `-f` to force-send to every pane regardless of what's running. The leading space on the injected command keeps it out of shell history when `HISTCONTROL`/`HIST_IGNORE_SPACE` is set to ignore space-prefixed commands.

Must be run from inside a tmux session (checks `$TMUX`). Run `tcd -h` for the same usage summary.
