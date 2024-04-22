# FastSpring - How to configure a maintenance plan option in FastSpring

If you want to offer your customers a Maintenance Plan option, you can configure FastSpring to offer this option and automatically renew the maintenance plan period in QLM when the plan is renewed in FastSpring.

**Step 1 - Create a Subscription Product for the Maintenance Plan**

* In FastSpring, create a Subscription Product&#x20;
* Add a fulfillment action to this product as follows:
  * URL: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=fastspring
  * Method: HTTP POST
  * POST Encoding: UTF-8
  * Output Format: Single-Line License (Quantity Based)
* In the Advanced tab, set the Fulfillment Applicability to "Applies to Rebills Only"

&#x20;

**Step 2 - Add the maintenance plan as an option to your base product**

* Select your base product and click Edit in the Product Choices section
* Click Add Choice and add the Subscription Product created above
* Configure the options as per your requirements

**Step 3 - Add a Notification**

* In the FastSpring top toolbar, click the **Notifications** icon
* In the Custom Notifications section, click Add
* Set the Event Type to: Order Completed (one per product)
* Set the Destination to: HTTP URL
* Set the Live Server URL to: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=fastspring\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0
* Set the Method to: POST
* In the Conditions tab, set the following:
  * Rule Applicability: Applies to Non-rebills / First Orders only
  * Products: Select your subscription product created above
* In the HTTP Parameters tab, add the following parameters:
  * Name: quantity&#x20;
  * Value: #{orderItem.quantity}
* In the HTTP Parameters tab, add the following parameters:
  * Name: subscriptionReference
  * Value: #{orderItem.subscription.reference}
