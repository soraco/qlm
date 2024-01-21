# Mail

QLM provides a framework for sending emails to your customers.

### ![](<../../.gitbook/assets/image (15).png>)Send Emails

To send a personalized email to a set of customers:

* Perform a search that returns a set of data.
* Select the items that you want to send an email to or click on the Select All button.
* Click on the Mail/Send button.
* Select the Outlook profile to use.
* Select the email template to use.
* Select the E-mail account to use.
* The **To** field should already contain the email of the selected customers.
* The additional **To** field allows you to type additional email addresses. Note that if your email message uses variables, these variables will not be expanded when sending emails to the additional recipients.
* Enter the Subject of the email.
* Enter the body of the email.
* Click on the Send button.

\
To create a personalized message, you can use variables within the **Subject** and the **Body** of the message. Any of the visible columns in the License Management tab may be used as variables.\
For example, your message could read:\
\
`Hi %FullName%,`\
`Thank you for your recent purchase of %ProductName% %MajorVersion%.%MinorVersion%.`\
`Your license key is: %ActivationKey%.`\
`Regards,`\
`Tom`\


### ![](<../../.gitbook/assets/image (16).png>)Templates&#x20;

Templates allow you to create common email content that can be readily used when sending manual or automated emails to your customers. Automated emails can be configured from the Scheduled Tasks option.\


![](<../../.gitbook/assets/image (17).png>)Aggregated Emails



Typically, QLM sends an email to the customer associated with the license along with any other email you specify in the CC or BCC fields. In some cases, however, you may want to send an _internal_ email to yourself or someone within your company instead of the customer. To do so, you simply uncheck the "Send To Customer" check box. When sending an _internal_ email, rather than receiving one email for each affected record, you could configure QLM to send you an email that aggregates results from several records. This is accomplished by adding special tags in the email body to identify the repeatable section.\
There are two ways to configure an email to aggregate multiple records into a single email:

**Standard text format**

If your email is formatted as plain text, you can delimit the repeatable section with the following tags:

* \*\*\*qlm\_content\_start\*\*\*
* \*\*\*qlm\_content\_end\*\*\*

qlm\_content\_start identifies the beginning of the repeatable section whereas qlm\_content\_end identifies the end of the repeatable section.

**Table format**

If your email is formatted as plain text with a repeatable section formatted as an HTML table, you can delimit the repeatable section with the following tags:

* \*\*\*qlm\_table\*\*\*

qlm\_table identifies the beginning of the repeatable section. Your table must start right after this tab. There is no need to specify a tag to delimit the end.
