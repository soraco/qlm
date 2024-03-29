# Trial Registration Page

### QlmRegistrationForm.aspx and QlmRegistration.asmx <a href="#h_01hdm5wzxvz1d9dgmr8r9rzh3c" id="h_01hdm5wzxvz1d9dgmr8r9rzh3c"></a>

**QlmRegistrationForm.aspx** - A registration form that collects user information, generates a trial key for a given product and emails it to the user.

**QlmRegistration.asmx** - A web service page that takes user information from the command line, generates a trial key for a given product and emails it to the user.

Refer to this [article](https://support.soraco.co/hc/en-us/articles/211568803-How-to-hide-the-URL-arguments-of-the-QlmRegistrationForm-aspx-or-QlmRegistration-asmx-pages) for instructions to hide the URL arguments.

To have the QLM License Server send emails, you must have an SMTP server and configure QLM to use your SMTP Server. Refer to the "Configure the QLM License Server to send emails" section in this [article ](https://support.soraco.co/hc/en-us/articles/207894796-How-to-configure-QLM-to-send-mail-using-SMTP)for more details.

Example 1:

```
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistrationform.aspx?is_productid=1&is_majorversion=1&is_minorversion=0&is_expduration=10
```

Example 2:

```
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is_productid=1&is_majorversion=1&is_minorversion=0&is_expduration=10
```

&#x20;

| **Argument**                                                  | **Description**                                                                                                                                                                                                                                                                                                                    | **Required**                     |
| ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
|                                                               |                                                                                                                                                                                                                                                                                                                                    |                                  |
| is\_productname                                               | Name of the product.                                                                                                                                                                                                                                                                                                               | No                               |
| is\_productid                                                 | The ID of the product.                                                                                                                                                                                                                                                                                                             | Yes                              |
| is\_majorversion                                              | The major version of the product.                                                                                                                                                                                                                                                                                                  | Yes                              |
| is\_minorversion                                              | The minor version of the product.                                                                                                                                                                                                                                                                                                  | Yes                              |
| is\_expduration                                               | Duration of the license, i.e. number of days after which the license will expire                                                                                                                                                                                                                                                   | No                               |
| is\_expdate                                                   | The date at which the license expires. The default date format is:yyyy-MM-dd. The format can be changed from the web.config file.                                                                                                                                                                                                  | No                               |
| is\_sendmail                                                  | By default, an email will be sent to the customer with the content of the is\_emailtemplate. Set the is\_sendmail argument to false to instruct QLM to not send an email.                                                                                                                                                          | No                               |
| is\_emailfrom                                                 | When sending an email, specify the email address of the sender                                                                                                                                                                                                                                                                     | No                               |
| is\_emailsubject                                              | Customize the subject of the email. Variables are allowed. See the supported variables below.                                                                                                                                                                                                                                      | Yes                              |
| is\_confirmationmessage                                       | The message that is displayed to the user upon successful registration. Variables are allowed                                                                                                                                                                                                                                      | No                               |
|  is\_emailtemplate                                            | Name of the email template to use when sending an email to the customer. Email templates can be created from the QLM Management Console / Manage Keys / Email Templates                                                                                                                                                            | Yes                              |
| is\_emailtemplate\_failed                                     | <p>Name of the email template to use when sending an email to the customer, if registration fails.  Email templates can be created from the QLM Management Console / Manage Keys / Email Templates.</p><p>A special variable called %ErrorMessage% can be used in the body of the email template to display the error message.</p> | No                               |
| is\_userdata1                                                 | User Data to associate with the generated license                                                                                                                                                                                                                                                                                  | No                               |
| The following variables can be used in the appropriate fields | <p><br>%ActivationKey%<br>%FullName%<br>%Email%<br>%EmailFrom%<br>%ProductName%<br>%MajorVersion%<br>%MinorVersion%</p>                                                                                                                                                                                                            | fbc39bcdb73d41929e2020ccbe8c097d |

&#x20;