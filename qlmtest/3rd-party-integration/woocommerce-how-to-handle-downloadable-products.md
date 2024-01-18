# WooCommerce - How to handle Downloadable products

If you need to enable the **Downloadable** option for your WooCommerce product, there are special steps to consider.

By default, when a product is flagged as Virtual and Downloadable, WooCommerce automatically sets the Order Status to Completed when the payment is processed. By doing so, the QLM plugin is notified too late in the process and is not able to properly insert the license key in the order and the email.

There are two possible solutions to circumvent this behaviour:

* Set the product to Downloadable but not Virtual: With this setting, the order is not automatically set to Completed and QLM is able to process the order as expected.
* Set the product to Downloadable and Virtual and use the [WooCommerce Order Status Control](https://woocommerce.com/products/woocommerce-order-status-control/) to modify WooCommerce's default behaviour. Once you install the WooCommerce Order Status Control, change the "Orders to AutoComplete" setting in WooCommerce / Settings / General to "None".
