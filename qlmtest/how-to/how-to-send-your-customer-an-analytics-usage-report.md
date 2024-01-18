# How to send your customer an Analytics Usage Report

With QLM Enterprise Analytics feature, you couId you provide your customer a usage report per computer. The steps below describe how to configure QLM to send a scheduled Analytics Usage report to a specific customer.

### Create a custom search

The first step is to create a search that returns Analytics data for a given customer. You will need to create a separate search for each customer that you would like to send reports to.

* Go to the Manage Keys tab&#x20;
* Click the "search" dropdown and select "Edit Searches"
* Add a new search as follows:
  * Name: Analytics.UsageReport.CustomerX
  * Favorite: \[ ] (Unchecked)
  * Table: Analytics Installs
  * SQL (update the query as per your requirements): ProductName = 'Your Product'  and ProductMajorVersion=1 and LicenseModel='permanent' and Email like '%yourcustomer.com'

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360042093851/mceclip1.png)

### Customize the Email Template

* Go to the Manage Keys tab&#x20;
* Click Templates in the Email section
* Select the Analytics Report template
* Customize the template as needed

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/360042093992/mceclip3.png)

### Create a Scheduled Task

Next, we will create a scheduled task to email the analytics report. Note that when using a report style email template, you must hard code the recipient of the email in the Cc field. You cannot configure the scheduled task to send the email to the customer by automatically determining the custome'rs email. We cannot determine the customer's email since the data set returned by the server for the selected search may contain multiple email addresses.

* Go to the Manage Keys tab&#x20;
* Click Scheduled Tasks
* Click Add and set the new schedule task as shown below
  * Name: Analytics Usage Report - Customer X
  * License Server: Your License Server
  * Search: Analytics.UsageReport.CustomerX (the search created above)
  * Run Every: 1 Days
  * \[x] Enable Email Notifications
  * **Send Mail To: \<DO NOT SET THIS VALUE>**
  * **Cc: Set the recipient of the report to the email of CustomerX**
  * Fill the remaining fields as you see fit
* Close the Scheduled Tasks Editor

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/360042093871/mceclip2.png)

Make sure the QLM Agent (icon in the Windows system tray) is running.&#x20;

For testing purposes, we recommend that you configure the scheduled task to initially send you (the vendor), rather than the customer, the analytics report.
