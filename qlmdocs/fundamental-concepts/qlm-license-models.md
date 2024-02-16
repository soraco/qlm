# License Model v17+

Applies to: QLM Pro, Enterprise

Version: 17+

***

### Overview

QLM v17 introduces new license models that can be used to easily identify the type of license based on the prefix of the license key.

In previous versions of QLM, the license model was strictly used for categorization purposes and the information about the license model was not embedded in the license key.

QLM now supports 9 different license models:

| **License Model**      | **Description**                              | **Activation Key Prefix** | **Computer Key Prefix** |
| ---------------------- | -------------------------------------------- | ------------------------- | ----------------------- |
| trial                  | A node locked trial license.                 | B                         | V                       |
| trial\_cloud           | A cloud-based floating trial license.        | S                         | X                       |
| trial\_floating        | An on-premise floating trial license.        | L                         | P                       |
| subscription           | A node locked subscription license.          | F                         | J                       |
| subscription\_cloud    | A cloud-based floating subscription license. | T                         | Y                       |
| subscription\_floating | An on-premise floating subscription license. | M                         | Q                       |
| permanent              | A node locked permanent license.             | A                         | U                       |
| permanent\_cloud       | A cloud-based permanent trial license.       | R                         | W                       |
| permanent\_floating    | An on-premise floating permanent license.    | K                         | N                       |

&#x20;

### QLM Engine Version

To configure QLM to generate license keys with the new prefixes, you must set the QLM Engine to version 6.0.00 (EV6). Note that the QLM Engine Version is sometimes abbreviated as QLM Version in various settings in the QLM Management Console or the QLM Portal.

For new customers, i.e. customers who did not issue license keys prior to QLM v17, EV6 should already be the default. The default engine version is configurable at two levels:

* In the QLM Management Console / Options
* In the QLM Management / Sites / Server Properties

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/13471009368852)

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/13471054448660)

&#x20;

**For existing customers**, i.e. customers who have already created license keys using QLM Engine version 5.0.00 (EV5) and provided license keys to their customers, please exercise extreme caution when upgrading to EV6. You should leave the default Engine Version set to 5.0.00 and update the next version of your application to use EV6, at the application level.

We advise that you perform adequate regression testing when enabling this feature.

When creating a license key, you can enforce the Engine Version from the QLM Management console, the QLM Portal or through the API.

Note that the QLM v17 libraries can properly validate license keys created with EV5 and EV6. This means that if your customer is using license keys issued with EV5, you can safely upgrade them to a newer version of your application that uses EV6.

&#x20;

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/13471410015124)

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/13471512845204)

![mceclip5.png](https://support.soraco.co/hc/article\_attachments/13472017558676)

&#x20;

### Application Configuration

To configure your application to use EV6, you must set the QlmLicense.Version property to 6.0.00 when invoking any QLM API that requires this argument.

Additionally, you must set the QlmVersion property in the Protect Your Application wizard as shown below then regenerate the XML Settings file and the LicenseValidator class.

We recommend that you set the QlmVersion to 6.0.00 for new versions of your application that you deploy with the QLM v17 binaries.

**Important:** When programmatically creating a QlmLicense object, the QLM Engine Version is now set to 6.0.00 by default. To force the QLM Engine Version to 5.0.00, you must explicitly set the QlmLicense.Version property to 5.0.00. This is required before calling any QLM API that creates license keys or modifies license keys such as subscription renewals, license upgrades, license updates and license activation. If you are using the LicenseValidator class, you can either regenerate the LicenseValidator class or simply set the QlmLicense.Version property in the LicenseValidator constructor.

&#x20;

![mceclip7.png](https://support.soraco.co/hc/article\_attachments/13474243565716)

### E-Commerce Configuration

#### WooCommerce

* Go to the QLM Plugin / Settings
* Set the Engine Version to: 6.0.00

![](https://support.soraco.co/hc/article\_attachments/13922181243028)

You can also set the engine version at the product level by creating a custom field called is\_qlmversion and setting its value to 6.0.00.

![](https://support.soraco.co/hc/article\_attachments/13922128594708)

#### All other e-commerce providers

Add the following argument to the QLM URL: \&is\_qlmversion=6.0.00
