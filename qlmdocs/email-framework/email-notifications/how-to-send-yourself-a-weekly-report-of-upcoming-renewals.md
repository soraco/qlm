# How to send yourself a weekly report of upcoming renewals

You can use QLM's scheduled tasks to automatically email yourself all upcoming renewals. To do so:

&#x20;**A. Create a search**

* Click on the Manage Keys tab.
* Click on the Search drop down and select Edit Searches.
* Click on Add to add a new search.
* Set the Name to: Upcoming Renewals.
* Set the SQL field to: SubscriptionExpiryDate > \[today\_start] and SubscriptionExpiryDate < \[today\_start + 7]
* The search above will return all licenses that are due for renewal in the next 7 days.
* Click OK

If you want to get a report of upcoming maintenance plans, change the SubscriptionExpiryDate field above with the MaintenanceRenewalDate field.

**B. Create a scheduled task**

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: Upcoming Renewals
* Select your License Server
* In the Search drop down, select the Search we created earlier: Upcoming Renewals
* Set the Schedule Run every to: 1 Day starting at xx:yy. Note that this value should match the value you specified in the Search above.
* In the Email tab, select the Outlook Profile and the Email account to use
* Select Email template: "Daily Activity Report". Note that the format of this report contains the special tag \*\*\*qlm\_table\*\*\* which enables this feature. If the fields in the Daily Activity Report do not meet your needs, you can customize this report as needed, as long as you do not remove the special tag.
* Enter a Subject for the email
* Close the editor
