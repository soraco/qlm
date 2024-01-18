# Distinguish between a trial and a subscription

### QLM v17+

QLM v17 introduces new license models that can be used to easily identify the type of license based on the prefix of the license key.

For more details, check this [article](https://support.soraco.co/hc/en-us/articles/13463481983380-QLM-License-Models).

### QLM v9 to v16

A QLM License Key that has an expiry date could be a trial key or a subscription key. At the license key level, there is no distinction between trial and subscription. Both have an expiry date or an expiry duration.&#x20;

At the API level, the enum values ELicenseType.Evaluation and  ELicenseStatus.EKeyDemo could mean trial or subscription.

There are a couple ways to distinguish a trial key from a subscription key.

**License Model Method**

As of QLM Pro 9, a new property can be associated to a license called LicenseModel. LicenseModel can be set to one of these values: trial | subscription | permanent

When you create the license key, you set the LicenseModel property. This can be done from the QLM Management console, from an API call or from an http method.

When a license is activated via an API call (ActivateLicense), the returned xml fragment contains the license model property. After calling [ParseResults ](https://support.soraco.co/hc/en-us/articles/207611673-QlmLicense-ParseResults)on the xml fragment, you can access the license model via the ILicenseInfo.LicenseModel property.

This approach works with QLM Pro and Enterprise.

You can also retrieve the LicenseModel by invoking the GetLicenseInfo method as shown below:

```
// Assuming lv is an instance of the LicenseValidator class
string dataSet = string.Empty;
string response = string.Empty;
QlmLicenseLib.ILicenseInfo licenseInfo = lv.QlmLicenseObject.GetLicenseInfo(string.Empty, 
                                                  lv.ActivationKey, false, 
                                                  out dataSet, out response);
if (licenseInfo != null)
{
    ELicenseModel licenseModel = licenseInfo.LicenseModel;
    Console.WriteLine(licenseModel.ToString());
}
```

**Feature Method**

Another approach consists of creating a feature for your product called TRIAL (on the Define Product page, select your product and create a new feature called TRIAL).

When you create a license key, enable or disable the TRIAL feature as required.

After you validate a license key, call the [IsFeatureEnabledEx ](https://support.soraco.co/hc/en-us/articles/207611713-QlmLicense-IsFeatureEnabledEx)API to determine if the key is a trial.&#x20;

This approach works with QLM Express, Pro and Enterprise.
