# WooCommerce - Sell an upgrade of a product

### Overview

This article describes how to configure and sell an upgrade of your product using WooCommerce.

Some typical use cases for selling an upgrade are:

* If you use features in your product and you would like to allow customers to add features to their existing license,
* If a customer purchase a specific version of your product and you would like to sell them an upgrade to the latest version.

QLM supports upgrades via a 3rd party plugin called  "[WooCommerce Custom Product Addons](https://acowebs.com/woo-custom-product-addons/)_"_ that you will need to install.

In order to support upgrading a license, the end user must enter their Activation Key during the upgrade process. The QLM WooCommerce Plugin will then upgrade the features of this Activation Key following a successful WooCommerce transaction.

Note that the upgrade process will replace the customer's existing Activation Key with a new Activation Key.

### Capturing the Activation Key

To capture the customer's Activation Key during the ordering process, install a 3rd party plugin called  "[WooCommerce Custom Product Addons](https://acowebs.com/woo-custom-product-addons/)_"._

Once the plugin is installed, follow the steps below:

* In WordPress, go to Products / Custom Product Addons
* Click Add New Form
* Create a form with single Text Field to capture the Activation Key
* Set the Name of the text field to: qlm\_activation\_key

&#x20;

<figure><img src="https://support.soraco.co/hc/article_attachments/4402442335764/mceclip0.png" alt=""><figcaption></figcaption></figure>

<figure><img src="https://support.soraco.co/hc/article_attachments/4402520195348/mceclip0.png" alt=""><figcaption></figcaption></figure>

### Creating an Upgrade Product

Now you must create a new WordPress product for the upgrade process. For example, create a product called "Upgrade from Pro to Enterprise". Configure the product pricing and other standard options as required.

In the Product Data panel, select "Custom Product Options" and select the Form created in the previous step.

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/4402442344084/mceclip1.png)

### Configuring the Custom Fields

In the Custom Fields section of your product definition in WordPress, configure at a minimum the following fields:

* is\_productid
* is\_majorversion
* is\_minorversion
* is\_features

You may also want to optionally configure these fields:

* is\_licensemodel
