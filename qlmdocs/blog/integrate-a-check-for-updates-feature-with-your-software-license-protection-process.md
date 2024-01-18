# Integrate a "Check for Updates" feature with your software license protection process

Customers are demanding. The ability for your software to automatically update itself when a new version is released is now a ubiquitous feature that is expected of professional software applications. Obviously, getting new versions of your application is tightly coupled with your software license model. Typically, not all users are allowed to upgrade for free!  Therefore, integration of a "check for updates" feature with your licensing software is a must.

A license management solution must provide answers to the following two questions:

1\. What is the latest version of the application?2. Is this customer allowed to upgrade to the latest version?

Once these questions answered, a license management solution must be able to download the new version, along with any release notes associated with the update.

Answering the first question is typically done by maintaining the latest version information on a server, in a database, a file, or within the licensing database as is the case with Quick License Manager. The application simply queries the server for that information and returns it to the application.

Answering the second question is a bit trickier since this data is per customer. Typically, customers who purchase a maintenance plan are entitled to free upgrades. For more information about implementing a maintenance plan in your software application, read about the [QLM Maintenance Plan ](https://support.soraco.co/hc/en-us/articles/203184080-QLM-Maintenance-Plan)feature. If you implement a maintenance plan as described in our previous blog, you simply query your licensing server by providing the user's license key and querying whether the user has a maintenance plan. If he/she does, you allow the user to upgrade to the latest version and automatically download the latest version from the server. If the user does not have a maintenance plan, you can then redirect them to your web site where you provide options for upgrades.

In conclusion, unless you provide your customers with free lifetime upgrades, a "Check for Updates" feature is only viable when integrated with your software license protection process. Although not a showstopper at the time of purchase, not implementing a "Check for Updates" feature will cause customer frustration in the long run, especially if you release updates on a regular basis.

For more details about Quick License Manager's, visit our [web site](https://soraco.co/quick-license-manager).
