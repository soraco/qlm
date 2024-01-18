# Error: Configuration system failed to initialize

If you get the following error when launching the QLM Management Console, the typical reason is that the QLM configuration file has been corrupted. This can happen if the system or QLM crashes while QLM is writing the configuration file.

To resolve this issue, follow the steps below:

**QLM v16**

* In Windows Explorer, go to the following folder: %localappdata%\Soraco\_Technologies\_Inc\IsQuickLicenseMgr\_StrongName\_xxx
* In the folder above, you will find folders corresponding to different versions of QLM
* Locate the highest version and then go to this folder
* Rename the user.config file to user.config.old
* Launch the QLM Management Console

**QLM v15 or earlier**

* In Windows Explorer, go to the following folder: %localappdata%\Soraco\_Technologies\_Inc\IsQuickLicenseMgr.exe\_StrongName\_xxx
* In the folder above, you will find folders corresponding to different versions of QLM
* Locate the highest version and then go to this folder
* Rename the user.config file to user.config.old
* Launch the QLM Management Console
