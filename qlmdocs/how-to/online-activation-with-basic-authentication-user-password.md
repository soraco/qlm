# Online Activation with basic authentication (user/password)

Applies to: QLM Enterprise

Version: 17.0.23095.4

***

### Overview

With QLM v17, users can activate their license simply by using their QLM user account. There's no need to remember an Activation Key.

Activation by basic authentication works as follows:

* A user provides his email and password rather than a license key for activation.
* The server validates the user's credentials then checks if the user owns a license and if he/she does, the license is retrieved and activated.

Activating using Basic Authentication (ABA) is supported in 2 different ways:

1. From the QLM License Wizard.
2. From the QLM API.

### Requirements

In order to create user account for customers, you must have a QLM Portal license. A QLM Portal license entitles you to create 100 custom user accounts. To create additional user accounts, you must purchase a [Customer User Account Package](https://soraco.co/product/qlm-customer-user-account/).

### ABA using the QLM License Wizard

To enable ABA from the QLM License Wizard:

* Launch the QLM Management Console.
* Go to the Protect Your Application tab.
* In the Behavior Properties section, locate the property QlmAllowedActivationMethod and check the "BasicAuthentication" option. **Note that this option is only available for QLM Enterprise customers.**
* In the Behavior Properties section, locate the property. QlmShowCustomerEmailInsteadOfActivationKey and set it to True.
* Save the wizard settings xml file and LicenseValidator class.
* Update your application to use these files.

![](https://support.soraco.co/hc/article\_attachments/14625882743188)

### User Accounts

In order for a customer to activate a license using basic authentication, you must create a user account for the customer. There are several ways to create user accounts as described below.

#### Create a user account from the User Accounts menu

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click User Accounts
* Click Add then add the user's information
* Click Ok

![](https://support.soraco.co/hc/article\_attachments/14625725028756)

#### Create a user account from the customer's record

* Launch the QLM Management Console
* Go to the Manage Customers tab
* Locate an existing customer and click Edit
* Set a Login Name then click the + button
* Click Ok
* Set the User Type to "Customer"
* Click OK

![](https://support.soraco.co/hc/article\_attachments/14625591122836)

#### Create a user account automatically

You can configure QLM to automatically create a user account when a customer is created. To do so, you must set the server property "authentication/autoCreateUserAccount" to true.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then go to the Server Properties tab
* Locate the "authentication/autoCreateUserAccount" property and set it to true.

![](https://support.soraco.co/hc/article\_attachments/14625785443476)

#### Password Management

When a user account is created, the system automatically assigns a password to the user account. In order for customers to get access to their account, they must trigger a password reset request.

When the user account is created from the QLM Management Console, you are automatically prompted to send an email to the customer to reset the password. The email template used when sending the email to the customer is called "Customer.UserAccount.ResetPwd" and can be customized from the QLM Email Templates editor. This email template uses a special variable called %ResetPasswordUrl% that is automatically replaced with the proper URL to the Reset Password web page. Note that the URL to your QLM Customer site must be configured by setting the server property "server configuration / customerSiteUrl". The typical URL to the reset password page looks like: [https://yourserver/qlm/QlmCustomerSite/QlmResetPassword.aspx](https://your/)

&#x20;

You can also trigger a password reset email from the User Accounts editor as per the screenshot below.

![](https://support.soraco.co/hc/article\_attachments/14625913046420)

### User Experience from the QLM License Wizard

When the end user launches your application for the first time:

* The QLM License Wizard is launched.
* The user selects Online Activation.
* The user enters the email address used at the time of purchase instead of entering an Activation Key.
* The user clicks Activate.
* The user is prompted to enter a password.
* The wizard sends the user credentials to the server. The License Server validates the credentials, locates the customer's license and activates it.

![](https://support.soraco.co/hc/article\_attachments/14631961064596)

![](https://support.soraco.co/hc/article\_attachments/14632039691540)

![](https://support.soraco.co/hc/article\_attachments/14632097732116)

![](https://support.soraco.co/hc/article\_attachments/14632277039252)

### AAC using the QlmLicense API

* Call QlmLicense.[ActivateLicenseByBasicAuthentication](../api-reference/qlmlicense/application-methods/activatelicensebybasicauthentication.md)
