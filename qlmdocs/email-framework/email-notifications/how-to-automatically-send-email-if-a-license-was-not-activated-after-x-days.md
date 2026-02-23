# How to automatically send email if a license was not activated after x days

You can use QLM's scheduled tasks and email integration to automatically send an email notification if a customer does not activate their license key after x days.

To do so:

* Click on the Manage Keys tab
* Click on the Search drop down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Not Activated(or any name you wish)
* Set the SQL field to: ComputerID is null And OrderDate >= DATEADD(DAY, -5, GETDATE())
* Click OK (in the SQL above, we find records that have not been activated 5 days after being created)

Then, in the ribbon bar, click on the Tools / Scheduled Tasks

* Click on Add to add a new task
* Set the Name to: Not Activated (or any name you wish)
* Select your License Server
* In the Search drop down, select the Search we created earlier: Not Activated
* Set the Schedule Run every to: 1 Day starting at the desired time (do not run this more than once er day)
* In the Email tab, select who you would like to send the notification to. While testing the notification, we recommend that you do not check anything.
* Set the CC field to your email address
* Enter a Subject for the email
* Select the Profile and the Email account to use
* Select Email template (you can create an email template from the ribbon bar Mail / Templates).
