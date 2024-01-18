# How to use Fiddler to diagnose connectivity issues with the QLM License Server

If your customer is not able to connect to the QLM License Server and you have exhausted all the typical reasons for connectivity issues, we recommend using a tool called Fiddler to diagnose the connectivity issue.

* Download Fiddler from [Telerik's](https://www.telerik.com/) web site.
* Install Fiddler
* In Fiddler, click File and make sure that "Capture Traffic" is selected
* Perform the operation that is failing to connect to the License Server in your application
* In Fiddler's upper panel, select the entry that references the URL of your QLM License Server
* In Fiddler's lower panel, click Inspectors then click the XML Raw tab
* Check for any error that might indicate the source of the issue

If you cannot diagnose the issue, click File / Save All Sessions and send us the Session Archive file (.saz).
