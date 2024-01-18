# How to embed a number in the license key

If your application needs to enforce a limit of some sort such as number of records that a user can create or the number of accounts they can create to login to your application, you can use the QLM Floating Seats feature to embed this number in the license key. The approach suggested below will only work if you are not using floating seats for their original purpose which is to support concurrent licensing (with QLM Enterprise).

To embed a number in the license key:

* Create a new license key from Manage Keys / Create
* On the create dialog, set "Floating seats" to the required number.&#x20;
* Set all other fields as needed and click OK
* An activation key will be created

Once activated, the number of floating seats will be embedded in the Computer Key.

At runtime, you can determine the number of floating seats as follows:

* Call **DefineProduct**
* Call **ValidateLicenseEx** (computerKey, computerID)
* Call **NumberOfLicenses** to get the number of floating seats
