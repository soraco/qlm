# Paypal - How to collect Paypal related event logs

QLM collect event logs related to paypal transactions. These logs are useful in diagnosing Paypal issues.

To collect detailed logs about a Paypal transaction:

* Go to Manage Keys / Sites
* Go to the Server Properties tab
* In the paypal category, set the paypalLoggingLevel to 15
* Click Ok
* Process a paypal sales transaction
* Go to Manage Keys
* Click Event Log and review the log for issues

To email our support team the logs:

* In the Event Log Viewer above, click Save to save the event log to a file
* Email us the file.
