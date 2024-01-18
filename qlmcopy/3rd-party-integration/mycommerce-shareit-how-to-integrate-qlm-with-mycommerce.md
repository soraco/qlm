# MyCommerce (Shareit) - How to integrate QLM with MyCommerce

If you are using MyCommerce as an eCommerce provider, QLM integrates seamlessly with MyCommerce's ordering system.&#x20;

When an order is placed, the QLM / MyCommerce integration will perform the following:

* MyCommerce invokes QLM during the ordering process and sends it the order information
* QLM publishes the customer's information to the QLM database
* QLM creates the license keys based on the order
* QLM optionally emails the customer the license key (s)
* The license keys are configured to expire when the subscription expires

When a subscription is successfully renewed:

* MyCommerce invokes QLM and sends it the renewal information
* QLM updates the expiry date of the license
* The protected software application communicates with the license server and applies the new expiry date to the client system.

### Enabling MyCommerce/Shareit in QLM

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click **3rd Party Extensions**
* Click Shareit
* Check the "Enabled" checkbox
* Set a user/password
* Click Ok

![](https://support.soraco.co/hc/article\_attachments/360024649532/mceclip0.png)

### WebHooks Configuration

* Login to your MyCommerce control panel
* Click **Products** / **Manage Products** / **Edit**
* Select the product to configure
* In the **Delivery** panel, click **Edit**
* In the **Add delivery type** panel, select "MyCommerce Share-it delivers: License Key" then click Add
* Set the "Key generate via a URL" value to (update the URL to point to your own QLM License Server and set the user/pwd values to the values specified in the previous step): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=shareit\&is\_user=xxx\&is\_pwd=yyy](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=shareit\&is\_user=xxx\&is\_pwd=yyy)
* Click **Save**

&#x20;

![](https://support.soraco.co/hc/article\_attachments/360027353951/mceclip0.png)

&#x20;

### Mapping the MyCommerce product to a QLM Product

To map your MyCommerce product to a QLM product, you must create a QLM Server Property as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: shareit\_\<Shareit Product ID>. For example, if your MyCommerce Product ID is 300810470, set the name to: shareit\_300810470
* Set the value of the property to (modify the values to correspond to your own product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_productname=MyProduct\&is\_emailtemplate=1. New Order
* For more information about the supported arguments, refer to this [article](https://support.soraco.co/hc/en-us/articles/207606653-GetActivationKeyWithExpiryDate).
* Set the Key generator version to: UTF-8 Unicode
* Click Save

![](https://support.soraco.co/hc/article\_attachments/360024661151/mceclip1.png)

### Testing a purchase

* Login to your MyCommerce control panel
* Click **Products** / **Manage** **Products** / **Edit**&#x20;
* Select the product to test
* Click "Test Order" then Next
* Complete the order
* Once the order is processed a license key should be created and displayed in the order confirmation window.
* Additionally, if you selected an email template, an email will be sent to the customer. To configure QLM to send emails, refer to this [article](https://support.soraco.co/hc/en-us/articles/213887163).

When the subscription is renewed, MyCommerce will automatically connect to the QLM License Server and extend the expiry date of the license by the required period.

&#x20;

### InApp Purchases

You can configure the QLM License Wizard to perform an InApp purchase with MyCommerce.

The InApp purchase is processed via an embedded browser in the QLM License Wizard. At the end of the purchase process, the Activation key is automatically created and displayed in the wizard for the user to activate.

To configure the InApp purchase process:

* Launch the QLM Management Console
* Go to the Protect Your Application wizard
* Click Next
* Select a product and the License Server then click Next
* Select the programming language of your application then click Next
* In the "Customize Look & Feel" page, set the following properties:
  * QlmBuyNowInApp: true
  * QlmBuyNowInAppRetrieveActivationKey: true
  * QlmBuyNowUrl (update the vendor/product ids as required): [https://order.shareit.com/cart/add?vendorid=222222222\&PRODUCT\[333333333\]=1\&HADD\[333333333\]\[ADDITIONAL1\]=](https://order.shareit.com/cart/add?vendorid=222222222\&PRODUCT\[333333333]=1\&HADD\[333333333]\[ADDITIONAL1]=)
* Click Next then Save

&#x20;

![](https://support.soraco.co/hc/article\_attachments/360024662512/mceclip2.png)

&#x20;

### MyCommerce Configuration for subscriptions

To properly handle subscriptions, you must contact MyCommerce and request that the following options be configured for your MyCommerce account:

1. Name in code:  REBILLING\_SEND\_ORG\_KEY
2.
   1. Name in the UI:  Rebilling send original key to key generator.&#x20;
   2. Description:  Result of activation: on rebilling pass original key to key generator
3. Name in code:  REBILLING\_COPY\_ORG\_KEY
4.
   1. Name in the UI:  Rebilling: copy original key to rebilling purchase.&#x20;
   2. Description:  Result of activation: copy original key to rebilling purchase, do not create a new key

&#x20;

### MyCommerce Configuration of a Maintenance plan product

If you sell a maintenance plan, you can configure a MyCommerce product to automatically renew the maintenance plan expiry date in QLM upon successful payment. Note that this procedure will only work if you have a single product in the order.

To configure a product as a maintenance plan:

1. Login to your MyCommerce control panel
2. Click **Products** / **Manage Products** / **Edit**
3. Select the maintenance plan product to configure
4. In the **Delivery** panel, click **Edit**
5. Set the "Key generate via a URL" value to (update the URL to point to your own QLM License Server and set the user/pwd values to the values specified in the previous step): [https://quicklicensemanager.com/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=shareit\&is\_user=xxx\&is\_pwd=yyy\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0](https://quicklicensemanager.com/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=shareit\&is\_user=xxx\&is\_pwd=yyy\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0)
6. Click **Save**

To display the maintenance plan product alongside your current product:

1. Click **Products** / **Manage Products** / **Edit**
2. Select the main product
3. In the Details panel, click Edit
4. In the Product Allocations panel, add the Maintenance Plan product to the right-hand list.
5. Click Save data

The Maintenance Plan product should now appear on the order page of the main product.
