# How to replicate the QLM database to a DR site

When configuring a License Server Site in the QLM Console, you can configure a disaster recovery (DR) site where your data will be replicated. The DR site can take over processing requests should the primary site fail. To configure a DR site, you must:

1. Install the QLM License Server on the DR server. Note that the License Server  on the DR site must have the same CommunicationEncryptionKey and AdminEncryptionKey as the primary site.
2. Install the QLM database on the DR server
3. Edit the web service profile in the QLM Console and add a URL to the QLM DR Site.

* Go to the Manage Keys tab
* Click Sites and select your profile
* In the Disaster Recovery Site field, enter the URL to the DR site.
* Click the Test button to verify that the site is reachable.



Once the web service is setup, setup a backup job as described below:



1. Go to the Backup tab then click on "Create Backup".
2. Enter a name for the backup
3. Select the License Server profile associated to your site.
4. Set the schedule to Run every 1 day, or as often as required.
5. Check the "Auto Restore option"
6. Check the "Always Backup Primary Site" option

Once the above steps are completed, all keys stored on the primary site will be replicated to the DR site.
