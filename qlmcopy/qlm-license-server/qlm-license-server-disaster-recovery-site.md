# QLM License Server - Disaster Recovery Site

When configuring a License Server site in the QLM Console, you can configure a disaster recovery (DR) site where your data will be replicated. The DR site can take over processing requests should the primary site fail.

To configure a DR site, you must:

\- Install the QLM License Server on the DR server (skip this step if Soraco is hosting your QLM License Server)

\- Install the QLM database on the DR server (skip this step if Soraco is hosting your QLM License Server).

\- Edit the License Server profile in the QLM Console and add a URL to the QLM DR Site.

If Soraco is hosting your site, the URL is the same as the main site URL except for the domain name that should be replaced with qlmdr.com. For example, if your main site URL is: http://qlm3.net/mycompany/qlmlicenseserver/qlmservice.asmx, your DR site URL will be: http://qlmdr.com/mycompany/qlmlicenseserver/qlmservice.asmx

\- Setup a backup job in QLM to backup the database on a daily basis (or as often as required). To setup a backup job, click on the Backup tab then click on "Create Backup" (skip this step if Soraco is hosting your QLM License Server).

&#x20;

\- Configure the backup job to automatically restore data to the DR site when the backup is completed. This is done by checking the AutoRestore checkbox when configuring the backup (skip this step if Soraco is hosting your QLM License Server).

&#x20;

Once the above steps are completed, all keys stored on the primary site will be restored to the DR site after the backup completes.

### QLM License Server redirection for your application

QLM also supports the redirection of the QLM License Server to a disaster recovery site in your application. This will allow your customers to successfully contact the DR site when the primary site is down.

### Your application's failover

Failover to a disaster recovery site is controlled via an XML file that you place on your server. A sample XML file is located in the QLM installation folder and is called qlmredirect.xml. The XML file contains the URL to the active QLM License Server. If your primary QLM site is down and you want to failover to the DR site, you need to change the URL in the qlmredirect.xml to point to your DR site. Note that the qlmredirect.xml file should never be located at your primary site.

Failover is purposely non-automated. If failover was automatic, small network glitches could trigger a failover and cause some data to be stored on the primary site and other data on the DR site. QLM does not support merging data that has been updated on both ends.

### Code changes to enable redirection in your application

In your code, when initializing the QlmLicense object, you must set 2 properties:

\- EnableDRSite

\- RedirectorUrl

&#x20;To enable redirection, set EnableDRSite to true. To specify the URL to the qlmredirect.xml file, set the RedirectorUrl to the URL that points to this file.

For example:

QlmLicense license = new QlmLicense ();\
license.DefineProduct (...);\
license.EnableDRSite = true;\
license.RedirectorUrl = "httlp://soraco.co/qlmredirect.xml";

Note that after failing to a DR site, new data will be written to the DR site. When your primary site is online again, you may want to replicate all the data on the DR site to the Primary Site. This can be done from the Backup / Restore tab. Note that QLM does not merge data when restoring. All data is overwritten from the backup. Exercise extreme caution when performing restores. It is highly recommended that you perform your own database backup before restoring data to the QLM database.
