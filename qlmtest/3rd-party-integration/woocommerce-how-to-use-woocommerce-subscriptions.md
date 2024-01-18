# WooCommerce - How to use WooCommerce Subscriptions

QLM can be used in conjunction with WooCommerce Subscriptions via the QLM WooCommerce plugin.

When users sign up for a subscription, they are issued an Activation Key that expires when the subscription expires. Upon renewal of the subscription, the QLM WooCommerce plugin automatically extends the Activation Key expiry date by an additional period.

To set up a subscription-based product, follow the steps below:

* Install [WooCommerce Subscriptions](https://www.woothemes.com/products/woocommerce-subscriptions/). Note that this plugin is not free.
* In the WooCommerce Subscription settings, go to the Checkout tab
* In the Payment Gateways section, enable Paypal (this article assumes you will be using Paypal to process payments)
* Click the Paypal link and configure the following fields:
  * Set the Paypal Email field to the same email account as your business PayPal account
  * Check the Paypal Sandbox field (during the testing phase)
  * Fill in the 3 fields under API credentials. API credentials are available from your Paypal account under Profile / My Selling Tools / API Access / Update / View API Signature. If you cannot find your API credentials, follow the instructions in this [article ](https://developer.paypal.com/webapps/developer/docs/classic/api/apiCredentials/#creating-classic-api-credentials)to request them.
  * You can also find detailed instructions on this topic [here](https://docs.woothemes.com/document/subscriptions/store-manager-guide/#section-4).
* Click Save changes
* Next, you need to configure IPN in PayPal. To do so:
  * Log in to your PayPal account (login to the sandbox during the testing phase)
  * Go to Profile / My Selling Tools / Instant Payment Notifications and click Update
  * Enter the following URL: http://yourdomain.com/?wc-api=WC\_Gateway\_Paypal
  * Click Save

&#x20;Next, we will create a subscription-based product.

* Click Products / Add Product
* Enter a product name
* Set Product Data to: Simple Subscription
* Important: Do **NOT** check the **Downloadable** checkbox
* Set the Subscription Price as needed. Example: 15 per month for all time

Next, we will add some custom fields. If you do not see the "Custom Fields" section, click the "Screen Options" drop-down on the top right-hand side of the Product page and make sure the "Custom Fields" checkbox is selected. If you do not see a "Custom Fields" checkbox, make sure "Virtual" is not checked.

In the **Add New Custom Field** section:

* Set the Product ID
  * Click **Enter new**
  * In the Name field, enter: is\_productid
  * In the Value field, enter the ID of your product as defined in the QLM Management Console / Define Products tab.
  * Click **Add Custom Field**
* Set the Major Version
  * Click **Enter new**
  * In the Name field, enter: is\_majorversion
  * In the Value field, enter the Major Version of your product as defined in the QLM Management Console / Define Products tab.
  * Click **Add Custom Field**
* Set the Minor Version
  * Click **Enter new**
  * In the Name field, enter: is\_minorversion
  * In the Value field, enter the Minor Version of your product as define in the QLM Management Console / Define Products tab.
  * Click **Add Custom Field**
* Set the License Model
  * Click **Enter new**
  * In the Name field, enter: is\_licensemodel
  * In the Value field, enter one of the following: permanent | permanent\_cloud | permanent\_floating | trial | trial\_cloud | trial\_floating | subscription | subscription\_cloud | subscription\_floating
  * Click **Add Custom Field**
* Optional - Set the Features
  * Click **Enter new**
  * In the Name field, enter: is\_features
  * In the Value field, enter the features associated with this product. The value should be a semi comma-separated list of feature sets and their corresponding values. Example: 0:1;1:2;2:3;3:6.&#x20;
  * Click **Add Custom Field**
* Locate the **Product Categories** section on the right-hand panel
  * Click the **+ Add New Product Category** link
  * Enter: qlm
  * Click the **Add New Product Category** button
  * Make sure the new category **qlm** is checked.

Finally, click the **Update** button on the top right to commit all your changes to the product.

Now locate the QLM item in the WordPress left-hand panel and click it.

In the Settings for the API section, enter the following information:

* End Point: Enter the URL to the QLM License Server. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* QLM Version: 5.0.00
* User: Enter the [user](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider) associated with the WooCommerce provider
* Password: Enter the [password ](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider)associated with the WooCommerce provider
* Click Save Settings

Now click the QLM / Email Templates section to configure the email that will be sent to the end-user when an order is placed. Email templates are configured per product.

* Enter a header for the email
* Select the product
* Enter the body of the email
* Finally, enter the footer of the email
* Click Update

If you do not want the QLM plugin to send an email, add a new custom field as follows:

* Name: is\_send\_mail
* Value: false

&#x20;To place a test order:

* In the WordPress left panel, click Products
* Locate your product and click **View**
* Click **Sign up Now**
* Click **View Cart**
* Click **Proceed to Checkout**
* Enter your **Billing Details** and click **Continue**
* Click **Continue** for **Additional Information**
* Select your payment method and proceed to pay
* Once payment is completed, go to the WordPress left panel and click **WooCommerce / Orders**
* Locate the order you just placed and click it
* If the **Order Status** is set to **Pending Payment**, set it to **Processing then** click **Save Order** in the right-hand panel.
* At this point, a license key should have been generated.
* In the Order details page, scroll to the bottom of the page and locate the License Keys section. It should contain the generated key(s).
* In case an error occurred while processing the transaction, a note in the right-hand panel displays details about the error.
