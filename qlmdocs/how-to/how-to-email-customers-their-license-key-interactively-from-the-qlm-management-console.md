# How to email customers their license key interactively from the QLM Management Console

You can use the QLM Management Console to email your customer any information related to their license key. QLM supports sending emails via Outlook or via an SMTP server. To configure the SMTP server, go to the Manage Keys tab, click Options then select the SMTP server tab.

To send an email to one or several customers:

* Go to the Manage Keys tab
* Click the Mail / Templates button
* Select an existing template or click New to create a new template
* Write the content of your emai. In the email subject and body, you can use variables such as %ActivationKey%, %ComputerKey%, %FullName%, etc. Any column in the grid view can be used as a variable.
* Save your template
* In the grid, locate the customers that you want to send an email to and select all the relevant rows.
* Click the Mail / Send button
* Select the template you just created
* Select the Email Profile and Account to send the email via Outlook or SMTP
* The recipient should already be populated. You can add additional recipients and bcc.
* Modify the subject field and the body if needed.
* Click Send
