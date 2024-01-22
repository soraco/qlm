# Server Event Log

When errors occur in the QLM License Server, QLM logs error messages to the QLM database. These error messages can be viewed from the QLM Console by clicking on Manage Keys / Tools / View Server Event Log. QLM has several levels of logging. QLM can log errors, warnings, and information. You can control the logging level by editing the loggingLevel setting in web.config file of the QLM License Server. The possible values for the logging level are:

* Error=1&#x20;
* Warning=2&#x20;
* Information=4&#x20;
* Verbose=8&#x20;

These settings can be combined as follows:

* To log errors and warnings, set the value to: 3&#x20;
* To log errors, warnings and information, set the value to: 7&#x20;
* To log errors, warnings, information and verbose messages, set the value to: 15
