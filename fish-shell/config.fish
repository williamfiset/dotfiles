set fish_greeting ''

fish_add_path ~/.local/bin

set -gx EDITOR vim

# Command shortcuts
abbr -a c cd
abbr -a .. cd ..
abbr -a ... cd ../..
abbr -a .... cd ../../..
abbr -a ..... cd ../../../..

# Path shortcuts
abbr -a drive cd "/Users/william/Library/CloudStorage/GoogleDrive-fisetwill@gmail.com/My\ Drive"
abbr -a github cd ~/Desktop/GitHub
abbr -a desk cd ~/Desktop

# Git commands
abbr -a gita git add -A
abbr -a gits git status
abbr -a gitc git commit -m 
abbr -a gitp git push

# SSH
abbr -a willmini ssh williamfiset@willmini.duckdns.org

# Tool replacements
abbr -a top btop

# Replace ls with eza. A modern file listing system. 
export EZA_COLORS="ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:su=0"
alias l='ls'
alias ls='eza --icons --group-directories-first'
alias la='ls -la'

# opencode
fish_add_path /Users/william/.opencode/bin
