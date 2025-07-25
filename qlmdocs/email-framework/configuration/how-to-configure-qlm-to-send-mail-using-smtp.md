# Sending emails using SMTP

Overview

QLM can send emails using 4 different methods:

* Microsoft Outlook (from the client only)
* SMTP server (from the client and the server)
* Microsoft Graph API (from the client and the server).
* Gmail API (from the client and the server).

This article describes how to configure QLM to send emails using SMTP.

### Configure the QLM Management Console to send emails using SMTP

To configure the QLM Management Console to send emails via SMTP:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Options in the Tools section
* Go to the SMTP Server tab
* Enable SMTP
* Enter the proper values for all the fields
* Click the Test button to send a test email.
* To apply the same settings to the License Server, click the ![](<../../.gitbook/assets/image (54).png>) button or check the box "Server Settings"
* Click Ok

Once SMTP setup, it will be displayed as an option in any QLM component that can send emails.

&#x20;

### Configure the QLM License Server to send emails using SMTP

To configure the QLM License Server to use a different SMTP Server than the QLM Management Console:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* In the License Server ribbon section, click Sites and select your site
* Go to the **Server Properties** tab
* Expand the **smtp** section
* Configure your SMTP settings and click Ok

Note that QLM does not support two factor authentication.

&#x20;

### Common Email Providers Configuration

#### SMTP Settings for Hotmail/Live/Outlook/Office 365:

SMTP Server: smtp-mail.outlook.com

SMTP Port: 587

\[x] This server requires an SSL Connection

User Name: \<your email address>

Password: \<your password

&#x20;

#### SMTP Settings for Yahoo:

SMTP Server: smtp.mail.yahoo.com

SMTP Port: 587

\[x] This server requires an SSL Connection

User Name: \<your email address>

Password: \<your password

&#x20;

#### SMTP Settings for Gmail - Option 1:

\[Google no longer supports this option as of May 2022]

SMTP Server: smtp.gmail.com

SMTP Port: 587

\[x] This server requires an SSL Connection

User Name: \<your email address>

Password: \<your password

Note that if you are not using 2-Step authentication, you might need to configure Google to "allow less secure apps". To do so:

* Login to your [Google Account](https://myaccount.google.com/)
* Click "Device Activity and Security Events"
* In the "Connected Apps & Sites" section, locate the "Allow less secure apps" option
* Set this option to ON.

<div align="left"><figure><img src="../../.gitbook/assets/image.png" alt="" width="239"><figcaption></figcaption></figure></div>

<div align="left"><figure><img src="../../.gitbook/assets/image (55).png" alt="" width="375"><figcaption></figcaption></figure></div>

&#x20;&#x20;

#### SMTP Settings for Gmail - Option 2:

* Login to your [Google Account](https://myaccount.google.com/)
* In the "Sign-in & Security" section, select Signing in to Google
* In the "Password & sign-in method", click App passwords
* In the "Select app" dropdown, select Other, then enter QLM
* Click Generate
* Copy the generated password to a safe location (you will use it later on)
* In the QLM Management console, go to the Manage Keys tab
* Click Options and go to the SMTP Server tab
* Enter the following:

**Note:**

When using Gmail, you may get the following error: "The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.5.1 Authentication Required"

This generally happens when you try login from different time zone or IP Address. Your production server and the mail id you have used could be in different time zones. To resolve this, try one of the solutions below:

1\) Logon to to server and sign in to Gmail once with your credentials. You will be asked for confirmation. Confirm your credentials and log out.

Or 2) Log in to Gmail on your local computer, [click here](https://support.google.com/accounts/answer/1144110?hl=en) then click "Recently used devices page" and confirm the device that was trying to send an email.
