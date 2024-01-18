# Sending emails using the Microsoft Graph API

Edition: QLM Pro (v17), Enterprise

Version: 15.0.21274.1

***

### Overview

QLM can now send emails using 3 different methods:

* Microsoft Outlook (from the client only)
* SMTP server (from the client and the server)
* Microsoft Graph API (from the client and the server).

This article describes how to configure QLM to send emails using the Microsoft Graph API (MGA). The MGA is the preferred option when you use Azure / Office 365 accounts for sending emails using multi-factor authentication (MFA).

### Azure Configuration

To allow an application such as QLM to send emails via MGA, you must create an App Registration in your Azure Portal as described below:

* Login to your Azure Portal
* Go to App Registrations
* Click New Registration
* Set the name to: QLM-Email (or any name of your choice)
* Set "Supported account types" to: Accounts in any organizational unit and personal Microsoft accounts
* Click Register
* Copy the value of the "Application (client) ID" and "Directory (tenant) ID" for later use
* In the left-hand panel, click "Certificates and Secrets"
* Click "New Client Secret"
* Set the Description to: QLM-Email
* Set an expiry period as needed
* Copy the value of the created secret immediately as it will not be visible later on.
* In the left-hand panel, click "API Permissions"
* Click Add Permission
* Locate and click "Microsoft Graph"
* Select "Application Permissions"
* In the search box, type: mail
* Expand the Mail section and select "Mail.Send" then click Add permissions
* In the Configured Permissions section, click "Grant admin consent for xxx"

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4407768960660)

### QLM Management Console Configuration

To configure the QLM Management Console to send emails using MGA, follow the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Options
* Go to the Microsoft Graph API tab
* Enter all the fields based on the values collected in the previous section
* Enter the sender's email address
* Click Test to verify that all the settings are correct
* Click Ok

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/4407763530644)

If you use Scheduled Tasks, you must configure each scheduled task to use the Microsoft Graph API to send emails.

### QLM License Server Configuration

To configure the QLM Customer Site and the QLM Portal to send emails using MGA, follow the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites
* Go to the Server Properties tab
* Locate the "microsoft graph api" section
* Enter all the fields based on the values collected in the previous section
* Enter the sender's email address
* Then in the "options" section, locate the emailProvider property and set its value to "Microsoft Graph API"
* Click Ok

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4407853380244)
