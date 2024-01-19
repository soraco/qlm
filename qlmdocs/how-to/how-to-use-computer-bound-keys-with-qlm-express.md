# How to use computer bound keys with QLM Express

Unlike QLM Pro, QLM Express does not support online activation. The online activation process enables the creation of computer-bound license keys by automatically sending a computer identifier to the QLM License Server which generates a license key bound to this computer identifier.&#x20;

Since QLM Express does not include a License Server, online activation is not possible. However, you can create Computer Bound license keys from the QLM Management Console. To do so:

* Request from your customer the unique computer identifier that you want to use to bind license keys to a system.
* From the QLM Management Console, go to the Generate Keys tab. If you do not see the Generate Keys tab, you can enable this tab as described in this [article](../faq/how-to-show-the-generate-keys-tab.md).
* In the "License Type" section, set the dropdown to "User Defined"
* In the text area next to License Type, enter the customer's computer identifier.
* Set any other setting on that page as per your requirements
* Click "Generate Keys" on the ribbon
* The "Generated Keys" text area displays the new Computer Key
* Send this key to your customer and have them use this key to register your application&#x20;

### How to register your application

#### Register your application using the QLM License Wizard

If you want to use the QLM License Wizard to validate license keys, you must send the customer an Activation Key as well:

* From the QLM Management Console, go to the Generate Keys tab.
* In the "License Type" section, set the dropdown to "Activation Key"
* Set any other setting on that page as per your requirements
* Click "Generate Keys" on the ribbon
* The "Generated Keys" text area displays the new Activation Key
* Send this key to your customer and have them use this key in the Activation Key field of the License Wizard.

For more details about configuring the QLM License Wizard with QLM Express, read this [article](../faq/how-to-use-the-qlm-license-wizard-with-qlm-express.md).

#### Register your application using the QLM API

To register your application using the QLM API, you must call the following APIs:

* [ValidateLicenseEx](../api-reference/qlmlicense/client-side-methods/validatelicenseex.md)&#x20;
* [StoreKeys](../api-reference/qlmlicense/client-side-methods/storekeys.md)

Example:

{% code overflow="wrap" %}
```csharp
LicenseValidator lv = new LicenseValidator (settingsXmlFile);
// activationKey can be empty
// computerKey is the computerKey that you generated for the customer based on the ComputerID
// computerID is the unique computer identifier
// licenseBinding - If set to UserDefined, the computerID argument is used. 
                    If set to any other value, the computerID is calculated and 
                    returned as a reference
// needsActivation can be ignored
// returnMsg is an error message if the license validation fails

if (lv.ValidateLicense (activationKey, computerKey, ref computerID, licenseBinding, ref needsActivation, ref returnMsg) == true)
{
   lv.QlmLicenseObject.StoreKeys (activationKey, computerKey);
}
```
{% endcode %}
