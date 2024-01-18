# External Email Templates

Email templates are typically created in the QLM Management Console's Email Template Editor.&#x20;

QLM's HTML editor is actually an RTF editor that converts the RTF content to HTML. It has limitations and sometimes quirks that may prove hard to manage.

As of QLM v14, you can import external HTML Email Templates into QLM and then use these email templates to send email to your customers.

### Import External Email Templates

In order to import your own HTML email template, you must first instruct QLM that the email template is external and should not be modified by QLM. To do so, you must add the following meta tags in the \<head> section of your email template:

```
<meta name="qlm-readonly" value="true"/> 
<meta name="qlm-modifiedDate" value="2020-04-06 08:25:21">
```

You should update the qlm-modifiedDate field every time you udpate the email template to ensure it is not overwritten by another user.

The next step is to import the email template into QLM:

* Launch QLM
* Go to the Manage Keys tab
* Click Templates
* Verify that the **Show Read Only Templates** checkbox is checked
* Click Import
* Select your email template
* Click Ok

### Using External Email Templates

You use an external email template the same way you use regular email templates. The only limitation is that external email templates cannot be edited.

If you try to edit an email template in QLM, you will receive a warning that the email is read-only (assuming you set the qlm-readonly meta tab) and that you should use an external email editor to update it. You can configure the editor to use by setting the "External HTML Editor" as shown below.

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360055820992/mceclip1.png)

Additionally, please beware that your email template may not render properly in the QLM Template Editor as the template editor converts the HTML email to RTF for rendering. This will not impact the actual email that is sent to your customer.

When email templates are modified, they are automatically uploaded to the License Server. Every time you access the Email Templates Editor, Email templates are automatically downloaded from the License Server. By default, QLM assumes that the server has the latest version of the email templates.

To prevent QLM from overwriting local changes that you may have applied to an email template, you should configure QLM to not automatically overwrite email templates by unchecking the "Overwrite email templates" setting.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360055820592/mceclip0.png)
