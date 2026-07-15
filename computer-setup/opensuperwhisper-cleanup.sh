#!/bin/bash
# Deletes OpenSuperWhisper recordings older than 4 days.
# Recordings are named by Unix timestamp (e.g. 1783814303.wav).
#
# Run manually:
#   ./opensuperwhisper-cleanup.sh
#
# Run via cron (daily at 2pm):
#   0 14 * * * /Users/william/Desktop/github/dotfiles/computer-setup/opensuperwhisper-cleanup.sh >> /tmp/opensuperwhisper-cleanup.log 2>&1

RECORDINGS_DIR="$HOME/Library/Application Support/ru.starmel.OpenSuperWhisper/recordings"
MAX_AGE_DAYS=4

find "$RECORDINGS_DIR" -name "*.wav" -type f -mtime "+${MAX_AGE_DAYS}" -print -delete
