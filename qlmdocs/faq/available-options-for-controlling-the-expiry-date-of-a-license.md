# Available options for controlling the expiry date of a license

**Applies to:**

QLM Pro and QLM Enterprise.

QLM: 8.0 or higher.

***

When specifying the expiry date criteria of a license, you can configure two settings:

* Expires \<x> days after install&#x20;
* Expires on \<date>

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4402233002132/mceclip0.png)

&#x20;

If you configure both settings, the license will expire when either setting's criterion is met.

If you configure a duration based expiry and select to expire the license x days after install, the actual expiry date is controlled by two [server properties](../qlm-license-server/server-properties.md):&#x20;

&#x20;

<table data-header-hidden><thead><tr><th width="382"></th><th></th></tr></thead><tbody><tr><td>useDurationToSetExpiryDate</td><td>When creating an Activation Key with an expiry duration, the QLM License Server converts the specified duration to a specific expiry date based on the current date. The SubscriptionExpiryDate field will be set to this expiry date.<br><br></td></tr><tr><td>useDurationToSetExpiryDateWhenActivating</td><td>When activating a duration based license, the QLM License Server can convert the specified duration to a specific expiry date based on the time of activation. The SubscriptionExpiryDate field will be set to this expiry date.</td></tr></tbody></table>

&#x20;

If both server properties are unchecked, no specific expiry date will be set. The license expiry date will be based on the first time a license is validated on a user's machine. **This setting is not recommended as it is less secure.**

Examples:

| **Expiry Criteria** | **Creation Date** | **Activation Date** | **useDurationToSetExpiryDate** | <p><strong>useDurationToSet</strong></p><p><strong>ExpiryDateWhenActivating</strong></p> | **Actual Expiry Date**        |
| ------------------- | ----------------- | ------------------- | ------------------------------ | ---------------------------------------------------------------------------------------- | ----------------------------- |
| 30 days             | 2021-01-01        | 2021-01-15          | True                           | True                                                                                     | 2021-01-31                    |
| 30 days             | 2021-01-01        | 2021-01-15          | True                           | False                                                                                    | 2021-01-31                    |
| 30 days             | 2021-01-01        | 2021-01-15          | False                          | True                                                                                     | 2021-02-15                    |
| 30 days             | 2021-01-01        | 2021-01-15          | False                          | False                                                                                    | Not Set - **Not recommended** |
