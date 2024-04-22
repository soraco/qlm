# FastSpring - How to upgrade a license from FastSpring

If a customer purchased a specific version of your product or purchased specific features of your product and then decides to upgrade to a new version or to purchase additional features, you can configure FastSpring to upgrade the customer's license in QLM.

### Process Overview

#### Provide existing Activation Key

In order to perform an upgrade, the customer must provide his existing Activation Key during the ordering process. This is required so that the new order is associated to the existing license. You must therefore create an HTML page on your web site that prompts the user to enter his current Activation Key.

#### FastSpring Checkout&#x20;

Once the Activation Key is entered, we will use FastSpring's SBL functions to initiate the checkout process. We will use SBL to specify which new features should be added or which version should the customer be upgraded to.

#### FastSpring Fulfillment

Finally we will modify the FastSpring fulfillment action to parse the data specified in the SBL payload and invoke the QLM License Server as required.

&#x20;

### Implementation

#### Provide existing Activation Key

The attached HtmlCode.html file contains a sample html page that displays a text field (Activation Key), a checkbox (to purchase the yearly maintenance plan if you offer one) and a button to start the check out process. The button invokes a Javascript that initates the checkout process.

#### FastSpring Checkout&#x20;

For this process, you must first create a FastSpring Popup Storefront. You can find instructions on how to create a Popup Storefront in the FastSpring [help](https://docs.fastspring.com/video-tutorials/how-to-add-a-popup-storefront-to-your-website).

In order to use FastSpring's SBL, you must first initiate the SBL library. This is done by adding the FastSpring initialization code to the \<head> section of your HTML page. From your FastSpring Popup Storefront, click PLACE ON YOUR WEBSITE to get the required code snippet.

![](https://support.soraco.co/hc/article\_attachments/115018404106/mceclip0.png)

Then, you must create the CheckoutFastSpring function that is invoked when the user clicks the checkout button. A sample implementation is provided in the Checkout.jscript attachment. Insert this script in your HTML page.

#### FastSpring Fulfillment

Finally, create a new product in FastSpring,  for example, create the product "your-fastspring-upgrade-product-code".&#x20;

Add a fulfillment to your product as follows:

* Click Add Fulfillment
* Select (x) **Generate a License**
* Select **Script (PHP or Javascript)**
* Click Next
* Set Output Format to **Single License Only**
* Set  License Name to **Not Name Based**
* Set Script Type to **JavaScript**
* Click **Create**
* In the Script Source Code (JS) field, delete the existing code and replace it with the sample code included in the attachment "LicenseGeneratorFulfillment.jscript"
* Update the URL as well as the URL arguments as required. Make sure to add the is\_user and is\_pwd arguments as described [here](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider).

To add features to a license, add the is\_features argument with the required features.

To upgrade a license to the latest version, simply add the is\_majorversion and is\_minorversion arguments.

* [HtmlCode.html](https://support.soraco.co/hc/en-us/article\_attachments/115018403086)604 Bytes [Download](https://support.soraco.co/hc/en-us/article\_attachments/115018403086)
* [Checkout.jscript](https://support.soraco.co/hc/en-us/article\_attachments/115018404126)861 Bytes [Download](https://support.soraco.co/hc/en-us/article\_attachments/115018404126)
* [LicenseGeneratorFulfillment.jscript](https://support.soraco.co/hc/en-us/article\_attachments/115018569603)459 Bytes [Download](https://support.soraco.co/hc/en-us/article\_attachments/115018569603)
