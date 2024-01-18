# Subscription workflow when integrated with an eCommerce Provider

With QLM's ecommerce provider integration, you can fully automate the renewal of a subscription. The workflow for the whole process from the time of purchase until the renewal goes as follows:

* Customer purchases your product through a supported eCommerce Provider
* During the ordering process, the eCommerce Provider communicates with the QLM License Server and sends QLM full contact information as well as details about the order such as the product, version and number of licenses purchased.
* The QLM License Server generates the required Activation Keys and sends them back to the eCommerce Provider.
* The eCommerce Provider then includes the license keys with the Order Confirmation email that is sent to the customer.
* Once the customer receives the email and the Activation Key, they launch your application and are prompted to enter their Activation Key.
* They enter the Activation Key and activate their license.
* When the subscription period is due for renewal, the eCommerce Provider automatically notifies the customer that renewal is required. Some eCommerce Providers provide the option to automatically renew if the credit card information on file is still valid.
* When the user renews the subscription via the eCommerce Provider, the eCommerce Provider sends a notification to the QLM License Server notifying it of the new expiry date. The QLM License Server updates the Subscription Expiry Date on the server.
* On the application side, when the application is launched, if the license has expired, a connection to the License Server is automatically initiated to check if the subscription was renewed. If the subscription was renewed on the server, the new expiry date is pulled from the server and applied to the client. No new activation key is required, simply reactivation of the same license. Reactivation can also be manual.

![](https://support.soraco.co/hc/en-us/article\_attachments/205891203/QLMWorkflow01-e1452021625221.png)
