# FastSpring - How to integrate with FastSpring's New Contextual Storefront for a Regular Product

FastSpring's Contextual StoreFront uses webhooks to send order information to external services such as QLM. QLM 9.2+ can process FastSpring's webhook notification and create the required license keys based on the order.

### **Step 1 - Adding a webhook**

* Login to the FP storefront
* Expand the Developer Tools section
* Click Webhooks
* Go to the Configuration tab
* Click "Add Webhook"
* Set the Title to "QLM"
* Set "Get webhooks from:" Live and Test Orders
* Click Add
* Click Add WebHook Url
* In the URL field, enter: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=fastspring\&is\_user=abc\&is\_pwd=def
* Update the URL above to point to your License Server. Update the credentials to match the credentials you defined in the QLM Management Console / Manage Keys / eCommerce Providers
* In the Events section, check "order.completed"
* Click Add

### **Step 2 - Product Configuration**&#x20;

In order to create a license associated with a given product, you must add a FastSpring Fulfillment Action as described below:

* Select your Product in FastSpring
* In the Fulfillment section, click ADD FULFILLMENT
* Check the "Generate a License" radio button, select "Remote Server Request" then click Next
* In the URL field, enter: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is\_vendor=fastspring\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_user=abc\&is\_pwd=def\&is\_features=0:3\&is\_licensemodel=permanent
* Update the URL above as required to match your own server and product
* Set the Method to: HTTP POST
* Set the Encoding to: UTF-8
* Set the Output Format to: Single-Line License (Quantity Based)
* Click CREATE
* Next, click the Options dropdown in the top menu and select Custom Attributes.
* Set the KEY to: webhook\_action
* Set the Value to: UpdateUserInformation
* Click Save

This completes the integration with FastSpring New Contextual Storefront.&#x20;

You can now place a test order and confirm that:

* A license key is properly created in QLM that matches the FastSpring order
* Customer Contact Information is automatically created in QLM.
* The email that's sent to the customer includes the License Key that was generated by QLM.

### Create a Maintenance Plan subscription for a regular product

If you want to provide an option to sell a yearly maintenance plan associated with your regular product, follow the steps below:

* Create a subscription product
* Set the pricing and period as required
* In the Fulfillment section, click ADD FULFILLMENT
* Check the "Generate a License" radio button, select "Remote Server Request" then click Next
* In the URL field, enter: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=fastspring\&is\_user=abc\&is\_pwd=def
* Update the URL above as required to match your own server and product
* Set the Method to: HTTP POST
* Set the Encoding to: UTF-8
* Set the Output Format to: Single-Line License (Quantity Based)
* Click CREATE
* Click the fulfillment again and go to the Advanced tab
* In the Fulfillment Applicability, select "Applies to Rebills Only"
* Click SAVE
* Click the More dropdown button and select "Custom Attributes"
* Add the following rows:
  * Row 1&#x20;
    * Key: is\_productid
    * Value: The ID of your product
  * Row 2
    * Key: webhook\_action
    * Value: RenewMaintenancePlan
* Click Save