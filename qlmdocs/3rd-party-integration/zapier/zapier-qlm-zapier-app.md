# Zapier - QLM Zapier App

The [QLM Zapier App](https://zapier.com/developer/invite/54262/598e90faca24fb4e73ed502ec2134e8d/) allows you to notify other Zapier Apps when a QLM order is created.

The following example uses the QLM Zapier App to send an email to the user when a license is created in QLM.

* Login to your Zapier account
* Click Make a Zap
* In Choose a Trigger App, locate and select "Quick License Manager"
* Click Save + Continue
* In the QLM License Server Url field, enter the URL to your QLM License Server. Example: https://qlm3.net/qlmdemo/QlmLicenseServer/qlmservice.asmx
* In the QLM License Server Url Arguments field, enter: \&is\_user=tom\&is\_pwd=xyz\&is\_period=15

&#x20;        The is\_user, is\_pwd arguments must match the values configured in the QLM Management Console / Manage Keys / eCommerce Providers

&#x20;         The is\_period argument is a period in minutes that determines which keys to return. For example, a value of 15 tells the QLM License Server to return all the keys created in the last 15 minutes. The recommended value is 60.

* Next, you will configure the Action step
* In the Choose an Action App section, select Gmail
* Select "Send Email" then click "Save + Continue"
* Pick your Gmail account then click "Save + Continue"
* In the To field, click the "Insert a field" dropdown and select "Email"
* Fill all the other fields as per your requirements
* Click Continue
* Click "Create & Continue"
* Name your Zap

To test your Zap:

* Launch the QLM Management Console
* Go to the Manage Keys tab and create an Activation Key
* Make sure the Activation Key is associated to your email address (for testing purposes)
* Wait 15 minutes and monitor your email
* You should receive an email for each activation key you created

&#x20;

Note that this Zapier integration requires that you enable the GetRecentOrdersHttp API as follows:

* Go to the Manage Keys tab
* Click Sites and select your License Server
* Go to the Server Properties tab
* Go to the "security" section
* Locate the "enableGetRecentOrders" entry and click the chexbox.
* Click Ok
