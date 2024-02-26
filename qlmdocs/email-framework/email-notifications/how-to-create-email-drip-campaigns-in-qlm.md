# How to create email drip campaigns in QLM

### Overview

QLM can enable email drip campaigns using the Custom Searches and Scheduled Tasks features. Drip campaigns help boost prospect engagement for new trials and facilitate customer onboarding for new subscriptions. You can set up emails to be sent based on a schedule or user actions.

### Create email templates

Create email templates for all the emails you would like to send in the drip campaign.

* Under Manage Keys, click Templates
* Click New or Duplicate to create or duplicate a template
* Add or edit the email content and click Save
* Add additional email templates for each email in the drip campaign

### Create custom searches

Create custom searches that define the criteria on which you would like to schedule the emails. For example, if you would like to send your prospects an email message every day during the first week of the trial, you would configure 7 custom searches. To configure a custom search:

* Under Manage Keys, click the arrow next to the search button, and click Edit Searches
* Add a new search
* Specify the name of the search
* Enter the SQL statement that matches the criteria you would like to use for sending an email
* Add additional custom searches to match the criteria for each email you would like to send

Examples:

* SQL clause to find all trials that were issued today:

OrderDate >= \[today\_start] and OrderDate <= \[today\_end] and LicenseModel=’trial’ and (IncludeInMailList <> 0) and (Disabled=0)

* SQL clause to find all trials that were issued yesterday:

OrderDate >= \[today\_start-1] and OrderDate <= \[today\_end-1] and LicenseModel=’trial’ and (IncludeInMailList <> 0) and (Disabled=0)

* SQL clause to find all trials that were issued before yesterday:

OrderDate >= \[today\_start-2] and OrderDate <= \[today\_end-2] and LicenseModel=’trial’ and (IncludeInMailList <> 0) and (Disabled=0)

### Create scheduled tasks

Finally, you need to create scheduled tasks to schedule the emails to be sent out based on the criteria you defined.

* Under Manage Keys, click Scheduled Tasks
* Add a new scheduled task and fill in the fields:
  * Name: enter a name for the task
  * License Server: select the license server
  * Search: Select a custom search you created in the previous step
  * Run every: select 1 Day, as you would typically want to run this task once a day to send the campaign emails to all the customers who match the criteria
  * Starting on: select the date when you want to start running the campaign
  * Starting at: enter the time you would like to run the task and send the emails.
    * For example, if you want the emails to be sent at 8 am each day, enter 08:00 am.
    * Click the checkbox next to the time to force the scheduled task to run at that specific time.
    * Note that if you are running a scheduled task with a custom search that returns today's trials or today’s orders, you will want to run it at the end of the day to ensure that you are capturing most of the customers who signed up that day (e.g. 11:55 pm). However, normally, your first email on the first day of the trial would be configured to be sent automatically at trial registration through server properties (under Manage Keys, Sites).
  * On the email tab, select Enable Email Notifications and fill in the fields
    * Send Mail To: Customer
    * Enter any email you want in the Cc or Bcc if needed
    * Subject: enter the subject of the email
    * Email Profile: select the email profile
    * Email account: select the email account the email will be sent from
    * Email Template: select the email template you created in the first step. This template will be sent based on the criteria defined in the custom search you selected for the scheduled task.

&#x20;

Custom Search Examples:

Trial Day 1:

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/8951767916692/mceclip0.png)

Trial Day 2:

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/8951820381076/mceclip1.png)

Trial Day 3:

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/8951822387988/mceclip2.png)

Scheduled Task:

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/8951824625812/mceclip3.png)
