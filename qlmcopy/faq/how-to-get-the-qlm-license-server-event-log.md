# How to get the QLM License Server Event Log

When errors occur in the QLM License Server, QLM logs errors messages to the QLM database. These error messages can be viewed from the QLM Management Console on the Manage Keys tab, License Server / Event Log. QLM has several levels of logging. QLM can log errors, warnings and information. You can control the logging level from the QLM Management Console. The possible values for the logging level are:

* Error=1
* Warning=2
* Informational=4
* Verbose=8

&#x20;To change the logging level:

* Go to the Manage Keys tab
* Click Sites
* Select your site
* Go to the Advanced tab
* Set the Logging Level to the desired value
* Click Ok

To diagnose a problem, we may request that you send us the QLM Event Log. To do so:

* Go to the Manage Keys tab
* Click Sites and select your site
* Click the Advanced tab
* Set the Logging Level to Verbose and click Appy then OK
* Reproduce the issue
* From the Manage Keys tab, click "Event Log"
* Click Save to save the Event Log to a local file on your system
* Email us or attached the log file to the ticket

Remember to set the logging level back to Warning after the problem is diagnosed to avoid bloating of the QLM database with potentially millions of records.
