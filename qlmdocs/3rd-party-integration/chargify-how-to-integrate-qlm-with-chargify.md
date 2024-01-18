# Chargify - How to integrate QLM with Chargify

If you are using Chargify as an eCommerce provider, QLM integrates seamlessly with Chargify's ordering system.&#x20;

When an order is placed, the QLM / Chargify integration will perform the following:

* Chargify invokes QLM during the ordering process and sends it the order information
* QLM publishes the customer's information to the QLM database
* QLM creates the license keys based on the order
* QLM emails the customer the license key (s)
* The license keys are configured to expire when the subscription expires

When a subscription is successfully renewed:

* Chargify invokes QLM and sends it the renewal information
* QLM updates the expiry date of the license
* The protected software application communicates with the license server and applies the new expiry date to the client system.

When a subscription is cancelled:

* Chargify invokes QLM and sends it the cancellation information
* QLM revokes the license on the License Server
* The protected software application communicates with the license server, detects that the license was revoked and exits the application.

### **WebHooks Configuration**

* Login to your Chargify control panel
* Click the **Config** menu then select **Settings**
* In the **Settings** panel, click **WebHooks**
* Click **Add New Endpoint**
* Enter the following URL (update the URL to point to your own QLM License Server): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=chargify](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=chargify)
* Check the following Webhook Subscriptions:
  * Payment Success
  * Signup Success < NO
  * Renewal Success
  * Subscription State Change
  * Component Allocation Change
* Click **Save**

![](https://support.soraco.co/hc/article\_attachments/360010176212/mceclip0.png)

### &#x20;**Product Configuration**

* Login to your Chargify control panel
* Click the **Catalog** menu then select **Products**
* Click **Create New Product**
* Enter a product name and a recurring period / price
* Click **Create Product**

### **Enabling Chargify in QLM**

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click **3rd Party Extensions**
* Click Chargify
* Check the "Enabled" checkbox
* Set the URL to: [https://yourcompany.chargify.com](https://yourcompany.chargify.com/)
* Set the API Key to your [Chargify API Key](https://help.chargify.com/integrations/api-keys-chargify-direct.html).
* Set the Shared Key to your Chargify SharedKey (from [Edit Current Site](https://help.chargify.com/my-account/password-shared-secret.html)).
* Click Ok

![](https://support.soraco.co/hc/article\_attachments/360010173192/mceclip1.png)

### **Mapping the Chargify product to a QLM Product**

To map your Chargify product to a QLM product, you must create a server property as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: pid\_\<Chargify Product ID>. For example, if your Chargify Product ID is 4662940, set the name to: pid\_4662940
* Set the value of the property to (modify the values to correspond to your own product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_productname=MyProduct\&is\_emailtemplate=1. New Order
* For more information about the supported arguments, refer to this [article](https://support.soraco.co/hc/en-us/articles/207606653-GetActivationKeyWithExpiryDate).
* Click Ok

![](https://support.soraco.co/hc/article\_attachments/360010206671/mceclip2.png)

### **Testing a purchase**

* Login to your Chargify control panel
* Click the **Billing** menu then select **Subscriptions**
* Click **Create New Subscription**
* Select a Product
* Enter your contact information
* In the **Test Data** panel, click **Fill Data** next to the **Successful Transaction** field
* Set the **Next Billing Date** to **Immediate**
* Click **Create Subscription**
* Within 10-30 seconds, a new license key will be automatically created in QLM and an email will be sent to the customer. To configure QLM to send emails, refer to this [article](https://support.soraco.co/hc/en-us/articles/213887163).

When the subscription is renewed, Chargify will automatically connect to the QLM License Server and extend the expiry date of the license by the required period.

### **Handling Quantity**

If you sell multiple licenses of your product, you must create a Chargify Component of type Quantity as follows:

* Login to your Chargify control panel
* Click the **Catalog** menu then select **Products**
* In the **Components** section **,** click **Create Component**
* Select **Quantity based Component**
* Set the component's name and unit name to any values of your choice
* Configure the pricing as required and click **Save**

To test a multiple licence purchase:

* Login to your Chargify control panel
* Click the **Billing** menu then select **Subscriptions**
* Click **Create New Subscription**
* Select a Product
* In the Component's section, select the quantity based component created earlier and set the quantity to any value of your choice. For example, set the quantity to 5.
* Enter your contact information
* In the **Test Data** panel, click **Fill Data** next to the **Successful Transaction** field
* Set the **Next Billing Date** to **Immediate**
* Click **Create Subscription**
* Within 10-30 seconds, a new license key will be automatically created in QLM and an email will be sent to the customer. To configure QLM to send emails, refer to this [article](https://support.soraco.co/hc/en-us/articles/213887163).
* The created license will be configured to allow activation on 5 different computers.

### **Handling Features**

If your product includes modules that can be optionally purchased, you can configure QLM to automatically enabled the purchased features in the license key. To do so, you must first create a Chargify Component of type OnOff as follows:

* Login to your Chargify control panel
* Click the **Catalog** menu then select **Products**
* In the **Components** section **,** click **Create Component**
* Select **On/Off Component**
* Set the component's name
* Configure the pricing as required and click **Save**

#### **Mapping a Chargify Component to a QLM feature**

To map your Chargify On/Off component to a QLM feature, you must create a server property as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: cid\_\<Chargify Component ID>. For example, if your Chargify Component ID is 491118, set the name to: cid\_491118
* Set the value of the property to (modify the values to correspond to your own product): \&is\_features=0:1
* For more information about the syntax of is\_features, refer to this [article](https://support.soraco.co/hc/en-us/articles/204160380-What-is-the-syntax-of-is-features).
* Click Ok

To test a multiple licence purchase:

* Login to your Chargify control panel
* Click the **Billing** menu then select **Subscriptions**
* Click **Create New Subscription**
* Select a Product
* In the Component's section, select the On/Off based component created earlier.
* Enter your contact information
* In the **Test Data** panel, click **Fill Data** next to the **Successful Transaction** field
* Set the **Next Billing Date** to **Immediate**
* Click **Create Subscription**
* Within 10-30 seconds, a new license key will be automatically created in QLM and an email will be sent to the customer. To configure QLM to send emails, refer to this [article](https://support.soraco.co/hc/en-us/articles/213887163).
* The created license will be configured with the selected features/components.
