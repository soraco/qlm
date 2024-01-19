# ILicenseInfo

ILicenseInfo is an interface used to present results returned from the server in a structured format. When a QLM API that communicates with the License Server is called, the response is typically an XML fragment. This XML fragment is parsed and the result is loaded in an ILicenseInfo interface.

The members listed below will be populated based on the XML fragment returned by the server. Depending on the QLM API that is invoked, members of ILicenseInfo might therefore not be set if they are not present in the XML fragment returned by the server.

***

## Edition

* QLM Pro
* QLM Enterprise

***

## Version

* 10+

***
