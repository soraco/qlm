# How to implement software subscription

You can use QLM Professional to implement a software subscription model.

When a customer purchases a subscription for your product, say for 1 year, you issue an activation key that has a 1-year expiry date.

When the customer activates the license, they will receive a computer bound key that has the same expiry date.

At the day of the expiry of the license, you can extend the license by another period in several ways:

1\. From the QLM Console / Manage Keys / Extend Expiry.

2\. From the QLM Portal

3\. From the API, by calling the RenewSubscription method.

4\. Through our [eCommerce integration.](https://support.soraco.co/hc/en-us/articles/360048854711-Integrated-eCommerce-Providers)

Once the QLM server has the new subscription expiry date, the customer must contact the server to activate this new expiry date. This can be done in several ways:

1\. By enabling [server-side validation](https://support.soraco.co/hc/en-us/articles/360025213372-When-does-a-QLM-protected-application-connect-to-the-License-Server-), your application connects to the server and reactivates the license automatically without any user input.&#x20;

2\. The customer simply re-activates his license using the same registration form that was used to activate the license the first time (this could be the QLM License Wizard, the QLM .NET controls or the license registration form that you created).
