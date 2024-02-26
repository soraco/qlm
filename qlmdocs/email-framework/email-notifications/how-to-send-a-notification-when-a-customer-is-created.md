# How to send a notification when a customer is created

**Applies to**: QLM v16

**Edition**: Pro or Enterprise

***

To send a notification when a new customer is created, follow the steps below:

### Create a search

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the "Search" dropdown and select "Edit Searches"
* Create a new search as follows:
  * Name: New Customer
  * Table: Customers
  * SQL: CreationDate > \[date]
  * Click OK

### Create a Scheduled Task

* Click "Scheduled Tasks" on the ribbon bar
* Click Add and set the following:
  * Name: New Customer
  * License Server: \<your server>
  * Search: New Customer (the search created in the previous step)
  * Run Every: 1 hour (do not set a high frequency as this will add unnecessary load on the server)
  * Configure the other options as needed.

Scheduled tasks are processed by the QLM Agent. Make sure that the [QLM Agent Service](../../how-to/qlm-agent-service.md) is properly configured and running.
