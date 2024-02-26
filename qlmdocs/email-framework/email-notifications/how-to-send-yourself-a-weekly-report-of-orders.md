# How to send yourself a weekly report of orders

You can use QLM's scheduled tasks to automatically email yourself all recent orders. This functionality is available as of QLM v7.2.15018.4.

To do so:

&#x20;**A. Create a search**

* Click on the Manage Keys tab
* Click on the Search drop down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Recent Orders
* Set the SQL field to:OrderDate > \[today\_start-7] and OrderDate < \[today\_end]
* The search above will return orders placed in the last 7 days. IChange 7 to any value of your choice.
* Click OK

**B. Create a scheduled task**

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: Recent Orders Report
* Select your web service profile
* In the Search drop down, select the Search we created earlier: Recent Orders
* Set the Schedule Run every to: 7 Day starting at xx:yy. Note that this value should match the value you specified in the Search above.
* In the Email tab, select the Outlook Profile and the Email account to use
* Select Email template: "Daily Activity Report". Note that the format of this report contains the special tag \*\*\*qlm\_table\*\*\* which enables this feature. If the fields in the Daily Activity Report do not meet your needs, you can customize this report as needed, as long as you do not remove the special tag.
* Enter a Subject for the email
* Close the editor
