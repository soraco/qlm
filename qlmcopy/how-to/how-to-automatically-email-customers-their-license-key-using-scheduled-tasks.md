# How to automatically email customers their license key using Scheduled Tasks

You can use QLM's scheduled tasks and email integration to automatically email customers their license key once it is created in QLM.

To do so, follow the steps below.

#### Create the search

* Go to the Manage Keys tab
* Click on the Search drop-down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Current Orders (or any name you wish)
* Set the SQL field to: OrderDate > \[date]
* Click OK

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360091836311/mceclip0.png)

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360091836411/mceclip1.png)

&#x20;

#### Create the scheduled task

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: Current Order Notification (or any name you wish)
* Select your License Server
* In the Search drop-down, select the Search created earlier: Current Orders
* Set the Schedule Run every to: 5 Minutes
* Set "Starting on" and "Starting at" fields as needed
* In the Email tab, set at least the following fields:
  * Send Mail To: Customer
  * Subject: \<enter a subject for the email>
  * Email Profile: \<select an email profile>
  * Email Account: \<select an email account>
  * Email Template: \<select an email template>
  * Aggregate Emails: Do Not Aggregate
* If you would also like to get a popup alert for new orders, click on the Alert tab, enable it and enter text for the Alert.           &#x20;

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/360091843952/mceclip2.png)
