# The number of allowed activation keys per client has now been exceeded

The server property **numberOfTrialLicensesAllowedPerClient** limits the number of trial licenses that can be activated by a client. A client is uniquely identified by a ComputerID and a ComputerName. A value of -1 means there is no limit.

The **enforceMaxTrialsWhenActivating** controls whether QLM limits the number of trial keys per system.&#x20;

Once the number of trials per client has been reached, you have 2 options to allow a specific client to activate:

1. Increase the value of **numberOfTrialLicensesAllowedPerClient**&#x20;
2. Deactivate some of the activated licenses
