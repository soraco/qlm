# WooCommerce - How to process a manual order

This article describes how to process manual orders in WooCommerce. Manual orders are typically used when the customer uses non-automated payment methods such as a wire transfer.

### Regular Product

* Create a new order in WooCommerce and add the required products to the order.
* The Status of the order should be _Pending Payment._
* Once you receive payment, set the Order Status to _Processing_ and click Update.
* Once the update is completed, license keys are generated and attached to the order.

### Subscription Product

* Create a new subscription in WooCommerce and add the required products to the subscription.
* Set the Customer.
* Set the Payment Schedule as required.
* Click Create.
* In the Subscription actions dropdown, click "Create pending parent order".
* Go to the order that was created
* Once you receive payment, set the Order Status to _Processing_ and click Update.
* Once the update is completed, license keys are generated and attached to the order.
