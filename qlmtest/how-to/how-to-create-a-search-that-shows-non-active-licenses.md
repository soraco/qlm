# How to create a search that shows non active licenses

To create a search that displays non active licenses, follow the steps below.

Note that non active licenses are defined below as revoked licenses as well as licenses that have expired.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the **search** dropdown button and select **Edit Searches**
* Click **Add**
* Set the Name field to: non-active keys
* In the SQL field, enter: Disabled=1 or SubscriptionExpiryDate < \[today\_start-1]
* Click Ok
* In the right hand panel where the searches are listed, locate your new search and click it.
