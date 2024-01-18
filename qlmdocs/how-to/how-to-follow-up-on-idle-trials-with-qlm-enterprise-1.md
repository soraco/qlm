# How to follow up on idle trials with QLM Enterprise

If you provide a trial version of your application, wouldn't it be nice to know which trials have gone idle and send an automated email to the potential customer to see what's going on?

Well, you can with QLM Enterprise 9.2.16330.1+. This article describes how to configure QLM to accomplish just that. It is assumed that you are already using the QLM Enterprise API to register a customer installation as described in this [article.](https://support.soraco.co/hc/en-us/articles/211023083)&#x20;

**Create a custom search**

The first step is to create a search that returns the idle trials. An idle trial is a trial that has not been accessed for x days.

* Go to the Manage Keys tab&#x20;
* Click the "search" dropdown and select "Edit Searches"
* Add a new search as follows:
  * Name: Analytics.Idle
  * Favorite: \[ ] (Unchecked)
  * Table: Analytics Installs
  * SQL (replace ProductName and  ProductMajorVersion as needed): IdleDays > 5 and ProductName = 'Quick License Manager' and ProductMajorVersion='9' and LicenseModel='trial' and SubscriptionExpiryDate > \[today\_start]
  * Click Ok

&#x20;

**Create a Scheduled Task**

Next, we will create a scheduled task to email customers that have gone idle.

* Go to the Manage Keys tab&#x20;
* Click Scheduled Tasks
* Click Add and set the new schedule task as shown below
  * Name: Idle Trials
  * License Server: Your License Server
  * Search: Analytics.Idle (the search created above)
  * Run Every: 1 Days
  * \[x] Enable Email Notifications
  * \[x] Send to customer
  * Fill the remaining fields as you see fit
* Close the Scheduled Tasks Editor

Make sure the QLM System Tray is always running.&#x20;

For testing purposes, we recommend that you narrow down the "Analytics.Idle" search initially until you are sure everything is working as expected. For example, you could set the SQL to:

IdleDays > 5 and ProductName = 'Quick License Manager' and ProductMajorVersion='9' and LicenseModel='trial' _and Email='you@yourdomain.com'_
