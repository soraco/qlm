# WooCommerce - How to process manual subscriptions

Requirements: QLM Enterprise v15+

***

### Overview

If some of your customers do not wish to renew their subscription via an automated payment method like credit cards but would rather use Direct bank transfer, you need to process their orders manually.

WooCommerce Subscriptions automatically creates a "Pending Payment" order the day the subscription expires. When this order is created, the customer receives an email with instructions to make a payment. Since manual payments are typically done via wire transfer,  customers may need up to one week to process the payment. Since the license expires on the subscription renewal date, the customer will not be able to use your product until payment is received and processed.

To address this use case, the process described below allows you to create an order "Pending Payment" several days before expiry to provide customers sufficient time to process their payment.

### &#x20;Procedure

1. In the QLM Management Console, create a search that defines the criteria to trigger the process.&#x20;
2. Configure a Scheduled Task of type Webhook that will connect with the WooCommerce Store to create the order.
3. Configure the QLM Agent as a service.
4. Install the QLM WooCommerce plugin v2.4 or higher.

#### Search

* Click on the Manage Keys tab
* Click on the Search drop-down and select Edit Searches
* Click on Add to add a new search
* Set the Name to: Manual Subscriptions (or any name you wish)
* Set the SQL field to (this will trigger the process for any subscription that expires 14 days from today)

```
IncludeInMailList <> 0 and 
Disabled=0 and 
LicenseModel = 'subscription' and 
(SubscriptionExpiryDate > [today_start-14]) and
(SubscriptionExpiryDate < [today_start])
```

* Click OK

#### Scheduled Task

* On the ribbon bar, click on the Tools / Scheduled Tasks
* Click on Add to add a new task
* Set the Name to: Manual Subscriptions (or any name you wish)
* Select your License Server
* In the Search drop-down, select the Search we created earlier: Manual Subscriptions
* Set the Schedule Run every to: 1 Day&#x20;
* In the Webhooks tab, check "Enable Webhook"
* Set the Webhook URL to: https://\<yourdomain>/wp-json/wc-qlm-webhooks/v1/renew-subscription
* Set the Secret Key to any value of your choice. This is like a password.
* Leave the UserData field empty
* Close the editor

#### WooCommerce Configuration

After installing the QLM WooCommerce plugin, go to the Settings of the QLM plugin and set the Secret Key to the value specified earlier in the Scheduled Task.

#### Testing

To test this configuration, you need to already have:

* A WooCommerce Subscription with a renewal date in the next 14 days (based on the search created above)
* A license key in QLM whose SubscriptionID corresponds to the subscription above
* When the scheduled task above is executed, a new "Pending Payment" order will be automatically created and the customer will receive an email to that effect.
* The Subscription Status will be set to On Hold until payment is made
* Once you confirm that payment is received, you must manually edit the Order and set the Status to Complete.
