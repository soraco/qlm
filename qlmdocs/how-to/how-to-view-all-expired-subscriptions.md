# How to view all expired subscriptions

To view all expired subscription in the QLM Management console, you can create a search as described below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the "search" drop down and select "Edit Searches"
* Click Add to create a new search
* In the Name field, enter: Expired Subscriptions
* Pick an image&#x20;
* In the SQL field, enter: SubscriptionExpiryDate < \[today\_start -1]
* Select the New Search in the left hand list and relocate it by click on the UP / DOWN arrow buttons
* Click OK
* In the right hand panel, click the "Expired Subscriptions" link
* The grid now displays all your expired subscriptions
