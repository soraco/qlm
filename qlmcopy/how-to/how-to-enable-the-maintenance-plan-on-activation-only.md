# How to enable the maintenance plan on activation only

When you enable the Maintenance Plan option while creating a new Activation Key, QLM will by default set the expiry date of the Maintenance Plan to: Current date + Duration of the Maintenance Plan.

The duration of a maintenance plan can be configured by setting the Server Property options/maintenancePlanPeriodInDays.

In some use cases, such as creating keys in bulk to provide to a 3rd party, you may want to delay the start date of the maintenance plan until the customer activates the license. This can be achieved as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Create Activation Key
* Select the product and any required option
* Enable the Maintenance Plan
* Go to the Advanced tab
* Set the Order Status dropdown to "EInProgress"
* Click Ok

A new Activation Key will be created but the maintenance plan will not be set.

Upon activation, the maintenance plan will be set to: Activation Date + Duration of the Maintenance Plan

&#x20;

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/360030777711/mceclip2.png)
