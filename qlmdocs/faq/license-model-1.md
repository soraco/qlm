# License Model

The QLM License Model field allows you to distinguish between 3 license models:

* Trial: set this license model for trial versions of your application. A trial license is expected to expire after a given duration or on a specific date.&#x20;
* Subscription: set this license model for a purchased subscription of your application. A subscription license is expected to expire after a given duration or on a specific date.&#x20;
* Permanent: set this license model for a purchased version of your application. A permanent (or perpetual) license is expected never to expire.

When creating a license, it is recommended that you set the License Model to permanent, trial or subscription. In the QLM Management Console, you can configure the default values of the Create Activation Key window by clicking Save Defaults once the window is opened.

If you create a trial/subscription license key with expiry criteria, this license key cannot be converted into a permanent key simply by changing the License Model. QLM does not support converting a trial or subscription license to a permanent license. This is because expiry information is embedded in the license key.

The License Model is typically used for logically grouping licenses. It is also used in the context of the following [Server Properties](../qlm-license-server/server-properties.md):

* enforceMaxTrialsWhenActivating
* numberOfTrialLicensesAllowedPerClient

Additional articles:

* [How to limit the number of trial license keys a customer can use](../how-to/how-to-limit-the-number-of-trial-license-keys-a-customer-can-use.md)
* [How to follow up on idle trials with QLM Enterprise](../how-to/how-to-follow-up-on-idle-trials-with-qlm-enterprise.md)
