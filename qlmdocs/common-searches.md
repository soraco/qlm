# Common Searches

This article shows how to create common searches to retrieve data that meet specific criteria.

### Licenses that were never activated&#x20;

This search displays all licences that have never been activated.

* Go to the Manage Keys tab
* Click the "search" dropdown and click Edit Searches
* Click Add to add a new search
* Set the name of the search to: Never Activated
* Set the Table to: \<Default>
* Set the SQL field to: ActivationDate is null and ReleaseDate is null
* Click OK
* In the right-hand panel, locate the newly created search and click it to display the data.

### Licenses that are not activated&#x20;

This search displays licences that are not currently activated. This includes never-activated licenses and licenses that were previously activated but are presently deactivated.&#x20;

* Go to the Manage Keys tab
* Click the "search" dropdown and click Edit Searches
* Click Add to add a new search
* Set the name of the search to: Non Activated
* Set the Table to: \<Default>
* Set the SQL field to: ActivationDate is null&#x20;
* Click OK
* In the right-hand panel, locate the newly created search and click it to display the data.

### Licenses that are revoked&#x20;

This search displays licences that have been revoked

* Go to the Manage Keys tab
* Click the "search" dropdown and click Edit Searches
* Click Add to add a new search
* Set the name of the search to: Revoked
* Set the Table to: \<Default>
* Set the SQL field to: Disabled = 1
* Click OK
* In the right-hand panel, locate the newly created search and click it to display the data.

### Licenses that do not have a maintenance plan

This search displays licences that have been revoked

* Go to the Manage Keys tab
* Click the "search" dropdown and click Edit Searches
* Click Add to add a new search
* Set the name of the search to: No Maintenance Plan
* Set the Table to: \<Default>
* Set the SQL field to: MaintenanceRenewalDate is null
* Click OK
* In the right-hand panel, locate the newly created search and click it to display the data.

### Licenses that have expired

This search displays licences that have been revoked

* Go to the Manage Keys tab
* Click the "search" dropdown and click Edit Searches
* Click Add to add a new search
* Set the name of the search to: Expired Licenses
* Set the Table to: \<Default>
* Set the SQL field to: SubscriptionExpiryDate < \[today\_start-1]
* Click OK
* In the right-hand panel, locate the newly created search and click it to display the data.





