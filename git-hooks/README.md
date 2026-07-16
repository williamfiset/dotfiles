# Global git hooks

Companion to [`fish-shell/git_prompt_sync.fish`](../fish-shell/git_prompt_sync.fish).
The fish script only sees git commands typed into interactive fish sessions;
these global hooks catch git commands run by anything else (scripts, editors,
agents, other shells) and signal every registered fish session to repaint its
prompt.

## Files

- `git_prompt_broadcast` — plain-sh script that sends SIGUSR1 to every fish
  PID registered in `~/.cache/fish/git_prompt_sync/` (after re-confirming
  each PID is still a live fish process; stale entries are cleaned up).
- `dispatch` — shared dispatcher the hook wrappers exec. Chains to the
  repo-local `.git/hooks/<name>` hook first (since `core.hooksPath` overrides
  repo hooks entirely), then runs the broadcast.
- `post-commit`, `post-checkout`, `post-merge`, `post-rewrite`,
  `reference-transaction` — two-line wrappers that exec `dispatch`.

## Install

```
mkdir -p ~/.config/git/hooks
cp git_prompt_broadcast dispatch post-* reference-transaction ~/.config/git/hooks/
chmod +x ~/.config/git/hooks/*
git config --global core.hooksPath ~/.config/git/hooks
```

## Cautions

- `core.hooksPath` disables repo-local `.git/hooks` globally; `dispatch`
  compensates by chaining to them, so husky-style per-repo hooks keep
  working.
- Do NOT resolve the local hook with `git rev-parse --git-path hooks` inside
  `dispatch`: hooks inherit git config through the environment, so that
  resolves back to this directory and made `dispatch` exec itself in an
  infinite fork loop (thousands of processes). `--git-dir` plus a
  `GIT_PROMPT_SYNC_DISPATCH` env guard prevents this.

## Gaps

What the hooks do and don't catch (verified empirically on git 2.50):

- **Index/worktree-only operations fire no hook at all** — git provides
  none for them: `git add`, `git rm`, `git mv`, `git clean`, and
  `git reset <pathspec>` (the unstage form) change staged/dirty/untracked
  counts without touching any ref. The `fish_postexec` watch pattern in
  `git_prompt_sync.fish` covers them when typed into an interactive fish
  session, but when run from a script, editor, or agent, other panes won't
  repaint. This self-heals at the next ref-touching command (usually the
  commit that follows an `add`).
  Note that `git restore` (including `--staged`) and `git checkout -- <file>`
  are NOT gaps — they fire `post-checkout` despite updating no refs.
- **Plain file edits aren't git actions.** Saving a file in an editor makes
  the repo dirty, but neither the hooks nor the fish broadcast can see it.
  A pane's prompt catches up the next time it redraws (any keypress/command
  in that pane). Closing this would need filesystem watching (fswatch on
  the worktree), which isn't worth the weight here.
- **A repo-local `core.hooksPath` bypasses these hooks entirely** — a repo
  or tool that sets its own hooks path in local config wins over the global
  one, and its git commands won't broadcast.
- **Only local git activity is visible.** A push from another machine, or a
  teammate's merge on the server, changes nothing locally until you fetch —
  prompts update when that fetch (or pull) runs, from any invoker.
