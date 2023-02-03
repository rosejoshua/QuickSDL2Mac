# QuickSDL2Mac
I went to get SDL running on my Mac after using it on Windows for a while and had a terrible time getting the newer version to work. After finally figuring it out, I wanted to put this together to hopefully save the next person a bunch of time and frustration.

This is with SDL 2 version 2.24.0 tested on MacOS Monterey 12.4 using Clang++. I tried to make it as beginner-friendly as possible.
Please reach out at j[AT]jrose.me if there is something confusing or needing correction.

## 1. Go download latest version of SDL for Mac (ends in .dmg, this method was tested with: SDL2-2.24.0.dmg): 
https://github.com/libsdl-org/SDL/releases/

## 2. Open a Terminal window
'COMMAND + SPACEBAR' -> search 'Terminal' and press 'Enter'

## 3a. [in Terminal] This command will resolve the filename of the downloaded SDL2 package and mount it for you: 
hdiutil attach ~/Downloads/SDL*.dmg
## 3b. (alternatively you can go double click the file in your Downloads thru finder)
## NOTE: You may get a security warning because the downloaded file is not trusted code. This can be fixed by going into System Preferences -> Security and Privacy, and look for the blocked action. You can click the lock icon to allow changes, approve the exception, and reclick the lock to save.

## 4a. [in Terminal] The below command will copy the SDL framework into '/Library/Frameworks' (make sure you only have one SDL2.*.dmg in your downloads folder or this will error. Multiple downloads can happen if you've been at this for a while). 
sudo cp -r /Volumes/SDL2/SDL2.framework /Library/Frameworks/
### Note: This is NOT the same as '~/Library/Frameworks'...both can work but my code is set up to use the root version of Library (/Library, not ~/Library)
## 4b. Alternatively, you can double click the mounted SDL2 on your desktop to see the contents of the downloaded SDL2 files if they're not showing already and drag the folder SDL2.framework into the 'Frameworks' folder in '/Library'. However, it is a pain to get finder to show you the proper root version of '/Library': https://www.macinstruct.com/tutorials/how-to-open-the-library-folder-on-your-mac/

## 5. [optional] This command will open the readme in TextEdit
open -a TextEdit /Volumes/SDL2/ReadMe.txt

## 6. [in Terminal, not super important for now] Eject/unmount .dmg (can do this on desktop using right-click -> 'eject' as well)
hdiutil unmount /Volumes/SDL2

## 7. [in Terminal] Navigate to a directory/folder where you want the downloaded project folder to be (anywhere memorable like a Dev folder or whatever) and input the below command to get the starter code (if you haven't already). The command 'cd ..' will go up one folder level, 'cd aDirectoryNameHere' will go into a directory/folder that exists in the current directory/folder, and 'mkdir ChooseADirectoryNameThatDoesntExist' will make a new directory, then you can use 'cd ChosenDirectoryNameGoesHere' to go into that folder/directory. Use the command 'ls' to see what is in the present directory. You can use the tab key after typing a few letters and Terminal will attempt to complete a name if it exists.
git clone https://github.com/rosejoshua/QuickSDL2Mac.git

## 8. [in Terminal] Input the command 'ls' and you should see the new folder/directory that downloaded. Go into the folder we just downloaded from github
cd QuickSDL2Mac

## 9. [optional: take a look at the folder contents]
ls -a

## 10. [in Terminal] Make sure you have Clang++ compiler by checking for the version by inputing the next command. If you get something other than a version number that resembles computer speak for 'wtf' then go to step 11. Otherwise skip to step 12.
clang++ -v

## 11. [in Terminal] If you obviously don't have Clang++ from the resulting message you can download XCode for Mac to get it
command xcode-select --install
## Note: make sure you close the terminal window and open a new one to verify the 'clang++ -v' command so it can see the new install

## 12. [in Terminal] This command will increase permissions for the script (list of commands like the one's we've been inputing that autoexecute) that builds and launches the c++ app (obviously read thru the script and make sure it's not a virus :P)
chmod u+x comprun.sh

## 13a. [in Terminal] Use the below command to run the script to try and compile the c++ code, you will probably get the security error because we are trying to use downloaded SDL2 code and MacOs doesn't trust it by default like the earlier security problem you may have experienced. Hopefully you see the popup. You then need to open 'Security and Privacy' (COMMAND + SPACEBAR -> search "security and privacy" and press 'Enter'). Look for the option to approve the security exception, (click the lock icon as needed to allow changes and save). Then try and run the script again:
./comprun.sh

## 13b. Rerun the above command after your changes to the program to recompile and relaunch the app.
