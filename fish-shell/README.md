
## Customization

You can customize the color scheme, prompt display type, and other settings by running the built-in configuration UI:

```
fish_config
```

This opens a browser-based interface where you can interactively change themes, prompts, abbreviations, and more.

Preferred settings:
- **Theme**: ayu Mirage
- **Prompt**: Informative Vcs

## git_prompt_sync

Keeps the git segment of the fish prompt in sync across every open fish session (e.g. multiple herdr panes) whenever a git command that changes repo state runs in any one of them.

To install, copy it into fish's `conf.d` so it's autoloaded on shell startup:

```
cp git_prompt_sync.fish ~/.config/fish/conf.d/git_prompt_sync.fish
```

It takes effect in new fish sessions (or run `source ~/.config/fish/conf.d/git_prompt_sync.fish` in existing ones).

This covers git commands typed into interactive fish sessions. To also refresh prompts when git runs from scripts, editors, agents, or other shells, install the companion global git hooks — see [`git-hooks/README.md`](../git-hooks/README.md).
