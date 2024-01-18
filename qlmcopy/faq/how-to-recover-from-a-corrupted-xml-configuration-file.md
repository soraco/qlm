# How to recover from a corrupted xml configuration file

Under certain circumstances, the QLM xml configuration files might get corrupted. For example, this can occur if the system crashes or reboots while the xml file is being saved.

The QLM xml configuration files are stored in _%appdata%\Soraco\Quick License Manager_.

Example of configurations files are:

* profiles.xml
* scheduledTasks.xml
* products.\*.xml
* \*.queries.xml

Whenever a new configuration file is created, QLM creates a backup of the previous xml file in the _%appdata%\Soraco\Quick License Manager\bak_ folder.&#x20;

If an xml file gets corrupted, you have 2 options:

* Recover the backed up xml file.
* Recover the factory xml file.

#### How to recover the backed up xml file

* Go to the **bak** folder referenced above.
* Locate the most recent valid backup. The backup files have the original filename suffixed with the date of the backup.
* Copy the most recent backup identied above to _%appdata%\Soraco\Quick License Manager_.
* Renamed the copied file to the original filename (remove the date suffix).

#### How to recover the factory xml file

* Go to the QLM Installation folder.
* Locate the original file.
* Copy the file identied above to _%appdata%\Soraco\Quick License Manager_.
