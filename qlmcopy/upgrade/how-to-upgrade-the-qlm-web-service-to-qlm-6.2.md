# How to upgrade the QLM web service to QLM 6.2

**Upgrade Procedure:**

To upgrade the QLM web service, we recommend that you create a new virtual directory and install a QLM web service in parallel to your existing QLM 5.x or 6.x web service. Both web services can be configured to point to the same database. Once the QLM v6.2 web service is configured and properly running, you can remove the previous QLM web service.

1. Update the DLLs on your web server with the DLLs located in DeployToServer\QlmWebService\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql.
3. Update the web.config file on your web server with the one located in DeployToServer\QlmWebService. Note that the web.config file in QLM v6.2 has changed significantly so you need to **completely** replace the existing web.config file and then update the following settings:
   1. connectionStrings
   2. communicationEncryptionKey
   3. adminEncryptionKey
   4. sqlSyntax
4. The QLM 6.2 web service depends on .NET 4.0. Therefore, the application pool that is associated with the QLM web service must be configured to use .NET 4.0.
5. Once the web service is updated, start the QLM application, go to Sites and click on Upgrade Database Schema.

Additionally, if you are using QLM Paypal integration, note that the email template has been modified to support carts with multiple items. Once upgraded to QLM 6.2, you need to modify the email template based on the new format. For details about the new format, consult the online help in the section "Quick License Manager Professional / Ecommerce integration / Supported Providers / Paypal".
