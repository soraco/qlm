# How to update the CommunicationEncryptionKey and AdminEncryptionKey

The QLM API uses an encryption mechanism for communicating with the License Server to prevent unauthorized access to the License Server API.

This encryption mechanism relies on 2 encryption keys: the CommunicationEncryptionKey (CEK) and AdminEncryptionKey (AEK).

When you install the QLM License Server on your system, the CEK and AEK values are set to some default values. Before you go live, it is highly recommended that you change the default values to prevent unauthorized access to your License Server.

To change these values, follow the steps below.

**A. Generate new values for CEK and AEK**

* Go to Manage Keys / Sites and select your site
* Go to the Encryption Keys tab
* Click Unmask for both fields
* Click New for both fields to generate 2 new keys
* Click Ok

**B. Change the web.config files**

* On the server where you installed the QLM License Server
* Edit the web.config file of the QlmLicenseServer
* Replace all occurences of the communicationEncryptionKey and adminEncryptionKey with the values created above.
* Repeat the same steps for the web.config file of QlmCustomerSite and QlmPortal if needed.

**C. Update your protected application**

* In the Protect Your App wizard, step through the wizard again.
* On the "Customize the look and feel page", locate the QlmCommunicationEncryptionKey property and update it based on the new value.
* Complete the wizard to regenerate the files required by your application and update your app with the new files.
* Review your code and update any occurrence of QlmLicense.CommunicationEncryptionKey and QlmLicense.AdminEncryptionKey to match the new values.
