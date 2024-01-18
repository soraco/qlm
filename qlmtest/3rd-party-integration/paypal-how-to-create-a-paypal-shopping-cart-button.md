# PayPal - How to create a PayPal Shopping Cart Button

To create a Paypal Shopping Cart button that connects to QLM, generates a license key and emails it to the customer:

**Configure Paypal**

* Login to sandbox.paypal.com (you need to repeat these steps on the real PayPal site once you have tested the whole process)
* Log in to your PayPal account
* In the Settings menu, select **Account Settings**
* In the **Notifications** section, locate the **Instant payment notifications** section
* Click **Update**
* Click **Choose IPN Settings**
* In the **Notification URL** field, enter (update the URL to point to your QLM License Server): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx)
* Check the option Receive IPN messages (Enabled)
* Click Save
* Next, we will create the button.
* Locate Paypal buttons and click Update
* Click Create new button
* Set the button type to : Shopping Cart
* Set Item Name to your Product Name
* Set Item ID to: ITEM1
* Set Price to any value of your choice
* Click **Save Changes**
* On the next page, copy the Website HTML code and save it in an HTML file, say paypalqlm.html, on your desktop or website

**Define ITEM1 in QLM**

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear at the bottom of the grid.
* In the Name column, enter: ITEM1
* In the Value column, enter (replace the values to match your product): _\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=permanent\&is\_productname=Demo\&is\_emailtemplate=Paypal.NewOrder_
* Click OK to close the Site Editor&#x20;

#### Process Customization

There are 2 sets of PayPal settings that you can configure. The first set can be configured from the Server Properties while the second set can be configured from the server's web.config file.

You can access the Server Properties from the Manage Keys tab / Sites / Server Properties.

Paypal Settings that can be configured from Server Properties:

**Paypal category**

* ignoreCustomArgument: Ignore data in the paypal custom field.
* ignoreItemNumberArgument: Ignore data in the paypal item number field.
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

As of QLM 9.0.16228.1, the is\_emailtemplate argument can be used with templates created in the QLM Management Console / Templates Editor. For example, if you create a template in the QLM Templates Editor called NewOrder, set the is\_template as follows: \&is\_emailtemplate=NewOrder

QLM 9.0.16228.1+ includes 4 Paypal specific templates: Paypal.NewOrder, Paypal.NewSubscription, PayPal.RenewSubscription and Paypal.CancelSubscription.

**Test the shopping cart**

* Open paypalqlm.html and click the **Add to cart** button
* Follow the steps required to place this test order.
* Within 2-5 minutes, check the QLM Management Console / Manage Keys tab to confirm that a new license was created, and an email was sent.
* If no license is created, check the QLM Event Log to diagnose the issue. You can increase the logging level from Manage Keys / Sites / Server Properties / PayPal / paypalLoggingLevel. The highest level of logging is 15. You should always restore the loggingLevel to its default value of 3 when done.
