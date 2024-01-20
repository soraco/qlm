# How to create a product with STD and PRO editions as features

Most products nowadays come in different editions with different pricing such as Standard, Professional and Enterprise.

When you define such as product in QLM, you can define a single product with different features as follows:

* Go to the Define Products tab
* Click Add to add a new product and enter your product name, version, etc.
* In the Feature section:
  * Click Add (on the right-hand side) to add a new feature
  * Set: Feature Set: 0
  * Set: Feature Name: STD
  * Click Add again
  * Set: Feature Set: 0
  * Set: Feature Name: PRO
  * Click Add again
  * Set: Feature Set: 0
  * Set: Feature Name: ENT
* Click Save to save your product

Note that you can associate up to 32 features to a given product. The 32 features are broken down into 4 feature sets, with each feature set having 8 features. In the example above, we created 3 features in feature set 0.

Now that you created your features, you can issue license keys that enable these features as follows:

* Go to the Manage Keys tab
* Click Create Activation Key
* Select your product
* In the Features section, check the features that you would like to enable in this license.
* Click Ok
* The generated license key now contains information about the selected features.

In your application, you can verify if a feature is enabled and turn on or off the selected features as needed.

To determine if a feature is enabled, you need to:

* Call DefineProduct to define your product (this is typically done by the generated LicenseValidator class)
* Call ValidateLicense to ensure your license is valid (this is typically done by calling LicenseValidator.ValidateLicenseAtStartup).
* Call [IsFeatureEnableEx](../api-reference/qlmlicense/client-side-methods/isfeatureenabledex.md) to determine if the feature is enabled.

Note that features can also be enabled when generating a license key from your ecommerce provider as described [here](what-is-the-syntax-of-is\_features.md).
