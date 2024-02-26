# How to automatically send the vendor an email when a customer activates a license

You can use QLM's scheduled tasks and email integration to automatically email yourself (the vendor) when a customer activates their license key.

To do so:

* Click on the Manage Keys tab
* Click on the Search drop down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Recently Activated (or any name you wish)
* Set the SQL field to: ActivationDate > \[date]
* Click OK.

Then, in the ribbon bar, click on the Tools / Scheduled Tasks

* Click on Add to add a new task
* Set the Name to: Recently Activaated (or any name you wish)
* Select your License Server
* In the Search drop down, select the Search we created earlier: Recently Activated
* Set the Schedule Run every to: 5 Minutes starting at the desired time
* In the Email tab:
  * Uncheck Send to customer&#x20;
  * Uncheck Send to User Group Owner
  * Set the CC field to your email address
  * Enter a Subject for the email&#x20;
  * Select the Outlook Profile and the Email account to use
  * Select Email template (you can create an email template from the ribbon bar Mail / Templates).
