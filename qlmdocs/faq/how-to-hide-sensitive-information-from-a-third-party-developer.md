# How to hide sensitive information from a third-party developer

### Overview

If you hire a third-party developer to implement the licensing component of your software, you may want to hide sensitive information from the developer to prevent the developer from potentially accessing your License Server and generating license keys without your consent.

Note that as per [EULA, ](http://soraco.co/products/qlm/QlmLicense.pdf) a developer requires a QLM license to work on the integration of QLM with your product. The third party can either purchase their own QLM license or you could purchase a yearly/monthly subscription for your developer.

### Sensitive Information

The important information that needs to be protected is License Server information and Product Information.

#### License Server

In addition to SSL encryption, QLM uses a proprietary encryption mechanism to encrypt data over the wire when communicating with the License Server. The encryption keys used by this mechanism must not be divulged to your developer. These encryptions are the CommunicationEncryptionKey and the AdminEncryptionKey.&#x20;

![](https://support.soraco.co/hc/article\_attachments/16549847969556)

#### Products

Each product has a set of encryption keys that are used to encode and encrypt information in the process of creating the license key and generating digitally signed license files. These encryption keys are found in the Encryption Keys tab when defining your product.

These encryption keys should never be divulged to the third-party developer.

![](https://support.soraco.co/hc/article\_attachments/16549897632148)

### License Server Protection

We recommend that you never give your third-party developer access to your live License Server. Your developer should install a local QLM License Server that will be used for development purposes. The procedure to install a local QLM License Server can be found [here](../qlm-license-server/how-to-install-the-qlm-license-server.md).&#x20;

By installing a local QLM License Server, your developer will not require knowledge of your live server's CommunicationEncryptionKey and AdminEncryptionKey.

### Product Protection

To properly integrate QLM with your application, your developer needs to create a product that mimics the characteristics of your product but with a different set of encryption keys.

Using the QLM Management Console installed on the developer's computer, he/she would therefore need to create a product that has the following identical attributes to your real product:

* Product Name
* Major version
* Minor Version
* Release Date
* Features
* Product Properties

Once the product is defined on the developer's system, the developer then generates the product's XML settings file and the _LicenseValidator_ class from the QLM Management Console / Protect Your Application tab.

At the application level, the developer must initialize the _LicenseValidator_ class using the XML Settings file. For example, when using C# as a programming language, you should not use the default _LicenseValidator_ constructor but instead use the constructor that takes the XML Settings file as input.

// Do not use this constructor

QLM.LicenseValidator lv = new QLM.LicenseValidator();

// Use this constructor

QLM.LicenseValidator lv = new QLM.LicenseValidator(xmlSettingsFile);

**Important:** You should instruct your developer to not make any changes to the generated _LicenseValidator_ class. If changes are required, the developer should subclass the _LicenseValidator_ class and implement the required changes in the subclass.

### Required changes after code delivery from the developer

Once the developer completes the integration work, the developer will deliver two files related to licensing: (a) the XML Settings file and (b) the LicenseValidator class.

The following important attributes in the XML Settings file will need to be updated:

* EQlmCommunicationEncryptionKey (encrypted)
* EQlmFloatingDbPassword (encrypted)
* EQlmProductID (encrypted)
* EQlmGUID (encrypted)
* QlmPublicKey
* QlmRSAPublicKey

To update the XML Settings file, you must open the file in a text editor and update the settings above.

For encrypted settings, you remove the E prefix from the attribute and write the non-encrypted value to the XML file. For example, to update EQlmCommunicationEncryptionKey , you would rename EQlmCommunicationEncryptionKey  to QlmCommunicationEncryptionKey and set the non-encrypted value.

Finally, to deploy the file to your environment so that you can edit the settings in the QLM Management Console / Protect Your Application wizard, you must copy the file to the following location:

%appdata%\Soraco\Quick License Manager\LicenseWizard\\\<GUID>

You must then rename the file as follows: Product\_\<PID>\_\<MAJOR>.\<MINOR>.lw.xml

where:

\<PID> = Product ID

\<MAJOR> = Product Major Version

\<MINOR> = Product Minor Version

**Hint**: You can find the location of this file from the Protect Your Application wizard, on the 2nd page of the wizard.

Once the file is placed in the correct location, you must regenerate the file and the LicenseValidator class using the Protect Your Application Wizard:

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* Click Next
* Select the required product
* Click Next until you get to the last page and click Save

If you need assistance with this process, our support team would be happy to help.
