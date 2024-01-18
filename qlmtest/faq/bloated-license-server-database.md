# Bloated License Server Database

The most common reason for a bloated DB is the **QLM Event Log**.

The QLM License Server logs events that occur on the server. By default, it logs warnings and errors. If you have changed the default settings to log information or verbose messages, your DB will grow very quickly.

The fastest way to clear the event log is to run the following SQL commands on the server:

```
-- To get the count
SELECT COUNT(*) from EventLog

-- To clear the event log table
Truncate Table EventLog
```

To configure the License Server to log errors and warnings only:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites
* Go to the Advanced tab
* Set the Logging Level dropdown to **Warning**
* Click Apply
* Click OK
