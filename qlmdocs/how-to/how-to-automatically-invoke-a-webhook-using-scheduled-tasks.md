# How to automatically invoke a webhook using Scheduled Tasks

Requirements: QLM Enterprise v15+

***

You can use QLM's scheduled tasks to automatically invoke external webhooks when certain criteria are met. To do so, you must first create a search to define the criteria that trigger the webhook invocation. Once the search is created, you create a scheduled task and assign the search to the scheduled task.

#### Configure a search

This example will configure a search that will retrieve all license keys that expire in the next 30 days.

* Click on the Manage Keys tab
* Click on the Search drop-down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Upcoming Renewals (or any name you wish)
* Set the SQL field to: SubscriptionExpiryDate > \[today\_start] And SubscriptionExpiryDate < \[today\_start+30]
* Click OK

#### Configure a Scheduled Task

* On the ribbon bar, click on the Tools / Scheduled Tasks.
* Click on Add to add a new task.
* Set the Name to: Upcoming Renewals (or any name you wish).
* Select your License Server.
* In the Search drop-down, select the Search we created earlier: Expiring Subscriptions.
* Set the Schedule Run every to: 1 Day.
* In the Webhooks tab, check Enable Webhook.
* Enter the URL of the webhook.
* Enter a secret key of your choice.
* Enter any custom data that you would like to send to the webhook.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360094084452/mceclip0.png)

#### Webhook Payload

When the webhook is invoked, a JSON payload is sent as a POST to the specified URL. The payload includes the following information:

* Name of the scheduled task.
* Your User Data.
* A LicenseInfo object that contains information about the license that triggered the request.

Additionally, when invoking the webhook, the request's header includes a custom entry called X-QLM-Signature. This signature allows you to authenticate the sender of the request.

To verify the authenticity of the request, you must:

* Compute the SHA256 hash of the JSON payload + secretKey.
* Retrieve the X-QLM-Signature value from the header.
* Compare these 2 values and ensure that they are identical.

#### Payload Example

**Header**

```json
{
"content-length": "886",
"content-type": "application/json",
"x-qlm-signature": "9bef52ead927a132f96e15e4ef15cb2b20b8cca8eeb61779f015bad6adeb1c6b"
}
```

**Content**

```json
{
"Name": "stWebHook",
"WebHookUserData": "my user data",
"LicenseInfo": {
"LicenseUpdatedOnServer": false,
"ActivationKey": "BNQ50D0500G3HJKM8P91111KIYQJIVSIQ6E9EAB",
"FullName": "John Smith",
"Country": "US",
"AffiliateID": "None",
"Email": "john@soraco.co",
"Duration": 30,
"ExpiryDate": "2021-05-29T23:59:59",
"UsesAdminEncryption": false,
"MaintenanceRenewalDate": "2022-04-29T23:59:59",
"Features": "STD,PRO,",
"OrderID": "SO-0009812",
"ReceiptID": "SO-0009813",
"SubscriptionID": "SO-0009813",
"LicenseModel": 2,
"ProductID": 1,
"MajorVersion": 1,
"MinorVersion": 0,
"NumLicenses": 1,
"FloatingSeats": 0,
"UserData": "My User Data",
"NewFeatures": "",
"NewFloatingSeats": -1,
"ComputerID": "",
"ComputerName": "",
"Comment": "My Comments",
"LegacyKey": "",
"AvailableLicenses": 1,
"OrderDate": "2021-04-29T16:39:49",
"ProductProperties": "",
"BundleID": "",
"ProductName": "Demo",
"MaxReleaseCount": -2,
"MaxReleasePeriodInDays": -2,
"OrganizationID": 6
}
```

For testing purposes, you can configure the webhook to connect to [https://beeceptor.com/](https://beeceptor.com/)
