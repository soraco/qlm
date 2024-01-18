# How to clear license keys from an end user system

If your customer needs to transfer a license from one computer to another, there are several possible ways of performing the transfer.&#x20;

There are two steps required to deactivate a license:

1\. Release/Deactivate the key from the server \
2\. Delete the key from the local system

**1. Release a Key from the Server**

There are several ways you can release a key from the server.

**a. From the QLM Management Console**

To clear the key using the QLM Management Console, go to the "Manage Keys" tab, locate the key and click the "Deactivate" button.

**b. From the QlmLicense.ReleaseLicense API.**&#x20;

To clear the key using the API, make sure that before calling the ReleaseLicense API, you set the QlmLicense.CommunicationEncryptionKey property.

**c. From the QlmCustomerSite deactivation web page.**

The QlmCustomerSite is a web site that contains a collection of useful web pages that you can expose to your customers. The QlmReleaseLicense.aspx web page is a self-serve page that allows your customers to deactivate their license.

**d. From the QLM License Wizard deactivate button.**

If you are using the QLM License Wizard, the Deactivate button connects to the License Server and deactivates the license.

&#x20;

For more details, refer to this [article](https://support.soraco.co/hc/en-us/articles/202932304).

d**. From the QLM License Wizard**

If you are using the QLM License Wizard, you can enable the QlmShowDeactivationProperty to allow users to deactivate a license from within the QLM License Wizard.

**2. Delete the keys from the local system**

There are several ways to delete a key from the local system.

**a. From the QLM License Wizard deactivate button.**

If you are using the QLM License Wizard, the Deactivate button deletes the license keys stored on the end-user system.

**b. From the QlmLicense.DeleteKeysEx API.**&#x20;

To delete keys from the local system, you can call the [QlmLicense.DeleteKeys](https://support.soraco.co/hc/en-us/articles/207296906-QlmLicense-DeleteKeys) or [QlmLicense.DeleteKeysEx](https://support.soraco.co/hc/en-us/articles/213569423-QlmLicense-DeleteKeysEx) API. Make sure you call DefineProduct before calling DeleteKeys. It is recommended that the application calling DeleteKeys runs with elevated privileges.

Even if you do not explicitly call DeleteKeys, when you enable the ValidateOnServer property, DeleteKeys will be automatically triggered if the call to ValidateLicenseOnServer detects that the license was revoked on the server or that the license is not registered on the server. Note that these operations require an internet connection to communicate with the QLM License Server.

**3. Delete the keys from your test system**

If you are trying to delete license keys from a test system, you could use the following tool: [Tool to delete registered license keys on a system](https://support.soraco.co/hc/en-us/articles/203691130)
