# Product Features

Product Features are on/off toggles that can be embedded in a license key. Features are ideal for add-on modules that your customers may optionally purchase.

To define features, click on Define Products, select a product, and add your features.

You can embed up to 32 features in a license key. Features are divided into 4 sets with 8 features per set.&#x20;

A feature is uniquely identified by its Feature Set and Feature ID. Each feature that you create is assigned a unique combination of feature set/feature ID.

Feature Sets can have the following values: 0, 1,2, 3

Feature IDs are designed to be bitwise-friendly. The possible values of a Feature ID are: 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128

You can generate license keys with embedded features in several ways:

* In the QLM Management Console, when creating an Activation Key
* Using the QLM API [CreateActivationKeyEx](../api-reference/qlmlicense/management-methods/createactivationkeyex.md) (or one of its variants)
* From the QLM Portal

To verify if a feature is enabled in your code, use the [IsFeatureEnabledEx](../api-reference/qlmlicense/client-side-methods/isfeatureenabledex.md) API. The sample located in %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmWizardExeSample demonstrates how to verify if a feature is enabled in your code.

For more advanced capabilities, you may want to check out QLM's [Product Properties](product-properties.md).&#x20;
