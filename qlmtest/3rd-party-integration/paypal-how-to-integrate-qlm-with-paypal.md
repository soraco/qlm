# Paypal - How to integrate QLM with Paypal?

If you are using Paypal as an eCommerce provider, QLM integrates seamlessly with Paypal's ordering system. In order to generate a license key for an order and send the key to a customer automatically at the time of purchase, QLM can be used in conjunction with PayPal's Instance Payment Notification (IPN). PayPal's IPN provides immediate notification when a customer purchases your product.

QLM's integration with Paypal is available with all QLM Pro 5.2.0.5 and later.

QLM's integration with Paypal performs the following tasks:

1\. It validates the PayPal request.

2\. It contacts the QLM web service and issues an activation.

3\. It sends an email to the customer with the activation key.

In order to set up the IPN,  you need to modify your PayPal account's Profile to enable Instant Payment Notification and specify a URL to the QLM service that handles Paypal Notifications. Alternatively, you can activate IPN by including the notify\_url in your PayPal button HTML.

The URL to the QLM service that handles Paypal notifications is: http://yourserver/qlmlicenseserver/qlmpaypalipn.aspx

To test this with the QLM Demo License Server, set the URL to: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx

To configure the Paypal IPN to point to the QLM License Server.

* Log in to your PayPal account
* In the Settings menu, select **Account Settings**
* In the **Notifications** section, locate the **Instant payment notifications** section
* Click **Update**
* Click **Choose IPN Settings**
* In the **Notification URL** field, enter (update the URL to point to your QLM License Server): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx)
* Check the option Receive IPN messages (Enabled)
* Click Save

For more detailed instructions on Instant Payment Notification, please refer to PayPal's Order Management Integration Guide found on its website under the tab Merchant Services.&#x20;

The second step to configure the QLM Paypal integration is to enable it in QLM.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions
* Select Paypal and check the Enabled box.
* Optionally but preferably, configure a User/Password combination. The password should not contain special characters (!?/\\).
* Click Ok

#### Process Customization

There are 2 sets of PayPal settings that you can configure. The first set can be configured from the Server Properties while the second set can be configured from the server's web.config file.

You can access the Server Properties from the Manage Keys tab / Sites / Server Properties.

Paypal Settings that can be configured from Server Properties:

**Paypal category**

* ignoreCustomArgument: Ignore data in the PayPal custom field.
* ignoreItemNumberArgument: Ignore data in the PayPal item number field.
* paypalLoggingLevel: specifies the level of logs generated. The levels are defined as follows: Errors: 1 - Warnings: 2 - Information: 4 - Verbose: 8. To log errors and warnings, set the loggingLevel to 3. To log all events, set the loggingLevel to 15.
* paypalUrl: Url of the paypal service. When testing in a sandbox, the URL is typically: https://www.sandbox.paypal.com/cgi-bin/webscr. When going live, change the URL to: https://www.paypal.com/cgi-bin/webscr
* qlmVersion: version of the QLM Engine, typically 5.0.00
* qlmWebServiceUrl = URL to the QLM web service, typically located in the same virtual directory.
* templateFile: Name of the template file. The template file contains the body of the email message that is sent to the customer. The template contains variables that will be replaced at runtime. The template file is located in the same folder as qlmpaypalipn.aspx.
* vendorCompanyName: Name of your company.
* vendorCompanyEmail: Your email address. QLM will cc you every time an email is sent to a customer.

**SMTP Category**

* smtpEnableSSL:Enables SMTP over SSL.
* smtpPassword: The password of the user that needs to authenticate with the SMTP server.
* smtpPort: The port of the SMTP server.
* smtpServer: The SMTP server to use when sending emails.
* smtpUser: The credentials of the user that needs to authenticate with the SMTP server.

Paypal Settings that can be configured from web.config file:

* defaultUrlArgs=When configuring your PayPal cart or Buy Now page, you typically need to configure the productid, major version and minor version (more details later). If these arguments are not provided, the system will default to the product, major and minor version defined in this setting.
* paypalFields: PayPal posts variables to the IPN process. Some of these variables are declared in your shopping cart or in your company's purchase page and others are sent by PayPal automatically. For example, your purchase page defines your company by using the variable called "business". Similarly, PayPal uses the variable payer\_email to identify the customer's email address. The paypalFields setting lists the PayPal fields that QLM will process. A list of the most common fields is preconfigured but you can add more fields if needed. Any field that is added can be used in the email template. Paypal fields must be added to the web.config file on the server.

When configuring your Buy Now button or your Paypal cart, you must configure the following IPN variables. These variables are required by the QlmPaypalIPN process:

* item\_name: product's name, must be changed to be the name of your product
* item\_number or custom: \&is\_productid=x\&is\_majorversion=y\&is\_minorversion=z\&is\_features=f\&is\_licensemodel=m\&is\_productname=p\&is\_user=\<user>\&is\_pwd=\<pwd> where x,y,z,f, m and p must be replaced with the values that correspond to your product. The license model can be one of: trial | subscription | permanent. The syntax for features is described [here](https://support.soraco.co/hc/en-us/articles/204160380-What-is-the-syntax-of-is-features). Replace the values of \<user> and \<pwd> with the user/password combination created in the QLM Management Console / 3rd Party Extensions. If you did not specify a user/pwd, remove the is\_user/is\_pwd arguments from the custom variable above.

&#x20;

When working with carts, Paypal appends a digit at the end of **item\_name** and **item\_number** for each product listed in the cart. QLM will process all products in the cart and send a single email to the customer with the license keys for all the selected products.

Additionally, you can customize the email template to use when sending an email to the customer. To customize the email template, add the _is\_emailtemplate_ argument. The email template can be created from the QLM Management Console / Manage Keys / Email Templates. For example, if you create a template in the QLM Templates Editor called NewOrder, set the is\_template as follows: \&is\_emailtemplate=NewOrder

&#x20;

The email template can contain any PayPal variable such as %payer\_email% or %ProductName%. When your cart includes multiple items, each item will be listed in the email as defined in the %ItemTemplate% section. The %ItemTemplate% section starts with an %ItemTemplate% tag and ends with a corresponding tag. All lines in between the 2 tags are repeated for each item in the cart.\
\


QLM 9.0.16228.1+ includes 4 Paypal specific templates: Paypal.NewOrder, Paypal.NewSubscription, PayPal.RenewSubscription and Paypal.CancelSubscription.

**Using Custom Server Property Variables**

The approach described in this article relies on setting the QLM parameters in the custom field of the Paypal button. Paypal seems to support a limited number of characters in the custom field so if the parameters exceed that limit, some will get truncated by Paypal. To address this Paypal limitation, you can define the QLM parameters as a Custom Server Property and set the Paypal "Item ID" or "Subscription ID" to the name of the QLM Custom Server Variable.&#x20;

To create a custom Server variable:

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear at the bottom of the grid.
* In the Name column, enter: ITEM1 (this should match the Item ID or Subscription ID that you defined in the Paypal button)
* In the Value column, enter (replace the values to match your product): _\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=permanent\&is\_productname=Demo\&is\_emailtemplate=Paypal.NewOrder_
* Click OK to close the Site Editor&#x20;

Now in the Paypal button configuration, set the Item ID or Subscription ID to ITEM1.

&#x20;

#### **Testing**

Once you have completed the customization above, you can use the Paypal IPN simulator to test that the ordering process is working as expected.\
\
The Paypal IPN simulator is located here: [https://developer.paypal.com/webapps/developer/applications/ipn\_simulator](https://developer.paypal.com/webapps/developer/applications/ipn\_simulator)\
\
In the IPN simulator, set the following fields:

* IPN handler URL: [http://yourserver/qlmlicenseserver/qlmpaypalipn.aspx](http://yourserver/qlm/qlmpaypalipn.aspx)
* Transaction type: eCheck Complete
* Payment type: eCheck
* payment\_status: Completed
* Enter the buyers information
* custom: \&is\_productid=x\&is\_majorversion=y\&is\_minorversion=z\&is\_features=0:1;1:3\&is\_productname=Demo  (update these values to match your product)

**Note:** In order to support accented characters in customers' names or postal addresses, make sure that you configure PayPal to handle UTF-8 as described in this [article](https://support.soraco.co/hc/en-us/articles/115004090386-Configure-Paypal-to-handle-UTF-8).
