# Import your existing data into QLM

**Migrating your data to QLM**

If you are migrating your license management from an in-house licensing system or a competitor system to QLM, you can readily import your existing data into QLM's database.

The QlmImport tool is a standalone tool that can import a comma-separated list of customers and/or orders/license keys into QLM.&#x20;

The source code for the import tool is provided to allow you to customize it based on your specific needs.

To build the import tool, you need Visual Studio 2015+ (it might work with earlier versions).

Once you download the tool (attached to this article), we urge you to read the Readme.txt file included in the project. This file contains critical information to ensure a smooth import process.

If you improve this import tool by fixing bugs or adding features, we'd love to get your improvements so that we can share them with our users.

Email us your updates to: [support@soraco.co](mailto:support@soraco.co)

**Upgrading your customers to the new QLM Activation Key**

When you migrate your license data to QLM, a new Activation Key is created. The new Activation Key should now be used by your customers to activate the new version of your application.

To avoid having to contact each one of your customers and provide them with their new Activation Key, you can automate the process as follows:

* When you import your license data into QLM, store your current license key either in the LegacyKey (as of QLM 11.1.18306.1) or OrderID or the UserData QLM fields.
* In the new version of your application that uses QLM, when your application starts up, look up your old license key and call QlmLicense.GetActivationKeyFromLegacyKey (as of QLM 11.1.18306.1) or QlmLicense.GetActivationKeyFromOrderID or QlmLicense.GetActivationKeyFromUserData to retrieve the new QLM Activation Key
* Once you have retrieved the key, call QlmLicense.ActivateLicense to activate the license. If activation is successful, call QlmLicense.StoreKeys to store the new keys on the end user system.

{% file src="../.gitbook/assets/QlmImport.zip" %}
