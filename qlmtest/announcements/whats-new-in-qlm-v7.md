# What's new in QLM v7?

* Disaster Recovery support of the QLM web service integrated with our backup/restore feature.
* Faster backup and restore with reporting on synchronization status of the two sites
* Integration with Windows Azure.
* First version of our Analytics feature for QLM Enterprise. Monitor who installs your software, when they uninstall it, what version they are running, what OS, etc.
* User Interface improvements

Is this all? This is just a start. We will be gradually adding many more features to QLM v7. For more details about our development process, read this [article](http://soracoinc.com/Blog/tabid/102/EntryId/7/Iterative-Releases.aspx).

&#x20;**Upgrade Procedure:**

To uprade to QLM v7, you must first install the QLM Application on your client system by running the qlmsetup7.exe.

Then, you need to ugprade your QLM web service to v7. **Note that** without upgrading the QLM web service, the QLM application will not work.

To upgrade the QLM web service, we recommend that you create a new virtual directory and install a QLM web service in parallel to your existing QLM 5.x or QLM 6.x web service. Both web services can be configured to point to the same database. Once the QLM v7 web service is configured and properly running, you can remove the QLM 5é6 web service.&#x20;

1. Update the DLLs on your web server with the DLLs located in DeployToServer\QlmWebService\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql.&#x20;
3. Update the web.config file on your web server with the one located in  DeployToServer\QlmWebService. Note that the web.config file in QLM v6 has changed significantly so you need to **completely** replace the existing web.config file and then update the following settings:
   1. connectionStrings&#x20;
   2. communicationEncryptionKey
   3. adminEncryptionKey
   4. sqlSyntax
4. Configure the Application Pool associated to the QLM web service to use .NET 4.0.
5. Once the web service is updated, start the QLM application, go to Sites and click on Upgrade Database Schema.
