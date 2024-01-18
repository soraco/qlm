# How to create a search that returns trial customers who do not have a purchased license

If you want to target emails to trial customers who do not have a purchased license, you can create a search that excludes customers with a permanent or subscription license.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Search and then Edit Searches
* Click Add to add a new search
* Set a name to: Trials that expired in last 30 days
* Set the SQL fied to: licenseModel='trial' and Email Not In (Select Email from qryLicenseInfo where licensemodel<>'trial' and Email is not NULL) and SubscriptionExpiryDate > \[today\_start-30] and SubscriptionExpiryDate < \[today\_start] and IncludeInMailList <> 0 and Disabled=0
* Click Ok

Now you can create a scheduled task that uses this search.
