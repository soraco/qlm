# How to receive an email report of failed trial requests using Scheduled Tasks

Edition: Enterprise

Version : 16.0.22281.2

***

You can use QLM's scheduled tasks and email integration to automatically email yourself a report of all failed customer trial requests. Failed trial requests are attempts to register for a trial using the QLM Self Help Trial Registration form or API.

To do so, follow the steps below.

#### Create the search

* Go to the Manage Keys tab
* Click on the Search drop-down and select Edit Searches
* Click on Add to add a new search
* Set the Name to "RefusedTrialRequests" (or any name you wish)
* Set the Table to "Audit Trail"
* Set the SQL field to: EventDate > \[today\_start-1] And EventCategory='CustomerSite.TrialRequest.Refused'
* Click OK

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360091836311/mceclip0.png)

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/9759047366548/mceclip0.png)

#### Create the scheduled task

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: RefusedTrialRequests
* Select your License Server
* In the Search drop-down, select the Search created earlier: RefusedTrialRequests
* Set the Schedule Run every to: 1 Day
* Set "Starting on" and "Starting at" fields as needed
* In the Email tab, set at least the following fields:
  * Send Mail To: \<None>
  * Set the CC field to your email address
  * Subject: \<enter a subject for the email>
  * Email Profile: \<select an email profile>
  * Email Account: \<select an email account>
  * Email Template: Vendor.RefustedTrialRequests
  * Aggregate Emails: Do Not Aggregate

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/9759037234196/mceclip1.png)
