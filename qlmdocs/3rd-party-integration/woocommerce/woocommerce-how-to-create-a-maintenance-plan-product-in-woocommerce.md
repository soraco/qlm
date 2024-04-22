# WooCommerce - How to create a maintenance plan product in WooCommerce

QLM can be used in conjunction with WooCommerce Subscriptions via the QLM WooCommerce plugin to add a maintenance plan to your perpetual license product.

A maintenance plan product cannot be sold by itself. It has to be sold as a cross-sell of another product.

First, create one product for your perpetual license product as described in this [article](https://support.soraco.co/hc/en-us/articles/360000367603). The maintenance plan product will be configured as a cross-sell of the perpetual license product.

To set up a maintenance plan product, follow the steps below:

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
* Set the Subscription Price as needed. Example: 15 per year for all time

Next, we will add some custom fields. If you do not see the "Custom Fields" section, click the "Screen Options" drop-down on the top right-hand side of the Product page and make sure the "Custom Fields" checkbox is selected. If you do not see a "Custom Fields" checkbox, make sure "Virtual" is not checked.

In the **Add New Custom Field** section:

* Click **Enter new**
* In the Name field, enter: is\_maintenanceplan
* In the Value field, enter: true
* Click **Add Custom Field**&#x20;
* Locate the **Product Categories** section on the right-hand panel
* Click the **+ Add New Product Category** link
* Enter: qlm
* Click the **Add New Product Category** button
* Make sure the new category **qlm** is checked.

Finally, click the **Update** button on the top right to commit all your changes to the product.

To add the maintenance plan product as a cross-sell:

* In your main product, go to the **Product Data** section
* Click **Linked Products**
* In the **Cross-sells** field, type the first 3 letters of the name of the maintenance product then select it.
* Click Update

Note that you could also use a plugin such as [Forcesells](https://woocommerce.com/products/force-sells/) to force the maintenance plan product to be added to the cart.

&#x20;Now locate the QLM item in the WordPress left-hand panel and click it.

In the Settings for the API section, enter the following information:

* End Point: Enter the URL to the QLM License Server. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* QLM Version: 5.0.00 OR 6.0.00
* User: Enter the [user](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider) associated with the WooCommerce provider
* Password: Enter the [password ](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider)associated with the WooCommerce provider
* Click Save Settings

You can optionally configure the QLM plugin to send an email when the order is placed. Click the QLM / Email Templates section to configure the email that will be sent to the end-user when an order is placed. Email templates are configured per product.

* Enter a header for the email
* Select the product
* Enter the body of the email
* Finally, enter the footer of the email
* Click Update

&#x20;To place a test order:

* In the WordPress left panel, click Products
* Locate your main product and click **View**
* Click **Add To Cart**
* Locate the cross-sell maintenance plan product and click it
* Click **Sign up Now**
* Click **View Cart**
* Click **Proceed to Checkout**
* Enter your **Billing Details** and click **Continue**
* Click **Continue** for **Additional Information**
* Select your payment method and proceed to pay
* Once payment is completed, go to the WordPress left panel and click **WooCommerce / Orders**
* Locate the order you just placed and click it
* If the **Order Status** is set to **Pending Payment**, set it to **Processing then** click **Save Order** in the right-hand panel.
* At this point, a license key should have been generated and the maintenance plan should be enabled.
* In the Order details page, scroll to the bottom of the page and locate the License Keys section. It should contain the generated key(s).
* In case an error occurred while processing the transaction, a note in the right-hand panel displays details about the error.
