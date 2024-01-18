# WooCommerce Payment Providers Configuration

When setting up a payment provider in WooCommerce, it is critical to configure the proper settings so that WooCommerce can be notified of updates performed by the payment provider.

### Stripe Configuration

If you are using Stripe, review the [WooCommerce / Stripe integration documentation](https://docs.woocommerce.com/document/stripe/) and ensure that you configure at a minimum the following settings:

* Live Secret Key&#x20;
* Live Publishable Key
* WebHooks

### Paypal Standard Configuration

If you are using Paypal, review the [WooCommerce / Paypal integration documentation](https://docs.woocommerce.com/document/paypal-standard/) and ensure that you configure at a minimum the following settings:

* Live API username
* Live API password
* Live API signature
* Paypal IPN
