# How to send email notifications when an illegal computer is detected

When an illegal computer is detected, QLM creates a record of that detection in the system. You can read more about illegal computers [here](../../how-to/fraud-detection-illegal-computers-and-activation-attempts.md).

This article describes 2 approaches to deal with illegal computers:&#x20;

* Send yourself (the vendor) an email notification when an illegal computer is detected
* Send the customer a notification when an illegal computer is detected.

### How to send yourself an email report of illegal computers

**Create a search**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click the Search drop down and select Edit searches
* Create a new search as follows (the search should already exist):
  * Name: Alert Illegal Computer
  * Table: Illegal Computers
  * SQL: LastAccessedDate > \[date] and LastAccessedDate > '2024-04-29 4:00 PM' (the hard coded date here is required to avoid sending an email to all customers already in the Illegal Computers table - change to hard coded date to today's date)

**Create a Scheduled Task**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click Scheduled Tasks
* Create a new scheduled task as follows:
  * Name: Illegal Computer Report
  * License Server: \<your license server>
  * Search: Illegal Computers
  * Run Every: 1 Day
  * Send Mail To: \<nothing selected>
  * CC: \<your email address>
  * Subject: Illegal Computers Report
  * Emai Template: Vendor.IllegalComputersReport

With the setup above, you will receive a daily report of all detected illegal computers.

### How to send your customer a notification when an illegal computer is detected

**Create a search**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click the Search drop down and select Edit searches
* Create a new search as follows (the search should already exist):
  * Name: Alert Illegal Computer
  * Table: Illegal Computers
  * SQL LastAccessedDate > \[date] and LastAccessedDate > '2024-04-29 4:00 PM' (the hard code date here is required to avoid sending an email to all customers already in the Illegal Computers table - change to hard coded date to today's date)

**Create a Scheduled Task**

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click Scheduled Tasks
* Create a new scheduled task as follows:
  * Name: Illegal Computer Per Customer
  * License Server: \<your license server>
  * Search: Illegal Computers
  * Run Every: 1 Day
  * Send Mail To: Customer (for testing purposes, you may want to set this after your tests are completed)
  * CC: \<your email address>
  * Subject: Illegal Computer
  * Emai Template: Customer.IllegalComputer

With the setup above, your customer will receive a daily notification of all detected illegal computers.
