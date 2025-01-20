# Product Properties

### Overview

Product Properties are custom properties associated with each product you define in QLM. You can define product properties from the QLM Management Console / Define Products tab. There's no theoretical limit to the number of properties that you can define.

Product Properties are similar to the features that you associate with your product but they are more powerful because they are not just on/off toggles. A product property can be of type string, int, or boolean. Additionally, with QLM Enterprise, you can associate an expiry date to each product property.

Once you define your own Product Properties, you can set these properties on any license key. Product Properties can be set during the Activation Key creation process or after creation.&#x20;

Product Properties can be set from the QLM Management console, from the QLM Portal, or via the QLM API.

In your application, you can query Product Properties via the QLM API.

### Defining Product Properties

To define Product Properties:

* Go to the Define Products tab in the QLM Management Console.
* Select a product.
* Go to the Product Properties tab.
* To add a property, click the + sign button on the right-hand side of the grid.

A Product Property has the following attributes:

* Category: a logical grouping that is used to display related properties together.
* Name: the name of the property.
* Type: the datatype of the property. Three data types are supported: int, bool, and string.
* Default Value: the default value that the property will have if not set.
* Help: a help message that is displayed in the QLM Management Console and the QLM Portal when a user sets the value of the property.
* ID: a unique ID for this property.
* PropValue: the actual value of the property.

Each property must have a unique category and name value, i.e. you cannot define two properties with the same category and name values.

To delete a property, click the X button on the right-hand side of the grid.

Once you have completed the definition of your products, click the Save button in the ribbon bar.

### Setting Product Properties during license key creation

To set product properties from the QLM Management Console:

* Go to the Manage Keys tab.
* Click Create Activation Key.
* Go to the Product Properties tab.
* Identify the property you want to set and click the Value field. The help text associated with the property is displayed in the Description section below.
* Modify the value as needed.
* For QLM Enterprise customers, optionally associate an Expiry Date to each property.
* Repeat the process for other properties.
* Click OK to create the Activation Key.

### Setting Product Properties after license key creation

To modify product properties from the QLM Management Console:

* Go to the Manage Keys tab.
* Locate an existing license key in the grid and select it.
* Click Edit in the Ribbon Bar.
* Go to the Product Properties tab.
* Identify the property you want to set and click the Value field. The help text associated with the property is displayed in the Description section below.
* Modify the value as needed.
* For QLM Enterprise customers, optionally associate an Expiry Date to each property.
* Repeat the process for other properties.
* Click OK to update the Activation Key.

### Managing Product Properties Programmatically

#### Using the QLM API to Get/Set Product Properties

You can query the product properties associated with a given Activation Key from within your application with the [QlmLicense.GetProductProperties](../api-reference/qlmlicense/application-methods/getproductproperties.md) function.

Setting product properties should not typically be done from within your application. It should be done from your server. To set product properties, use the [QlmLicense.SetProductProperties](../api-reference/qlmlicense/management-methods/setproductproperties.md) function.

Both API reference pages above include an example that shows how to use GetProductProperties and SetProductProperties.

#### Setting Product Properties from the GetActivationKey/GetActivationKeyWithExpiryDate/RenewSubscriptionHttp HTTP methods

When creating activation keys from an eCommerce provider using the [GetActivationKey](../api-reference/http-methods/getactivationkey.md)/[GetActivationKeyWithExpiryDate](../api-reference/http-methods/getactivationkeywithexpirydate.md) methods or when renewing a subscription using the [RenewSubscriptionHttp](../api-reference/http-methods/renewsubscriptionhttp.md) method, you can set product properties using the URL command-line argument.

The syntax for setting a product property is:

\&is\_pp=\<category>.\<name>::value::expiryDate||\<category>.\<name>::value::expiryDate||...

Example:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is_vendor=fastspring&is_productid=2&is_majorversion=1&is_minorversion=0&is_expduration=23&is_features=0:7&is_pp=
quality.module_qa::abc::2017-12-31||quality.module_control::true||quality.module_validation::76
```
{% endcode %}

The expiry date is optional and available for QLM Enterprise customers. The expected expiry date format is: "yyyy-MM-dd HH:mm:ss".

Additionally, to shorten the length of the command line argument, you can use a Custom Server property to define your command line arguments and then refer to the server property when invoking GetActivationKey/GetActivationKeyWithExpiryDate.

Example:

Define a Custom Server property as follows:

```
myprop=is_pp=
quality.module_qa::abc||quality.module_control::true||quality.module_validation::76
```

Then, invoke GetActivationKey/GetActivationKeyWithExpiryDate as follows:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is_vendor=fastspring&is_productid=2&is_majorversion=1&is_minorversion=0&is_expduration=23&is_features=0:7&is_args=myprop
```
{% endcode %}

### Generate a Product Properties File for Offline Activation

If the end-user is not connected to the internet, you will need to send the customer a Product Properties file that they would need to download to their system and store in a specified location.

* To generate the Product Properties file from the QLM Management Console:
  * Go to the Manage Keys tab
  * Locate the license that needs to be activated offline
  * Click Activate
  * Enter a Computer ID
  * Go to the Advanced tab
  * Check "Generate Product Properties file only"
  * Click the Browse button and select the location of the license file
  * Click Ok
  * A license file should be generated in the location selected above. Send this file to your customer and ask them to save it in the folder that your application expects.

![](https://support.soraco.co/hc/article_attachments/115016902426/mceclip1.png)

As of QLM v11.0.18147.1, your customer can also generate the Product Properties file or a complete license file (for cross-platform apps) from the QLM Offline Activation page:

* Direct your customer to the QLM Offline Activation Page (make sure the URL includes the \&is\_pp=1 or \&is\_file=1 argument). For help on setting up the QLM Offline Activation page, [click here](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-formerly-QlmAspLicenseSite-).
* For example, to generate a Product Properties file, the URL would look like: https://qlm3.net/qlmdemo/qlmcustomersite/qlmwebactivation.aspx?is\_pp=1
* To generate a license file for cross-platform apps, the URL would be: https://qlm3.net/qlmdemo/qlmcustomersite/qlmwebactivation.aspx?is\_file=1
* Enter the Activation Key
* Enter a Computer ID
* Click Activate
* A Product Properties file or a license file will be generated and downloaded to the end-user system. Ask the customer to save this file in the folder where your application expects it.

![](https://support.soraco.co/hc/article_attachments/115016901546/mceclip0.png)

&#x20;

Additionally, to operate in offline mode, you could store the Product Properties in a file on the customer's system and read them from the file when the user is offline by using the following APIs:\
\
[QlmLicense.ReadProductPropertiesFile](../api-reference/qlmlicense/client-side-methods/readproductpropertiesfile.md)\
[QlmLicense.WriteProductPropertiesFile](../api-reference/qlmlicense/application-methods/writeproductpropertiesfile.md)

### Generate a Product Properties File from the QLM Portal

To generate a Product Properties file from the QLM Portal:

* Locate and select the license key for which you would like to generate a Product Properties file
* Click Activate and enter a Computer ID
* Go to the Advanced tab
* Select "Download Product Properties File"
* Click Ok

The file QlmProductProperties.xml will be downloaded to your Downloads folder.

### Email Support

#### Attaching a Product Properties File to an email&#x20;

#### To include the Product Properties file as an attachment to an email sent from the QLM Management Console or the QLM Portal, simply enter the variable %Properties% anywhere in the email body.

#### Including product properties in the body of an email

As of QLM v11.1, you can also embed product properties in the body of an email the same way you embed QLM variables. The syntax for embedding product properties is:

%Properties.category.name%&#x20;

### Upgrading Product Properties

If you modify the definition of your product properties, existing licenses will automatically pick up the new product properties definition when they are re-activated.

You can also force a specific license to pick up the new product properties definition by editing the license and refreshing its Product Properties as shown below.

![mceclip0.png](https://support.soraco.co/hc/article_attachments/360073112072/mceclip0.png)

Additionally, you can perform a full scan of all licenses and upgrade all product properties of all licenses from Manage Keys / Sites / Advanced / Upgrade Product Properties.&#x20;

![mceclip1.png](https://support.soraco.co/hc/article_attachments/360073377271/mceclip1.png)

&#x20;
