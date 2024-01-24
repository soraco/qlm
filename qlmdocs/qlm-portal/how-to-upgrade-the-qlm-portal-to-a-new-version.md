# How to upgrade the QLM Portal to a new version

To upgrade the QLM Portal Server to a new version:

* Make a backup of the existing QLM Portal files on your server.
* Delete all files in the existing QLM Portal folder on your server. Make sure you have completed the previous step first.
* Copy the new QLM Portal files from C:\Users\Public\Quick License Manager\DeployToServer\QlmPortal to your QLM Portal folder on your server
* Edit the web.config on your server and copy the following settings from your previous web.config (in your backup folder)
  * connectionStrings section
  * \<add key="communicationEncryptionKey" value="your previous value"/>\
    \<add key="adminEncryptionKey" value="your previous value"/>\
    \<add key="qlmVersion" value="5.0.00"/>\
    \<add key="sqlSyntax" value="your previous value"/>\
    \<add key="webServiceUrl" value="your previous value/>

&#x20;This completes the step to upgrade the QLM Portal.
