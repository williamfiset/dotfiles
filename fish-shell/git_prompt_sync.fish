# Keep the git segment of the fish prompt in sync across every fish session
# (all herdr panes included) whenever a git command that changes repo state
# -- add, commit, checkout/switch, push, etc. -- runs anywhere.
#
# Mechanism: fish universal variables do NOT wake an idle session (tested:
# no propagation even after several seconds), so instead we broadcast
# SIGUSR1 to other fish sessions. Fish's --on-signal handler *does* fire
# mid-idle and can safely call `commandline -f repaint`, which redraws just
# the current prompt line with fresh git status.
#
# Signals are only ever sent to PIDs that registered themselves below, and
# only after re-confirming the PID is still a live fish process right
# before signaling. Broadcasting SIGUSR1 to every "fish"-named process on
# the machine (e.g. via pgrep) is NOT safe -- fish's default action for an
# untrapped SIGUSR1 is to terminate the process, and this killed an
# unrelated nested fish job during testing.
#
# This file covers git commands typed into interactive fish sessions. Git
# commands run by anything else (scripts, editors, agents, other shells)
# are covered by the global git hooks in ~/.config/git/hooks, which call
# git_prompt_broadcast to signal the sessions registered here. The
# interactive broadcast below is still needed for `git add`, which changes
# prompt state but updates no refs, so no git hook fires for it.
#
# Only interactive sessions may run this file: fish_postexec never fires in
# non-interactive shells (tested), and registering a short-lived shell as a
# signal receiver opens a window -- before the SIGUSR1 trap is installed,
# and again during teardown -- where an untrapped SIGUSR1 would kill it.

status is-interactive; or exit

set -g __git_state_watch_pattern '^\s*(command\s+)?git\s+(add|commit|checkout|switch|push|pull|fetch|merge|rebase|stash|branch|reset)\b'
set -g __git_state_pid_dir "$HOME/.cache/fish/git_prompt_sync"
mkdir -p $__git_state_pid_dir 2>/dev/null

touch "$__git_state_pid_dir/$fish_pid" 2>/dev/null

function __git_state_unregister --on-event fish_exit
    rm -f "$__git_state_pid_dir/$fish_pid" 2>/dev/null
end

function __git_state_repaint --on-signal SIGUSR1
    commandline -f repaint
end

function __git_state_broadcast --on-event fish_postexec
    string match -qr $__git_state_watch_pattern -- $argv[1]; or return
    for entry in $__git_state_pid_dir/*
        set -l pid (path basename $entry)
        test "$pid" = "$fish_pid"; and continue
        if ps -p $pid -o comm= 2>/dev/null | string match -qr 'fish$'
            kill -s USR1 $pid 2>/dev/null
        else
            rm -f $entry 2>/dev/null
        end
    end
end
