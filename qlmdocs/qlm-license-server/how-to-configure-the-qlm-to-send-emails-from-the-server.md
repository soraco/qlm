# How to configure the QLM to send emails from the server

The QLM Portal, the QLM License Server, the QlmCustomerSite and QLM License Wizard can send emails to your customers for various notifications. These emails are sent from the License Server.

The server can send emails using one of the following methods:

* SMTP
* Microsoft Graph API
* Gmail API

To configure which method the server should use to send emails, set the Server Property "options/emailProvider" to: Smtp | Microsoft Graph API |Gmail API

Once you select the required method, you must configure the mail settings for that method as show below:

* [How to configure the server to send emails using SMTP](../email-framework/configuration/how-to-configure-qlm-to-send-mail-using-smtp.md)
* [How to configure the server to send emails using the Microsoft Graph API](../email-framework/configuration/sending-emails-using-the-microsoft-graph-api.md)
* [How to configure the server to send emails using the Gmail API](../email-framework/configuration/sending-emails-using-the-gmail-api/)

