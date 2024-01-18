# Paypal - How to create a paypal Buy Now button that integrates with QLM

To create a Paypal Buy Now button that connects to QLM, generates a license key and emails it to the customer:

* Login to sandbox.paypal.com (you need to repeat these steps on the real PayPal site once you have tested the whole process)
* In the Settings menu, select **Account Settings**
* In the **Notifications** section, locate the **Instant payment notifications** section
* Click **Update**
* Click **Choose IPN Settings**
* In the **Notification URL** field, enter (update the URL to point to your QLM License Server): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx)
* Check the option Receive IPN messages (Enabled)
* Click Save

**Next, we will create the button.**

* Locate Paypal buttons in My Selling Tools and click Update
* Click the Create new button
* Set the button type to : Buy Now
* Set Item Name to your Product Name
* Set Item ID to any value of your choice
* Set Price to any value of your choice
* Expand **Step3: Customize advanced features**
* Check the **Advanced variables** section
* Enter the following in this section (replace values to match your own product): _custom=\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=permanent\&is\_productname=Demo\&is\_emailtemplate=Paypal.NewOrder_
* Click **Save Changes**
* On the next page, copy the Website HTML code and save it in an HTML file, say paypalqlm.html, on your desktop or website

**Testing the Buy Now button**

* Open paypalqlm.html and click the **Buy Now** button
* Follow the steps required to place this test order.
* Within a 2-5 minutes, check the QLM Management Console / Manage Keys tab to confirm that a new license was created
* If no license is created, check the QLM Event Log to diagnose the issue. You can increase the logging level from Manage Keys / Sites / Server Properties / PayPal / paypalLoggingLevel. The highest level of logging is 15. You should always restore the loggingLevel to its default value of 3 when done.

**Email Template**

You can customize the email template to use when sending an email to the customer. To customize the email template, add the _is\_emailtemplate_ argument as shown above. The email template can be created from the QLM Management Console / Manage Keys / Email Templates.\
\
The email template can contain any PayPal variable such as %payer\_email% or %ProductName%.&#x20;

As of QLM 9.0.16228.1, the is\_emailtemplate argument can be used with templates created in the QLM Management Console / Templates Editor. For example, if you create a template in the QLM Templates Editor called NewOrder, set the is\_template as follows: \&is\_emailtemplate=NewOrder

QLM 9.0.16228.1+ includes 4 Paypal specific templates: Paypal.NewOrder, Paypal.NewSubscription, PayPal.RenewSubscription and Paypal.CancelSubscription.
