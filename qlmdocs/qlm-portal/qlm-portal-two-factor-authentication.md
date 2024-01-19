# QLM Portal Two-Factor Authentication

Applies To: QLM Portal

Version: 16.1.22303.2

***

The QLM Portal can be configured to require two-factor authentication. To enable two-factor authentication you must do the following:

* Set the [Server Property](https://support.soraco.co/hc/en-us/articles/207920563): portal / enableMFA to true
* [Configure an SMTP Server](https://support.soraco.co/hc/en-us/articles/213887163) in order to send a verification code by email
* Configure an SMS provider and associate a mobile phone number to the user account in order to send a code by email &#x20;

When you enable MFA, a user who successfully authenticates with a user/password combination is then prompted to enter a verification code. The verification code is sent to the user's email or mobile phone number if a mobile number is provided and an SMS provider is configured. Once the user enters the verification code, and the verification succeeds, the user is logged in to the QLM Portal.

&#x20;

| ![mceclip0.png](https://support.soraco.co/hc/article\_attachments/10465623550100) | ![mceclip1.png](https://support.soraco.co/hc/article\_attachments/10465612615572) |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |

&#x20;

**How to configure an SMS Provider**

To send the authorization code by SMS, you must use a 3rd party SMS provider. QLM is integrated with[ Twilio](https://www.twilio.com/) for sending SMS messages.

To configure your Twilio SMS settings:

* Go to the Manage Keys / Sites / Server Properties
* Locate the activation category
* Set the 3 properties: smsAccountNumber, smsAuthenticationToken, and smsPhoneNumber.

**Mobile Phone number**

To associate a mobile phone number with a user account, edit the user account from Manage Keys / User Accounts and set the mobile number. Note that if you are upgrading from a previous version of QLM, you must update the QlmLicenseServer and QlmPortal web.config files by adding the Mobile setting as shown in the screenshot below.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/10465849877268)

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/10465891224724)

&#x20;

**MFA Email Template**

To configure the email template to be used when sending the authentication code to the user, set the server property portal/mfaEmailTemplate to the required email template. A ready-to-use template called "Portal.MFA" is provided but must be imported into the system as follows:

* Go to the Manage Keys tab
* Click Templates in the Mail section
* Click Import and go to the folder: C:\Program Files\Soraco\QuickLicenseMgr\EmailTemplates then select "Portal.MFA"
* Customize the template as needed (note that variables are not supported).
* Close the Templates Editor
