
# set fish_greeting 'It is:' (date)
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

abbr -a c pushd
abbr -a cd pushd
abbr -a .. pushd ..
abbr -a ... pushd ../..
abbr -a .... pushd ../../..
abbr -a ..... pushd ../../../..
abbr -a ...... pushd ../../../../..
abbr -a ....... pushd ../../../../../..

# Path shortcuts
abbr -a kat pushd ~/Dropbox/Programming/Competitions/Kattis
abbr -a drive pushd ~/Google\ Drive/
abbr -a euler pushd ~/Dropbox/Programming/Project_Euler/WIP
abbr -a uni pushd ~/Dropbox/University/
abbr -a drop pushd ~/Dropbox
abbr -a github pushd ~/Desktop/GitHub
abbr -a desk pushd ~/Desktop
abbr -a comp pushd ~/Dropbox/Programming/Competitions








