# How to automatically send an email when a new license is created

You can use QLM's scheduled tasks to automatically email yourself and/or your customer when a new license is created:

**A. Configure a search**

* Click on the Manage Keys tab
* Click on the Search drop down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: new license
* Set the SQL field to: OrderDate > \[date]
* Click OK

**B. Configure a Scheduled Task**

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: New License
* Select your License Server
* In the Search drop down, select the Search we created earlier: new license
* Set the Schedule Run every to: 15 minutes
* In the Email tab, check Enable Email Notifications
* Check "Send to customer" if you would like to send the email to the customer
* If you want to send yourself the email, add your email in the Cc field
* Enter a Subject for the email
* Select the Outlook Profile and the Email account to use
* Select Email template (you can create an email template from the ribbon bar Mail / Templates). For example, select "1. New Order".
* If you would also like to get a popup alert for new licenses, click on the Alert tab, enable it and enter text for the Alert.
