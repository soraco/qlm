# How to generate a trial key from your web site

## **QLM Customer Site**

The QLM Customer site is a collection of web pages that you can integrate to your site to automate some processes and provide self-help to your customers.

QlmRegistrationForm.aspx is a registration form that collects user information and generates a trial key for a given product.

QlmRegistration.asmx is a service that can automatically generate a trial key and email it to the customer without presenting a form. This is useful when you already have a form to capture contact information and you just need to create a trial key.

The QLM Customer Site is deployed alongside the QLM License Server in the QlmCustomerSite folder. If you deploy the QLM Web Service manually, you must deploy the QlmCustomerSite (in the DeployToServer folder) and configure the QlmCustomerSite as an IIS Application.

### QlmRegistrationForm.aspx supported arguments

| **ARGUMENT**            | **DESCRIPTION**                                                                                                                                                                                    | **Type** |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| is\_affiliateid         | ID of the affiliate associated with the license/customer.                                                                                                                                          | Optional |
| is\_bccemail            | Semi comma-separated list of email recipients to bcc.                                                                                                                                              | Optional |
| is\_ccemail             | Semi comma-separated list of email recipients to cc.                                                                                                                                               | Optional |
| is\_confirmationmessage | The message that is displayed to the user upon successful registration. Variables are allowed.                                                                                                     | Optional |
| **is\_emailfrom**       | When sending an email, specify the email address of the sender.                                                                                                                                    | Required |
| **is\_emailsubject**    | Customize the subject of the email. Variables are allowed. Variables are allowed.                                                                                                                  | Required |
| **is\_emailtemplate**   | Name of the email template to use when sending an email to the customer. Email templates can be created from the QLM Management Console / Manage Keys / Email Templates.                           | Required |
| is\_expdate             | Date at which the license expires. The default date format is:yyyy-MM-dd. The format can be changed from the web.config file.                                                                      | Optional |
| is\_expduration         | Duration of the license, i.e. number of days after which the license will expire.                                                                                                                  | Optional |
| is\_features            | Semi comma-separated list of feature sets and their corresponding values. For more details, [click here.](https://support.soraco.co/hc/en-us/articles/204160380-What-is-the-syntax-of-is-features) | Optional |
| is\_floating            | The number of floating seats per license.                                                                                                                                                          | Optional |
| is\_language            | For the language to a specified locale. Example: \&is\_language=fr                                                                                                                                 | Optional |
| is\_licensemodel        |  trial \| subscription \| permanent.                                                                                                                                                               | Optional |
| **is\_majorversion**    | The major version of the product.                                                                                                                                                                  | Required |
| is\_maintplan           | Enable the maintenance plan for the license. The value should be: true \| false.                                                                                                                   | Optional |
| **is\_minorversion**    | The minor version of the product.                                                                                                                                                                  | Required |
| is\_productname         | Name of the product.                                                                                                                                                                               | Optional |
| **is\_productid**       | ID of the product.                                                                                                                                                                                 | Required |
| is\_quantity            | The number of activations per license.                                                                                                                                                             | Optional |
| is\_userData1           |  Any data that you want to associate to the license.                                                                                                                                               | Optional |

&#x20; \
**Example**: &#x20;

https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistrationform.aspx?is\_productname=My Product\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_expduration=10\&is\_emailfrom=support@soraco.co\&is\_emailsubject=Your Download of %ProductName%\&is\_confirmationmessage=Your License information was emailed to: %Email%\&is\_emailtemplate=MyEmailTemplate

### QlmRegistration.asmx supported arguments

| **ARGUMENT**            | **DESCRIPTION**                                                                                                                                                                                    | **Type** |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| is\_affiliateid         | ID of the affiliate associated with the license/customer.                                                                                                                                          | Optional |
| is\_bccemail            | Semi comma-separated list of email recipients to bcc.                                                                                                                                              | Optional |
| is\_ccemail             | Semi comma-separated list of email recipients to cc.                                                                                                                                               | Optional |
| is\_company             | Company of the customer.                                                                                                                                                                           | Optional |
| is\_confirmationmessage | The message that is displayed to the user upon successful registration. Variables are allowed.                                                                                                     | Optional |
| is\_country             | Country                                                                                                                                                                                            | Optional |
| **is\_email**           | Email of the customer.                                                                                                                                                                             | Required |
| **is\_emailfrom**       | When sending an email, specify the email address of the sender.                                                                                                                                    | Required |
| **is\_emailsubject**    | Customize the subject of the email. Variables are allowed. Variables are allowed.                                                                                                                  | Required |
| **is\_emailtemplate**   | Name of the email template to use when sending an email to the customer. Email templates can be created from the QLM Management Console / Manage Keys / Email Templates.                           | Required |
| is\_expdate             | Date at which the license expires. The default date format is:yyyy-MM-dd. The format can be changed from the web.config file.                                                                      | Optional |
| is\_expduration         | Duration of the license, i.e. number of days after which the license will expire.                                                                                                                  | Optional |
| is\_features            | Semi comma-separated list of feature sets and their corresponding values. For more details, [click here.](https://support.soraco.co/hc/en-us/articles/204160380-What-is-the-syntax-of-is-features) | Optional |
| is\_floating            | The number of floating seats per license.                                                                                                                                                          | Optional |
| is\_fullname            | Full Name of the customer.                                                                                                                                                                         | Optional |
| is\_licensemodel        |  trial \| subscription \| permanent.                                                                                                                                                               | Optional |
| **is\_majorversion**    | The major version of the product.                                                                                                                                                                  | Required |
| is\_maintplan           | Enable the maintenance plan for the license. The value should be: true \| false.                                                                                                                   | Optional |
| **is\_minorversion**    | The minor version of the product.                                                                                                                                                                  | Required |
| is\_phone               | Mobile Phone of the customer.                                                                                                                                                                      | Optional |
| is\_productname         | Name of the product.                                                                                                                                                                               | Optional |
| **is\_productid**       | ID of the product.                                                                                                                                                                                 | Required |
| is\_quantity            | The number of activations per license.                                                                                                                                                             | Optional |
| is\_subscribeemail      | Enables the Include In Mail List flag.                                                                                                                                                             | Optional |
| is\_userData1           |  Any data that you want to associate with the license.                                                                                                                                             | Optional |

#### Example 1:&#x20;

```
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is_productname=My Product&is_productid=1&is_majorversion=1&is_minorversion=0&is_expduration=10&is_emailfrom=support@soraco.co&is_emailsubject=Your Download of %ProductName%&is_confirmationmessage=Your License information was emailed to: %Email%&is_fullname=Tom Brad&is_email=tom.brad@soraco.co&is_company=Soraco&is_phone=123-123-1234&is_emailtemplate=MyEmailTemplate 
```

The following Variables can be used in the appropriate fields:&#x20;

&#x20;  %ActivationKey%\
&#x20;  %FullName%\
&#x20;  %Email%\
&#x20;  %EmailFrom%\
&#x20;  %ProductName%\
&#x20;  %MajorVersion%\
&#x20;  %MinorVersion%\
\


To simplify the management of these arguments, we recommend using the **is\_args** argument as described in this [article](https://support.soraco.co/hc/en-us/articles/211568803-How-to-hide-the-URL-arguments-of-the-QlmRegistrationForm-aspx-or-QlmRegistration-asmx-pages). Note that is\_args can be used for non-customer specific data such as the product id, major version, minor version, email template, etc. Customer-specific data such as full name, email, company and phone must be passed as URL arguments.

#### Example 2 (using is\_args):

```
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is_args=demo_order&is_fullname=Tom Brad&is_email=tom.brad@soraco.co&is_company=Soraco&is_phone=123-123-1234
```

### Email Configuration

&#x20;To configure QLM to send an email with the license key, configure the SMTP server as follows:

* From the QLM Management Console, go to the Manage Keys tab
* Click Sites and select your profile
* Go to the Server Properties tab
* Expand the SMTP section and set all fields
* Click Ok

The following settings can only be set by modifying the web.config file:

* bannedEmailProviders
* genericEmailProviders
* showSubscribeToMailListCheckbox

### Configuration using Server Properties

You can customize the behavior and some UI elements of the QLM Customer Site by setting [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563#CustomerSite).

![](https://support.soraco.co/hc/article\_attachments/18847559085844)
