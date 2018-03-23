set fish_greeting ''

# Export statments

# Add Python 3 to PATH
# set --global --export PATH /Library/Frameworks/Python.framework/Versions/3.5/bin/ $PATH

# MongoDB
# set --global --export PATH /opt/mongodb/bin $PATH

# Scala
# set --global --export SCALA_HOME /opt/scala
# set --global --export PATH $SCALA_HOME/bin $PATH

# Maven
# set --global --export PATH /opt/maven/bin/ $PATH

# Hamcrest
# set --global --export CLASSPATH /opt/hamcrest/hamcrest-junit-2.0.jar $CLASSPATH

# JUnit
# set --global --export JUNIT_HOME /opt/junit
# set --global --export PATH $JUNIT_HOME $PATH
# set --global --export CLASSPATH $JUNIT_HOME/junit-4.12.jar $CLASSPATH

# Add . to Java classpath
set --global --export CLASSPATH . $CLASSPATH

# Added current path to $PATH
set --global --export PATH . $PATH

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
