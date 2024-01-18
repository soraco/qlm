# Error parsing results: Unexpected DTD declaration

If you get the following error sepcified in the title when starting QLM, the QLM config file is possibly corrupted. This may happen if at the time QLM is updating the config file the computer crashes or the application crashes.

To resolve this, you must delete the config file. QLM will regenerate the config file the next time it starts up. Some settings may be lost.

To delete the config file:

* Exit QLM
* Go to the folder: %localappdata%\Soraco\_Technologies\_Inc\IsQuickLicenseMgr.exe\_StrongName\_???
* Locate the folder that corresponds to the version of QLM that you are running (example: 12.0.19086.4)
* Inside the version folder, rename the user.config file to \_user.config
* Restart QLM
