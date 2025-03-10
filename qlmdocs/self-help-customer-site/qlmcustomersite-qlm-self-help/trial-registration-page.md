# Trial Registration Page

### QlmRegistrationForm.aspx <a href="#h_01hdm5wzxvz1d9dgmr8r9rzh3c" id="h_01hdm5wzxvz1d9dgmr8r9rzh3c"></a>

QlmRegistrationForm.aspx is a registration form that collects user information, generates a trial key for a given product and emails it to the user.

Refer to this [article](https://support.soraco.co/hc/en-us/articles/211568803-How-to-hide-the-URL-arguments-of-the-QlmRegistrationForm-aspx-or-QlmRegistration-asmx-pages) for instructions to hide the URL arguments.

To have the QLM License Server send emails, you must have an SMTP server and configure QLM to use your SMTP Server. Refer to the "Configure the QLM License Server to send emails" section in this [article ](https://support.soraco.co/hc/en-us/articles/207894796-How-to-configure-QLM-to-send-mail-using-SMTP)for more details.

Example:

{% code overflow="wrap" %}
```
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistrationform.aspx?is_productid=1&is_majorversion=1&is_minorversion=0&is_expduration=10
```
{% endcode %}

|                                                               |                                                                                                                                                                                                                                                                                                                                   |                                  |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| **Argument**                                                  | **Description**                                                                                                                                                                                                                                                                                                                   | **Required**                     |
| is\_confirmationmessage                                       | The message that is displayed to the user upon successful registration. Variables are allowed                                                                                                                                                                                                                                     | No                               |
| is\_emailfrom                                                 | When sending an email, specify the email address of the sender                                                                                                                                                                                                                                                                    | No                               |
| is\_emailsubject                                              | Customize the subject of the email. Variables are allowed. See the supported variables below.                                                                                                                                                                                                                                     | Yes                              |
| is\_emailtemplate                                             | Name of the email template to use when sending an email to the customer. Email templates can be created from the QLM Management Console / Manage Keys / Email Templates                                                                                                                                                           | Yes                              |
| is\_emailtemplate\_failed                                     | <p>Name of the email template to use when sending an email to the customer, if registration fails. Email templates can be created from the QLM Management Console / Manage Keys / Email Templates.</p><p>A special variable called %ErrorMessage% can be used in the body of the email template to display the error message.</p> | No                               |
| is\_expdate                                                   | The date at which the license expires. The default date format is:yyyy-MM-dd. The format can be changed from the web.config file.                                                                                                                                                                                                 | No                               |
| is\_expduration                                               | Duration of the license, i.e. number of days after which the license will expire                                                                                                                                                                                                                                                  | No                               |
| is\_majorversion                                              | The major version of the product.                                                                                                                                                                                                                                                                                                 | Yes                              |
| is\_minorversion                                              | The minor version of the product.                                                                                                                                                                                                                                                                                                 | Yes                              |
| is\_productid                                                 | The ID of the product.                                                                                                                                                                                                                                                                                                            | Yes                              |
| is\_productname                                               | Name of the product.                                                                                                                                                                                                                                                                                                              | No                               |
| is\_sendmail                                                  | By default, an email will be sent to the customer with the content of the is\_emailtemplate. Set the is\_sendmail argument to false to instruct QLM to not send an email.                                                                                                                                                         | No                               |
| is\_trackReferrer                                             | When set to True, QLM tries to determine the referrer and sets the QLM User Group associated with the referrer. For more details, review the "Track Referrer" section below.                                                                                                                                                      | No                               |
| is\_userdata1                                                 | User Data to associate with the generated license                                                                                                                                                                                                                                                                                 | No                               |
| The following variables can be used in the appropriate fields | <p><br>%ActivationKey%<br>%FullName%<br>%Email%<br>%EmailFrom%<br>%ProductName%<br>%MajorVersion%<br>%MinorVersion%</p>                                                                                                                                                                                                           | fbc39bcdb73d41929e2020ccbe8c097d |

### Track Referrer

When the a trial registration form is referenced from Google Ads, Google Search or Microsoft Ads, QLM can automatically detect the origin of the request and set the User Group to the corresponding source.

To enable this functionality, you must:&#x20;

* Create the following [User Groups](../../fundamental-concepts/user-groups.md): Google\_Ads, Google\_Search, and Microsoft\_Ads
* Append the following argument to the URL of the Trial Registration Form: \&is\_trackReferrer=true

