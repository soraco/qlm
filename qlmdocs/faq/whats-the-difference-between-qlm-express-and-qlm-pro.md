# Differences between QLM Express and QLM Pro

One of the fundamental differences between QLM Express and QLM Pro is that Express does not work with a License Server. License Keys created in QLM Express are therefore not stored in a database nor tracked.

Whenever you create a key in QLM Express, you need to manage this key by storing it yourself in Excel, for example.

The workflow for QLM Express is the following:

* A customer purchases your product
* You ask the customer to send you their unique computer identifier (Computer Name, MAC address, etc.)
* You use the QLM Management Console to create a license key bound to the end user system (Computer Key). Keys are generated from the "Generate Keys" tab in QLM.
* You send your customer the Computer Key
* They launch your application and when prompted, they enter the Computer Key.

With QLM Pro, the process described above is fully automated and requires no manual procedure.

Since QLM Express does not work with a License Server, there are several limitations that you should be aware of. The following is a list of some of the features that are not available in QLM Express:

* You need to track your customers and License Keys in Excel (or a similar tool).
* You can only protect Windows desktop applications. You cannot protect Java, JavaScript, Mac OS/X, iOS, Android, or any other mobile device.
* When transferring a license to another computer, there's no way to determine if the user is no longer using your application on the original system.
* There is no way to revoke a license.
* Scheduled Tasks
* Email framework
* Webhooks
* Product Properties&#x20;
* Audit Trail&#x20;
* 3rd party integration  (such as e-commerce providers)



For a detailed side-by-side comparison, [click here](https://soraco.co/quick-license-manager/quick-license-manager-features/).

Here's a summary of the major differences between Express and Pro:

| **Feature**                 | **Express** | **Pro** | **Enterprise** |
| --------------------------- | ----------- | ------- | -------------- |
| License Server              |             | √       | √              |
| ECommerce Integration       |             | √       | √              |
| Online Activation           |             | √       | √              |
| Offline Activation          | √           | √       | √              |
| License Key Management      |             | √       | √              |
| Ability to revoke a license |             | √       | √              |
| Securely transfer licenses  |             | √       | √              |
| Protect Windows Apps        | √           | √       | √              |
| Protect Non-Windows Apps    |             |         | √              |
| Scheduled Tasks             |             | √       | √              |
| Email Framework             |             | √       | √              |
| Webhooks                    |             | √       | √              |
| Fraud Detection             |             | √       | √              |
| Audit Trail                 |             |         | √              |
