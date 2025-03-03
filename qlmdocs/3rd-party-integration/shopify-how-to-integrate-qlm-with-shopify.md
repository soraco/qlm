# Shopify - How to integrate QLM with Shopify

### Overview

If you are using Shopify as an eCommerce provider, QLM integrates seamlessly with Shopify's ordering system. Note that the QLM integration with Shopify does not support subscription-based products.&#x20;

### Webhook Notification

In order to notify QLM that a Shopify order was processed, you must configure a Shopify webhook to contact the QLM License Server as described below:

* Login to your Shopify account
* Click on the Settings icon in the left-hand panel
* Click Notifications
* Locate the Webhooks panel and click "Create webhook"
* In the Event drop-down, select "Order payment"
* In the Format drop-down, select XML
* In the URL field, enter the URL to your QLM License Server and append the following to the URL: /QlmWebHookHandler?is\_vendor=shopify\&is\_user=\<user>\&is\_pwd=\<pwd>

where:

\<user>: As defined in the QLM Management Console / Manage Keys / 3rd Party Extensions

\<pwd>: As defined in the QLM Management Console / Manage Keys / 3rd Party Extensions

Example: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=shopify\&is\_user=tim\&is\_pwd=timpassword&#x20;

* Click "Save webhook"

### Mapping Shopify products to QLM Products

In order to create license keys for each item in the order, a mapping between the Shopify products and the QLM products is required. There are two possible approaches for mapping products: (a) by using the Shopify SKU field or (b) by using QLM's custom server properties.

#### Mapping using the Shopify SKU field

* Create a new product or select an existing product
* In the SKU field, enter the following (replace the values as required):

\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_features=0:3\&is\_emailtemplate=Ecommerce.New Order\&is\_licensemodel=permanent

where

* is\_productid = your product id as defined in QLM
* is\_majorversion = your product's major version as defined in QLM
* is\_minorversion = your product's minor version as defined in QLM
* is\_qlmversion = 5.0.00
* is\_features = semi-comma-separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled, and in feature set 1, feature 1 is enabled.
* is\_user = As defined in Manage Keys / 3rd Party Extensions
* is\_pwd = As defined in Manage Keys / 3rd Party Extensions
* is\_emailtemplate = email template to use when sending the email to the user. Email templates can be created from the QLM Management Console / Manage Keys / Email Templates
* is\_licensemodel = permanent | trial | subscription&#x20;

#### Mapping using QLM's Custom Server Properties

To map your Shopify product to a QLM product, you must identify your Shopify Product ID and then create a QLM Custom Server Property. This feature is available as of QLM 16.1.22347.3.

#### Identify your Shopify Product ID

* Login to your Shopify account
* Go to the Product section
* Select one of your products
* In the browser's address bar, the last component of the URL is your Product ID
* Note your Product ID as you will use it in the next step

![mceclip0.png](https://support.soraco.co/hc/article_attachments/13577379874196)

#### &#x20;

#### Create a QLM Server Property

Next, you will create a QLM Custom Server property that maps your Shopify product to a QLM product.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: shopify\_\<Shopify Product ID>. For example, if your Shopify Product ID is 8019770900775, set the name to: shopify\_8019770900775
* Set the value of the property to (modify the values to correspond to your own product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_productname=MyProduct\&is\_emailtemplate=1. New Order\&is\_licensemodel=permanent
* For more information about the supported arguments, refer to this[ article](https://support.soraco.co/hc/en-us/articles/207606653-GetActivationKeyWithExpiryDate).
* Click Ok

![mceclip1.png](https://support.soraco.co/hc/article_attachments/13577404839828)

### Placing a test order

With the steps above completed, [place a test order](https://help.shopify.com/en/manual/checkout-settings/test-orders). When the order is placed, the following will occur:

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated with the user.
* An email will be sent to the user with the order information and activation keys

&#x20;In order for QLM License Server to send emails, you need to configure your SMTP server. Detailed instructions can be found in this [article](https://support.soraco.co/hc/en-us/articles/207894796-How-to-configure-QLM-to-send-mail-using-SMTP), in the section **Configure the QLM License Server to send emails using SMTP.**

&#x20;

#### Using Custom Server Property as an SKU

The approach described earlier in this article relies on setting the QLM parameters in the SKU field. Shopify supports a limited number of characters in the SKU field so if the parameters exceed that limit, some will get truncated by Shopify. To address this Shopify limitation, you can define the QLM parameters as a custom Server Property and set the Shopify SKU to the name of the QLM custom Server Property.&#x20;

To create a custom Server Property:

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear at the bottom of the grid.
* In the Name column, enter: ITEM1
* In the Value column, enter (replace the values to match your product): _\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=permanent\&is\_productname=Demo\&is\_emailtemplate=Paypal.NewOrder_
* Click OK to close the Site Editor&#x20;

Now in Shopify, set the SKU to ITEM1.

Note that this feature is available as of QLM 10.1.17344.2.

### Mapping the Shopify product to a QLM Product

To map your Shopify product to a QLM product, you must identify your Shopify Product ID and then create a QLM Server Property.

#### &#x20;

#### Identify your Shopify Product ID

* Login to your Shopify account
* Go to the Product section
* Select one of your products
* In the browser's address bar, the last component of the URL is your Product ID
* Note your Product ID as you will use it in the next step

![mceclip2.png](https://support.soraco.co/hc/article_attachments/13577432781588)

#### &#x20;

#### Create a QLM Server Property

Next, you will create a QLM Server property that maps your Shopify product to a QLM product.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: shopify\_\<Shopify Product ID>. For example, if your Shopify Product ID is 8019770900775, set the name to: shopify\_8019770900775
* Set the value of the property to (modify the values to correspond to your own product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_productname=MyProduct\&is\_emailtemplate=1. New Order\&is\_licensemodel=permanent
* For more information about the supported arguments, refer to this[ article](https://support.soraco.co/hc/en-us/articles/207606653-GetActivationKeyWithExpiryDate).
* Click Ok

![mceclip3.png](https://support.soraco.co/hc/article_attachments/13577441413396)

&#x20;

#### Mapping Shopify Options to QLM Features

If your product includes options that customers can optionally purchase, you can follow a similar approach to map your Shopify options to QLM features by creating a server property for each Shopify variant. The first step in this process is to identify your Shopify variant ID.

&#x20;

**Identify your Shopify Variant ID**

* Login to your Shopify account
* Go to the Product section
* Select one of your products
* In the Variants section, click Edit for the first variant
* In the browser's address bar, the last component of the URL is your VariantID
* Note your Variant ID as you will use it in the next step

![mceclip4.png](https://support.soraco.co/hc/article_attachments/13577435166612)

&#x20;

![mceclip5.png](https://support.soraco.co/hc/article_attachments/13577435894676)

&#x20;

**Create a QLM Server Property**

Next, you will create a QLM Server property that maps your Shopify variant to QLM features.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: shopify\_variant\_\<Shopify Variant ID>. For example, if your Shopify Variant ID is 44110709883175, set the name to: shopify\_variant\_44110709883175
* Set the value of the property to the QLM features that are associated with this variant product. For example: \&is\_features=0:1;
* For more information about the syntax of the features argument, refer to this[ article](https://support.soraco.co/hc/en-us/articles/204160380-What-is-the-syntax-of-is-features).
* Click Ok

![mceclip6.png](https://support.soraco.co/hc/article_attachments/13577443667476)

&#x20;

#### Shopify Webhook Authentication

QLM can authenticate an incoming request from Shopify using Shopify's webhook authentication mechanism. To enable this verification, you must configure QLM with the Shopify Shared Key.

To locate the Shopify Shared Key:

* Login to your Shopify Account
* Go to Settings / Notifications
* Locate the Webhooks section
* The Shared Key is displayed as shown in the screenshot below
* Next, launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd party extensions and select Shopify
* Set the Shared Key to the value above
* Click OK

![mceclip7.png](https://support.soraco.co/hc/article_attachments/13577437378452)

![mceclip8.png](https://support.soraco.co/hc/article_attachments/13577445177492)
