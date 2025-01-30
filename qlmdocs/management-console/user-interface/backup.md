# Backup

QLM can schedule and perform backups of your database to your local computer. No special software is required on the server side to perform the backup or restore.

Note that if you have access to the SQL Server where your database is hosted, it is recommended to create backups directly in SQL Server. The QLM Backup option was designed for customers who cannot use SQL Server backup because they do not have direct access to SQL Server.

Additionally, if Soraco is hosting your QLM License Server, you should not create your own backups since Soraco already backs up your data. Creating your own backup creates an unnecessary load on our servers. If Soraco detects that you are creating your own backups, we will disable our backups.

Below are the steps required to create a backup job:

* Click on the Backup tab.
* Click on the **Create Backup** button.
  * Select the Enable checkbox.
* Type the name of the backup job.
* If you have multiple License Servers, select the License Server profile to use. Otherwise, select the Default profile.
* Specify how often the backup job will run.
* If you have configured a Disaster Recovery site, specify whether you would like the backup to be automatically restored to the DR site by checking the Auto Restore checkbox.
* If you have configured a Disaster Recovery site (DR), and the DR site is active, the backup will by default backup the active site, be it the primary site or the DR site. If you would like to always back up the primary site, whether it is active or passive, check the Always Backup Primary Site option. Note that if the primary site is not active, the Auto Restore feature is automatically disabled.

<figure><img src="../../.gitbook/assets/image (46).png" alt=""><figcaption></figcaption></figure>

To restore a backup job, follow the steps outlined below:

* Click on the Restore tab.
* Expand the backup job and select the snapshot to restore.
* Select the tables to restore. Note that data in the target tables will be deleted.
* Click on the Restore button or Restore to DR site button.

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

QLM provides basic feedback as to whether the primary site and the DR sites are synchronized by comparing the number of records in the LicenseKeys table on both sites. The first time you click on the Backup tab, a comparison between both sites is automatically triggered. You can request to compare two sites at any time by clicking on the Compare Now or Compare All buttons.
