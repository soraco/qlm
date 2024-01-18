# Archiving license keys

As your QLM database grows, you may want to consider archiving some license keys that are no longer active. For example, trial keys that have expired are a prime candidate for archival.

When license keys are archived, they are moved from the primary license keys tab (LicenseKeys) to a history table (LicenseKeysHistory). After successful archival, the OrderStatus of an archived license is set to 'Archived'.

To archive license keys:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Archive
* To archive trials, check "Archive Expired Trials" and select the number of days since the license was expired.
* To archive revoked licenses, check "Archive revoked licenses"
* To restrict the scope of the above operations, set a date range for the Order Date.
* Finally, to archive specific rows, select the rows in the grid and then check "Archive Selected Rows"
* Click Test to view the number of affected records
* If the number of records matches your expectations, click Archive.

It is recommended to perform a database backup before archiving large datasets.&#x20;

Once licenses are archived, they can be selectively unarchived from the Unarchive button.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360092040372/mceclip0.png)
