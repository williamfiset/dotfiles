# Computer Setup

Steps and software for setting up a new Mac.

## Apps

### Productivity

- **[Flycut](https://apps.apple.com/us/app/flycut-clipboard-manager/id442160987)** — clipboard manager with history. Access previous clipboard entries via a configurable shortcut (default: `Cmd+Shift+V`).
- **[Rectangle](https://rectangleapp.com/) / [Rectangle Pro](https://rectangleapp.com/pro)** — window management via keyboard shortcuts. Move and resize windows to halves, thirds, corners, and fullscreen without touching the mouse.

  #### Rectangle Pro Setup

  One thing I like to configure is **cycling between window sizes** on a single shortcut. For example, pressing `Ctrl+Cmd+←` cycles the focused window through 1/2, 2/3, and 1/3 of the screen width on the left side — tap it repeatedly to step through sizes without lifting your hands.

  <img src="imgs/rectangle_cycling.png" width="500" alt="Rectangle cycling between window sizes">

  Rectangle Pro supports this natively via its cycle actions. You can also set up custom window dimensions beyond the built-in presets — [this blog post](https://medium.com/ryan-hanson/custom-window-dimension-shortcuts-in-macos-e7df347dfd24) is where I discovered how to do that.
- **[RCMD](https://lowtechguys.com/rcmd/)** — app switcher using the right `Cmd` key + a letter to jump directly to any running app. Much faster than Spotlight (`Cmd+Space`) which requires typing the app name and doesn't have dedicated key mappings.
- **[OpenSuperWhisper](https://github.com/Starmel/OpenSuperWhisper)** — voice-to-text app. In my experience, far superior to macOS's built-in dictation.

  ```
  brew install opensuperwhisper
  ```

  After installing, open the app's settings and manually select the microphone you want to use — it doesn't default to the system input.

  Also pick which model you want to use, and set an initial prompt describing your preferred output format. By default, OpenSuperWhisper spells out numerals in full (e.g. "one" instead of "1") — an initial prompt with numerals already in it steers it toward writing numbers the way you actually want. The one I use:

  > Quick notes from today: standup is at 9:30, and I need to send 3 replies before 5:00. We shipped v2.4 to 128 users, the error rate dropped to 0.5%, and I closed 47 of 52 tickets. Budget is $1,200 through Q3 2025. Reach me at 555-0142 - I'm 2nd on the list.

## macOS System Settings

- **Keyboard repeat rate** — set to fastest repeat, shortest delay (System Settings > Keyboard).
- **Trackpad** — enable Tap to Click, increase tracking speed.
- **Dock** — auto-hide, remove unused apps.
- **Spotlight** — useful for quick app launches but slower than RCMD and lacks direct key mappings.
