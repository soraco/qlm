# How to prevent the QLM Management Console from overwriting local email templates

Email templates are initially stored locally on your system and automatically uploaded to the server when the Email Templates Editor is closed.

When you launch the Email Templates Editor, the templates are automatically downloaded from the server. When the templates are downloaded, any local email template that is more recent than the server version is not overwritten.

To force QLM to overwrite local email templates, do the following:

* Locate the Email Templates folder. To locate this folder:
  * Go to the Manage Keys tab
  * Click Sites
  * Go to the Files and Folders tab
  * Copy the Email Templates folder and paste it in Windows Explorer to go to that folder
* In that folder, create an empty file called serverNoOverwrite.xml.

The serverOverwrite.xml will be automatically deleted the first time it is found so this technique is a one-time method.

Note that the file will be overwritten if a local email template is older than its server equivalent.
