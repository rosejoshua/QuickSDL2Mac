#!/bin/bash

# In order to run this script, open a Terminal session
# to the same directory and type "chmod u+x comprun.sh"
# without the quotes once to update permissions. Then to
# run the script, from the same Terminal type "./comprun.sh"

# exit script at first error
set -u -e

# maybe need a check for clang or g++ here, then install xcode or a compiler
# if you get error related to Clang, you can try g++ compiler
#clang++ app.cpp -I/Library/Frameworks/SDL2.framework/Headers -F/Library/Frameworks -framework SDL2 -o app
g++ app.cpp -I/Library/Frameworks/SDL2.framework/Headers -F/Library/Frameworks -framework SDL2 -o app

# runs the app
./app
