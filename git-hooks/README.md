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
cp git-hooks/git_prompt_broadcast git-hooks/dispatch git-hooks/post-* git-hooks/reference-transaction ~/.config/git/hooks/
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

Commands that fire no hook (index/worktree-only, no ref update): `git add`,
`git rm`, `git mv`, `git clean`, `git reset <pathspec>`. Interactive fish
catches these via its watch pattern; run from scripts/editors/agents they
won't broadcast until the next ref-touching command. Plain file edits are
likewise invisible. A repo-local `core.hooksPath` bypasses these hooks
entirely.
