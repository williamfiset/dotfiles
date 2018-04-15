set fish_greeting ''

# Export statments

# Adds '.' to $CLASSPATH if it's not already there.
if not contains . $CLASSPATH
  set -x CLASSPATH . $CLASSPATH
end

# Adds '.' to $PATH if it's not already there.
if not contains . $PATH
  set -x PATH . $PATH
end

### Abbreviations ###

# Command shortcuts
abbr -a l ls -F
abbr -a ll ls -lhF
abbr -a la ls -ahF

# Git commands
abbr -a gita git add -A
abbr -a gits git status
abbr -a gitc git commit -m 
abbr -a gitp git push
abbr -a gitl "git log --oneline -n 10"

abbr -a c cd
abbr -a .. cd ..
abbr -a ... cd ../..
abbr -a .... cd ../../..
abbr -a ..... cd ../../../..
abbr -a ...... cd ../../../../..
abbr -a ....... cd ../../../../../..

# Path shortcuts
abbr -a kat cd ~/Dropbox/Programming/Competitions/Kattis
abbr -a drive cd ~/Google\ Drive/
abbr -a euler cd ~/Dropbox/Programming/Project_Euler/WIP
abbr -a uni cd ~/Dropbox/University/
abbr -a drop cd ~/Dropbox
abbr -a github cd ~/Desktop/GitHub
abbr -a desk cd ~/Desktop
abbr -a comp cd ~/Dropbox/Programming/Competitions

# Make directory and cd into it
function mkcd 
  mkdir -p $argv; and cd $argv
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/williamfiset/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/williamfiset/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/williamfiset/Downloads/google-cloud-sdk/path.fish.inc'; end; end
