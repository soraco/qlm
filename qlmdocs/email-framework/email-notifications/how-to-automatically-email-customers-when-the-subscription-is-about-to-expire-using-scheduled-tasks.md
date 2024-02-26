# How to automatically email customers when the subscription is about to expire using Scheduled Tasks

You can use QLM's scheduled tasks to automatically email customers before their subscription expires. To send daily emails to customers whose subscription expires in the next 30 days, follow the steps below.

Note that the same steps can be used to email customers whose maintenance plan expires in 30 days. To do so, replace the field SubscriptionExpiryDate with MaintenanceRenewalDate in the steps below.

**A. Configure a search**

* Click on the Manage Keys tab
* Click on the Search drop-down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Expiring Subscriptions (or any name you wish)
* Set the SQL field to: SubscriptionExpiryDate > \[today\_start] And SubscriptionExpiryDate < \[today\_start+30]
* Since a subscription can be associated with multiple license keys, to ensure that a customer receives a single email for a given subscription, go to the Advanced tab and set the following fields:
  * Distinct Field: **ReceiptID** (this is the internal name of the SubscriptionID)
  * Unique ID Field: **LicenseID**&#x20;
* Click OK

**B. Configure a Scheduled Task**

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: Expiring Subscription (or any name you wish)
* Select your License Server
* In the Search drop-down, select the Search we created earlier: Expiring Subscriptions
* Set the Schedule Run every to: 1 Day&#x20;
* In the Email tab, check Enable Email Notifications
* Check "Send to customer"
* If you would like to send your self the email, enter your email in the Cc field.
* Enter a Subject for the email
* select the Outlook Profile and the Email account to use
* Select an Email template (you can create an email template from the ribbon bar Mail / Templates). For example, select "2. Subscription Expiry"
* If you would also like to get a popup alert for new orders, click on the Alert tab, enable it and enter text for the Alert.
