# How to send email notifications when an activation attempt is detected

When an activation attempt is detected, QLM creates a record of that detection in the system. You can read more about activation attempts [here](fraud-detection-illegal-computers-and-activation-attempts.md).

This article describes 2 approaches to dealing with activation attempts:&#x20;

* Send yourself (the vendor) an email notification when an activation attempt is detected
* Send the customer a notification when an activation attempt is detected.

### How to send yourself an email report of activation attempts

**Create a search**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click the Search drop-down and select Edit searches
* Create a new search as follows (the search should already exist):
  * Name: Alert Activation Attempt
  * Table: Activation Attempts
  * SQL: ActivationDate > \[date] and ActivationDate > '2020-04-29 12:00 PM'(the hard code date here is required to avoid sending an email to all customers already in the Activation Attempts table - change to hard coded date to today's date)

**Create a Scheduled Task**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click Scheduled Tasks
* Create a new scheduled task as follows:
  * Name: Activation Attempts Report
  * License Server: \<your license server>
  * Search: Alert Activation Attempt
  * Run Every: 1 Day
  * Send Mail To: \<nothing selected>
  * CC: \<your email address>
  * Subject: Activation Attempts Report
  * Email Template: Vendor.ActivationAttemptsReport

With the setup above, you will receive a daily report of all detected activation attempts.

### How to send your customer a notification when an activation attempt is detected

**Create a search**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click the Search drop-down and select Edit searches
* Create a new search as follows (the search should already exist)
  * Name: Alert Activation Attempt
  * Table: Activation Attempts
  * SQL: ActivationDate > \[date] and ActivationDate > '2020-04-29 12:00 PM'(the hard code date here is required to avoid sending an email to all customers already in the Activation Attempts table - change to hard coded date to today's date)

**Create a Scheduled Task**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click Scheduled Tasks
* Create a new scheduled task as follows:
  * Name: Activation Attempt Per Customer
  * License Server: \<your license server>
  * Search: Alert Activation Attempt
  * Run Every: 1 Day
  * Send Mail To: Customer (for testing purposes, you may want to set this after your tests are completed)
  * CC: \<your email address>
  * Subject: Activation Attempt
  * Email Template: Customer.ActivationAttempt

With the setup above, your customer will receive a daily report notification of activation attempts.
