# Paypal - How to integrate Paypal Subscription with QLM

QLM 8.1 supports PayPal subscriptions. To set up a subscription-based product in PayPal, follow the steps below:

QLM uses Paypal Instant Payment Notifications (IPN) to automate the license key generation process and subscription renewal. The first step in setting up the integration is to configure the Paypal IPN to point to the QLM License Server.

* Log in to your PayPal account
* In the Settings menu, select **Account Settings**
* In the **Notifications** section, locate the **Instant payment notifications** section
* Click **Update**
* Click **Choose IPN Settings**
* In the **Notification URL** field, enter (update the URL to point to your QLM License Server): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx)
* Check the option Receive IPN messages (Enabled)&#x20;
* Click Save

In QLM, make sure that Paypal is enabled. To do so:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions
* Select Paypal and check the Enabled box.
* Optionally but preferably, configure a User/Password combination. The password should not contain special characters (!?/\\).
* Click Ok

Next, you need to create a button that your customers can use to purchase your product.

* Logon to your PayPal account
* In the Profile menu, select **My Selling Tools**
* In the **Selling online** section, select **Paypal buttons / Update**
* Click **Create new button**
* Set the button type to: **Subscriptions**
* Set the item name as your product name
* Select your currency
* Enter a billing amount per cycle
* Specify your billing cycle
* Expand the **Step 3** panel
* In the **Advanced variables** section, check **Add advanced variable** and enter the following in the field: custom=\&is\_productid=1\&is\_majorversion=2\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=subscription\&is\_emailtemplate=Paypal.NewSubscription\&is\_emailtemplate\_renew=Paypal.RenewSubscription\&is\_user=\<user>\&is\_pwd=\<pwd>

Replace the values for is\_productid, is\_majorversion, is\_minorversion and is\_features with the values of your choice.

Replace the values of \<user> and \<pwd> with the user/password combination created in the QLM Management Console / 3rd Party Extensions. If you did not specify a user/pwd, remove the is\_user/is\_pwd arguments from the custom variable above.

* Click **Create button**
* Go back to the **My Saved Buttons** page
* Next to your product, click the **Action** dropdown and select **View code**
* Copy the code and paste it on a page on your web site.

You can customize the email template to use when sending an email to the customer. To customize the email template, add the _is\_emailtemplate_ argument as shown above. The email template can be created from the QLM Management Console / Manage Keys / Email Templates. For example, if you create a template in the QLM Templates Editor called NewOrder, set the is\_template as follows: \&is\_emailtemplate=NewOrder

The email template can contain any PayPal variable such as %payer\_email% or %ProductName%.&#x20;

QLM 9.0.16228.1+ includes 4 Paypal specific templates: Paypal.NewOrder, Paypal.NewSubscription, PayPal.RenewSubscription and Paypal.CancelSubscription.

To test the subscription:

* Go to the page on your site that has the button created earlier
* Click the button
* A license key will be generated and emailed to the customer
* Upon renewal of the subscription, the QLM Subscription Expiry date will be automatically updated.

For details on how to support subscriptions in your application, check this [article](https://support.soraco.co/hc/en-us/articles/200754094-How-to-implement-software-subscription).

For a list of Paypal's subscription variables, check this [article](https://www.paypal.com/us/cgi-bin/webscr?cmd=p/acc/ipn-subscriptions-outside).

**Note:** In order to support accented characters in customers' names or postal addresses, make sure that you configure PayPal to handle UTF-8 as described in this [article](https://support.soraco.co/hc/en-us/articles/115004090386-Configure-Paypal-to-handle-UTF-8).
