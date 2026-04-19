set fish_greeting ''

fish_add_path ~/.local/bin

# Command shortcuts

abbr -a l ls -F
abbr -a ll ls -lhF
abbr -a la ls -ahF

abbr -a c cd
abbr -a .. cd ..
abbr -a ... cd ../..
abbr -a .... cd ../../..
abbr -a ..... cd ../../../..

# Path shortcuts
abbr -a drive cd "/Users/william/Library/CloudStorage/GoogleDrive-fisetwill@gmail.com/My Drive"
abbr -a github cd ~/Desktop/GitHub
abbr -a desk cd ~/Desktop

# Git commands
abbr -a gita git add -A
abbr -a gits git status
abbr -a gitc git commit -m 
abbr -a gitp git push
