# QLM Customer User Account

A QLM customer user account is a user account managed within QLM that enables customers to perform the following operations:

* Login to the QLM Customer Portal
* Activate a license using a user/password combination

There are several ways to create user accounts as described below.

### Requirements

In order to create user account for customers, you must have a QLM Portal license. A QLM Portal license entitles you to create 100 customer user accounts. To create additional customer user accounts, you must purchase a [Customer User Account Package](https://soraco.co/product/qlm-customer-user-account/).

### Create a user account from the User Accounts menu

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click User Accounts
* Click Add then add the user's information
* Click Ok

![](https://support.soraco.co/hc/article\_attachments/14625725028756)

### Create a user account from the customer's record

* Launch the QLM Management Console
* Go to the Manage Customers tab
* Locate an existing customer and click Edit
* Set a Login Name then click the + button
* Click Ok
* Set the User Type to "Customer"
* Click OK

![](https://support.soraco.co/hc/article\_attachments/14625591122836)

### Create a user account automatically

You can configure QLM to automatically create a user account when a customer is created. To do so, you must set the server property "authentication/autoCreateUserAccount" to true.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then go to the Server Properties tab
* Locate the "authentication/autoCreateUserAccount" property and set it to true.

![](https://support.soraco.co/hc/article\_attachments/14625785443476)

### Password Management

When a user account is created, the system automatically assigns a password to the user account. In order for customers to get access to their account, they must trigger a password reset request.

When the user account is created from the QLM Management Console, you are automatically prompted to send an email to the customer to reset the password. The email template used when sending the email to the customer is called "Customer.UserAccount.ResetPwd" and can be customized from the QLM Email Templates editor. This email template uses a special variable called %ResetPasswordUrl% that is automatically replaced with the proper URL to the Reset Password web page. Note that the URL to your QLM Customer site must be configured by setting the server property "server configuration / customerSiteUrl". The typical URL to the reset password page looks like: [https://yourserver/qlm/QlmCustomerSite/QlmResetPassword.aspx](https://your/)

You can also trigger a password reset email from the User Accounts editor as per the screenshot below.

![](https://support.soraco.co/hc/article\_attachments/14625913046420)
