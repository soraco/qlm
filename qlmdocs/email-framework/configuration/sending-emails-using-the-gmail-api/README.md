# Sending emails using the Gmail API

Edition: QLM Pro+

Version: 17+

***

### Overview

QLM can send emails using 4 different methods:

* Microsoft Outlook (from the client only)
* SMTP server (from the client and the server)
* Microsoft Graph API (from the client and the server).
* Gmail API (from the client and the server).

This article describes how to configure QLM to send emails using the Gmail API. The Gmail API is the preferred option when you use a Gmail account for sending emails using multi-factor authentication (MFA).

QLM can send emails from the client side or the server. The required Gmail configuration depends on which process is sending the email. There are 2 general use cases to consider:

* Client-Side: Emails sent from within the QLM Management Console.
* Server-Side: Emails sent by the QLM Agent Service (scheduled tasks) or by the QLM License Server (QLM Customer site, QLM Portal, etc.).

If you need to use your Gmail account to send Server-Side emails, you need to create a Gmail Service Account.  If you just need to send emails from the client, a regular user account is sufficient.&#x20;

### Server-Side Configuration

#### How to create a Gmail Service Account

Creation of a Gmail Service account requires a Google Workspace (G Suite) account. Detailed instructions for creating a service account can be found [here](how-to-create-a-gmail-service-account.md).

#### QLM Management Console Configuration

To configure the QLM Management Console to send emails using the Gmail API, follow the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Options
* Go to the Gmail API tab
* Check the Use Gmail Service account option
* Click the Load Credentials file and select the JSON file generated when you created the Gmail Service account
* Enter the sender's email address
* Click Test to verify that all the settings are correct
* Click the ![](<../../../.gitbook/assets/image (27).png>)Apply these settings on the server button
* Click Ok

![mceclip0.png](https://support.soraco.co/hc/article_attachments/12909477519892)

To instruct the QLM License Server to use Gmail to send emails from the QLM Portal or the QLM Self Help, you must set the options/emailProvider server property to "Gmail API".

<figure><img src="../../../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>



If you use Scheduled Tasks, you must configure each scheduled task to use the Gmail API to send emails.

### Client-Side Configuration

#### How to create a Gmail OAuth Credentials

Instructions for creating Gmail OAuth credentials can be found [here](./#how-to-create-a-gmail-oauth-credentials).

#### QLM Management Console Configuration

To configure the QLM Management Console to send emails using the Gmail API, follow the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Options
* Go to the Gmail API tab
* Uncheck the Use Gmail Service account option
* Click Load Credentials file and select the JSON file generated when you created the Oauth credentials.
* Enter the sender's email address
* Click Test to verify that all the settings are correct
* Click Ok
