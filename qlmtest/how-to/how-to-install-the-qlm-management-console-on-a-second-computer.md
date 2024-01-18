# How to install the QLM Management Console on a second computer

Each QLM license entitles you to install the QLM Management Console on a single computer for a single user. Before proceeding with the installation below, ensure that you have the required licenses to install the QLM Management Console on an additional computer.

To install the QLM Management Console on a second computer and connect it to your existing License Server, follow the steps below.

* On the machine where QLM is already installed:
  1. Make a backup of the following folder, **including subfolders:** %appdata%\Soraco\Quick License Manager
  2. Make a backup of the following folder, **including subfolders:** %localappdata%\Soraco\_Technologies\_Inc
* Install QLM on the new system but do not launch it yet (if you already launched it, close it).
* Copy the backed up files in step (1) above to %appdata%\Soraco\Quick License Manager on the new system
* Copy the backed up files in step (2) above to %localappdata%\Soraco\_Technologies\_Inc on the new system
* Launch the QLM Management Console on the new system.
* Activate your license using your activation key.
* IMPORTANT: If you are prompted to upload products to the server, answer NO or Cancel.
* After QLM starts up, go to the Manage Keys tab.
* Click Sites and select your site.&#x20;
* Click Download Products from the License Server.
* Click OK and close the Site editor.

Note that if during the upgrade you are prompted to upgrade the Database Schema, you can safely answer Yes.
