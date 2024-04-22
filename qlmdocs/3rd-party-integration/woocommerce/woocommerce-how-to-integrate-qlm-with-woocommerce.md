# WooCommerce - How to integrate QLM with WooCommerce

### QLM Configuration

To enable a WooCommerce integration in QLM:&#x20;

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd party extensions
* Select WooCommerce
* Check the "Enabled" field
* Set a user and password
* Click Ok

### WordPress Configuration

To integrate QLM with WooCommerce, you must first download the QLM WooCommerce plugin:

* Go to wordpress.org
* Click the Plugins menu item
* In the "Search Plugins" field, enter: Quick License Manager
* Click on the "Quick License Manager" plugin
* Click the Download button and install the plugin

Once the plugin is installed, a new entry called QLM will be created in your WordPress left-hand panel section. &#x20;

The first step in selling your product via WooCommerce is to define your product in WordPress.

* Click Add Product
* Enter a Product name
* Set the **Product Data** to: Variable product
* Important: Do **NOT** check the **Downloadable** checkbox
* Click **Attributes**
* Next to the Custom product attribute, click **Add**.
* In the Name field, enter: Maintenance Plan
* In the Values field, enter: Yes | No
* Check "Visible on the product page"
* Check "Used for variations"
* Click **Save attributes**.
* Click the **Variations** item
* Select "Create variations from all attributes" and click Go
* Two variations will be created: Yes and No
* Expand the Yes variation and set the Regular Price to the price of the Maintenance Plan, say 10.
* Set the SKU to: \&is\_maintenance\_plan=true
* Important: Do NOT check the VIRTUAL checkbox
* Expand the No variation and set the Regular Price to the price to 0.
* In the **Default Form Values** dropdown, select: No
* Click **Save Changes**.

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
  * In the Value field, enter the Minor Version of your product as defined in the QLM Management Console / Define Products tab.
  * Click **Add Custom Field**
* Set the License Model
  * Click **Enter new**
  * In the Name field, enter: is\_licensemodel
  * In the Value field, enter one of the following: permanent | permanent\_cloud | permanent\_floating | trial | trial\_cloud | trial\_floating | subscription | subscription\_cloud | subscription\_floating
  * Click **Add Custom Field**
* Optional - Set the Features
  * Click **Enter new**
  * In the Name field, enter: is\_features
  * In the Value field, enter the features associated with this product. The value should be a semi-comma-separated list of feature sets and their corresponding values. Example: 0:1;1:2;2:3;3:6.&#x20;
  * Click **Add Custom Field**
* Optional - Set the Expiry Duration
  * Click **Enter new**
  * In the Name field, enter: is\_expduration
  * In the Value field, enter the expiration duration in days
  * Click **Add Custom Field**
* Optional - Set the Expiry Date
  * Click **Enter new**
  * In the Name field, enter: is\_expdate
  * In the Value field, enter the expiration date in the following format: YYYY-MM-dd
  * Click **Add Custom Field**
* Optional - Instruct the QLM plugin to not send an email since WooCommerce now sends an email
  * Click **Enter new**
  * In the Name field, enter: is\_send\_mail
  * In the Value field, enter: false
  * Click **Add Custom Field**
* Locate the **Product Categories** section on the right-hand panel
  * Click the **+ Add New Product Category** link
  * Enter: qlm
  * Click the **Add New Product Category** button
  * Make sure the new category **qlm** is checked.

Finally, click the **Update** button on the top right to commit all your changes to the product.

Now locate the QLM item in the WordPress left-hand panel and click it.

In the Settings for the API section, enter the following information:

* End Point: Enter the URL to the QLM License Server. Example: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx
* QLM Version: 5.0.00
* User: Enter the [user](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider) associated with the WooCommerce provider
* Password: Enter the [password ](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider)associated with the WooCommerce provider
* Click Save Settings

By default, WooCommerce will automatically send an email including the generated license keys once the transaction is completed. If you would like the QLM Plugin to send an email as well, click the QLM / Email Templates section to configure the email that will be sent to the end-user when an order is placed. Email templates are configured per product.

* Enter a header for the email
* Select the product
* Enter the body of the email
* Finally, enter the footer of the email
* Click Update

To place a test order:

* In the WordPress left panel, click Products
* Locate your product and click **View**
* Click **Add To Cart**
* Click **View Cart**
* Click **Proceed to Checkout**
* Enter your **Billing Details** and click **Continue**
* Click **Continue** for **Additional Information**
* Select your payment method and proceed to pay
* Once payment is completed, go to the WordPress left panel and click **WooCommerce / Orders**
* Locate the order you just placed and click it
* If the **Order Status** is set to **Pending Payment**, set it to **Processing then** click **Save Order** in the right-hand panel. If your product was configured as a **virtual** product, this step should not be required.
* At this point, a license key should have been generated.
* In the Order details page, scroll to the bottom of the page and locate the License Keys section. It should contain the generate keys.

When the QLM plugin sends an email to the customer, it uses the wp\_mail WordPress API. This API will automatically set the "from" address to wordpress@yourdomain.com.

If you would like to change this default "from" email address, follow the instructions in this [article](http://www.butlerblog.com/2011/07/08/change-wordpress-email-from-address-without-a-plugin/).

Note that WooCommerce automatically sends an email with the Order information. This email will, by default, include the license key generated by QLM. If you'd like to customize the WooCommerce email content per product, you can use 3rd party plugins such as [Woo Custom Emails Per Product](https://wordpress.org/plugins/woo-custom-emails-per-product/).
