
# Set keyboard speeds. First inspect current values:
defaults read -g KeyRepeat
defaults read -g InitialKeyRepeat

# Update values to something sensible:
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Configure sound to come out of monitor
# https://soundmacguy.wordpress.com/2017/11/08/setting-the-default-sound-device-automatically-switchaudiosoruce
brew install switchaudio-osx

$ switchaudiosource -a
LG UltraFine Display Audio (output)
Mac mini Speakers (output)

# Switch output source:
$ switchaudiosource -s "LG UltraFine Display Audio"

# However the output source doesn't persist for some reason between startups
# so one option is to setup a startup script:
https://superuser.com/questions/229773/run-command-on-startup-login-mac-os-x
