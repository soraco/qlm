# License Model

The License Model property allows you to categorize licenses as permanent, trial or subscription.

A permanent license is a license that has no expiry criteria. You would select this option if a customer purchased your product and is entitled to use the purchased version of your product forever.

A trial license is a license that has expiry criteria and is a trial of your product.

A subscription license is a license that has expiry criteria and is a purchased subscription of your product.

The License Model is mainly used as a logical categorization of licenses.&#x20;

Since the License Model property was added in QLM v9, any license created prior to the introduction of this property will have its value set to NULL or None.

When creating a license, it is recommended that you set the License Model to permanent, trial or subscription. In the QLM Management Console, you can configure the default values of the Create Activation Key dialog by clicking Save Defaults once the dialog is opened.

If you have created a trial license key with expiry criteria, this trial license key cannot be converted into a permanent key simply by changing the License Model. QLM does not support converting a trial or subscription license to a permanent license.

Settings the License Model may have an impact on the behavior of the system specifically in the context of the following [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties):

* enforceMaxTrialsWhenActivating
* numberOfTrialLicensesAllowedPerClient
