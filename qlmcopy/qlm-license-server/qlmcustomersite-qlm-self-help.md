# QlmCustomerSite (QLM Self Help)

The QlmCustomerSite portal (QLM Self Help) offers several web pages that you may want to expose to your customers:

* [QlmWebActivation.aspx](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-QLM-Self-Help-#qlmwebactivation.aspx)
* [QlmReleaseLicense.aspx](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-QLM-Self-Help-#qlmreleaselicense.aspx)
* [QlmRegistrationForm.aspx and QlmRegistration.asmx](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-QLM-Self-Help-#qlmregistrationform.aspx)
* [QlmLicenseInfo.aspx](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-QLM-Self-Help-#qlmlicenseinfo.aspx)
* [QlmEmailLicense.aspx](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-QLM-Self-Help-#qlmemaillicense.aspx)

Instructions on how to install the QlmCustomerSite, can be found [here](https://support.soraco.co/hc/en-us/articles/202932304-QlmCustomerSite-QLM-Self-Help-#installation).&#x20;

***

### QlmWebActivation.aspx <a href="#h_01hdm5wzxvf2md75hcefx65wp3" id="h_01hdm5wzxvf2md75hcefx65wp3"></a>

**QlmWebActivation.aspx** is a web page that allows a user to enter an activation key and a computer ID for the purpose of generating a Computer Key. This is useful when a customer's system does not have an internet connection and they would like to perform an offline activation. The customer would:

* Go to a computer that has internet access
* Enter the Activation Key and ComputerID
* Receive a Computer Key
* Go to the computer that does not have internet access
* Paste the Computer Key in the "Manual Activation" / Computer Key field
* Click Activate

| **Argument** | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| is\_avkey    | Activation Key of the end-user                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| is\_pcid     | Computer ID of the end-user. This argument is optional if the license is a single activation license key.                                                                                                                                                                                                                                                                                                                                                        |
| is\_pp       | <p>Set is_pp to 1 to have this page generate a digitally signed Product Properties file. When generating a Product Properties file, you can customize the following settings in the web.config file of QlmCustomerSite:</p><ul><li>productPropertiesFileName: the name of the generated Product Properties file.</li></ul><p>Note: this option is available as of QLM 11.0.18147.1</p>                                                                           |
| is\_file     | <p>Set is_file to 1 to have this page generate a digitally signed license file (for QLM Enterprise users building cross-platform apps). When generating a license file, you can customize the following settings in the web.config file of QlmCustomerSite:</p><ul><li>offlineActivationSuccessMessage: the message that is displayed upon successful generation of the license file.</li><li>licenseFileName: the name of the generated license file.</li></ul> |

&#x20;

Example of generating a computer key:

https://qlm3.net/qlmdemo/qlmcustomersite/QlmWebActivation.aspx?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123

Example of generating a digitally signed Product Properties file:

https://qlm3.net/qlmdemo/qlmcustomersite/QlmWebActivation.aspx?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123\&is\_pp=1

Example of generating a digitally signed license file (cross-platform apps):

https://qlm3.net/qlmdemo/qlmcustomersite/QlmWebActivation.aspx?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123\&is\_file=1

***

### QlmReleaseLicense.aspx <a href="#h_01hdm5wzxv8q8mxzw1y5w2xffp" id="h_01hdm5wzxv8q8mxzw1y5w2xffp"></a>

**QlmReleaseLicense.aspx** is a web page that your users can fill out to deactivate a license from a given computer. You can launch this page with or without any arguments. If you provide arguments, the corresponding fields in the form will auto-populate with the provided values.

If you enable the [Server Property](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties) showDeactivationVerificationCode, a customer will need to enter a Deactivation Verification Code (DVC) to deactivate a license. If you are using the QLM License Wizard, the wizard will display the DVC when an offline user tries to deactivate a license. You can also use [CreateDeactivationCode](https://support.soraco.co/hc/en-us/articles/360031442411-QlmLicense-CreateDeactivationCode) API to create a DVC.

The

| **Argument**  | **Description**                                                                                           |
| ------------- | --------------------------------------------------------------------------------------------------------- |
|               |                                                                                                           |
| is\_avkey     | Activation Key of the end-user                                                                            |
| is\_pcid      | Computer ID of the end-user. This argument is optional if the license is a single activation license key. |
| is\_deactcode | Deactivation verification code generated by the client.                                                   |

&#x20;

Example:&#x20;

https://qlm3.net/qlmdemo/qlmcustomersite/ QlmReleaseLicense.aspx ?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123

***

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

### QlmRegistration.asmx - Contact Information  <a href="#h_01hdm5wzxvd26qzx28grcvv5dk" id="h_01hdm5wzxvd26qzx28grcvv5dk"></a>

Contact information can be sent as URL arguments or as part of the POST data. When integrating with a third party, the web.config thirdPartyRegistrationFields setting defines the mapping between the incoming fields and the QLM fields. To enable third-party integration such as MailChimp, you must set the useThirdPartyRegistrationFields setting to true in the web.config file.

When invoking the QlmRegistration.asmx directly from your own site, you can use the following arguments in the URL to specify the customer's contact information:

| **Argument** | **Description**                   |
| ------------ | --------------------------------- |
| is\_fullname | Full name of the customer.        |
| is\_email    | Email of the customer             |
| is\_phone    | Telephone number of the customer. |
| is\_company  | Company name of the customer.     |
| is\_country  | Country of the customer.          |

**Registration Form Rules**

In addition, you can set the following properties in the QlmCustomerSite's web.config file to control the behavior of the registration request. Note that as of QLM v10, most of these properties can be set from the [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties) tab in the QLM Management Console.

| **Setting**                                 | **Description**                                                                                                                                                                                                                                                                                                                                           |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| isPhoneRequired                             | Determines if the phone field is mandatory.                                                                                                                                                                                                                                                                                                               |
| isFullNameRequired                          | Determines if the full name field is mandatory.                                                                                                                                                                                                                                                                                                           |
| isEmailRequired                             | Determines if the email field is mandatory.                                                                                                                                                                                                                                                                                                               |
| isCompanyRequired                           | Determines if the company field is mandatory.                                                                                                                                                                                                                                                                                                             |
| genericEmailProviders                       | List of generic email providers. QLM identifies if 2 requests are associated to the same company by looking at the email address. However, when an email address is generic such as gmail.com, QLM cannot determine if the requests are related. If a an email address matches one of the generic providers in this list, QLM does not block the request. |
| maxRegistrationsPerUser                     | The maximum number of registrations allowed per user (email). The default is 1.                                                                                                                                                                                                                                                                           |
| preventRegistrationsIfCustomer              | Prevent a user from requesting a trial license key if another user from the same domain has already purchased this product. This property works in conjunction with the genericEmailProviders property that allows you to configure generic email providers such as gmail.com and hotmail.com.                                                            |
| preventMultipleRegistrationsPerDomain       | Prevent a user from requesting a trial license key if another user from the same domain has already requested a trial. This property works in conjunction with the genericEmailProviders property that allows you to configure generic email providers such as gmail.com and hotmail.com.                                                                 |
| preventMultipleRegistrationsPerMajorVersion | Prevent a user from requesting multiple license keys for the same product major version. The default value is True.                                                                                                                                                                                                                                       |
| preventMultipleRegistrationsPerMinorVersion | Prevent a user from requesting multiple license keys for the same product minor version. The default value is True.                                                                                                                                                                                                                                       |
| preventMultipleRegistrationsPerProduct      | Prevent a user from requesting multiple license keys for the same product. The default value is True.                                                                                                                                                                                                                                                     |
| thirdPartyRegistrationFields                | See [MailChimp ](https://support.soraco.co/hc/en-us/articles/206203030-Quick-License-Manager-Integration-with-MailChimp)Integration.                                                                                                                                                                                                                      |

***

### QlmLicenseInfo.aspx <a href="#h_01hdm5wzxwd4p1cxmvavnt0jqm" id="h_01hdm5wzxwd4p1cxmvavnt0jqm"></a>

**QlmLicenseInfo.aspx** is a web page that displays information about the customer's activated licenses. The page supports the following arguments:

* is\_avkey: Activation Key of the customer. This argument is mandatory.
* is\_pcid:  Computer ID of the customer. This argument is mandatory.
* is\_pckey: Computer Key of the customer. This argument is optional but recommended.

Example: https://qlm3.net/qlmdemo/qlmcustomersite/qlmlicenseinfo.aspx?is\_avkey=AZKZ0R0F00GHJ4B7832D1C1SPXAAA9\&is\_pcid=ABC

&#x20;

| **Argument** | **Description**                                                                                           |
| ------------ | --------------------------------------------------------------------------------------------------------- |
|              |                                                                                                           |
| is\_avkey    | Activation Key of the end-user                                                                            |
| is\_pcid     | Computer ID of the end-user. This argument is optional if the license is a single activation license key. |

### QlmEmailLicense.aspx <a href="#h_01hdm5wzxwjx9013g6kdbfmd80" id="h_01hdm5wzxwjx9013g6kdbfmd80"></a>

**QlmEmailLicense.aspx** is a web page that allows a user to enter their email address to receive an email with all license keys registered to that email address. This is useful for customers who forget their license keys. The page supports the following optional argument:

* is\_email: Email address (optional)

Example: [https://qlm3.net/qlmdemo/qlmcustomersite/QlmEmailLicense.aspx?is\_email=tom@tom.com](https://qlm3.net/qlmdemo/qlmcustomersite/QlmEmailLicense.aspx?is\_email=tom@tom.com)

The content of the email that is sent to the customer is configurable by setting the [Server Property ](https://support.soraco.co/hc/en-us/articles/207920563)customerSite/emailTemplateRequestKeys.&#x20;

Additionally, the QLM License Server must be configured with an SMTP Server as described in this article: [How to configure the QLM to send emails from the server](https://support.soraco.co/hc/en-us/articles/213887163)

| **Argument** | **Description**                             |
| ------------ | ------------------------------------------- |
| is\_email    | The email address of a registered customer  |

&#x20;

Additionally, the QlmEmailLicense.aspx page makes use of Google's reCAPTCHA service. This is highly recommended to avoid spam and abuse.

In order to use Google's reCAPTCHA service, you must register your site with Google. You can find detailed instructions on [Google's site](https://developers.google.com/recaptcha/docs/display).

Once you have registered with Google and received your API key pair (Site Key and Secret Key), you must enter these keys in the QlmEmailLicense.aspx file as follows:

* Open QlmEmailLicense.aspx with a text editor of your choice
* Locate the PublicKey and PrivateKey entries
* Set the PublicKey to your Site Key
* Set the PrivateKey to your Secret Key
* Save the file
* Open the web.config file of the QlmCustomerSite web application
* Locate the enableCaptcha setting and set the value to True.

If you do not wish to use Google reCAPTCHA:

* Open the QlmEmailLicense.aspx file with a text editor of your choice
* Locate the \<!-- Google reCAPTCHA -- START --> comment
* Delete or comment out all the code until the \<!-- Google reCAPTCHA -- END --> comment
* Save the file
* Open the web.config file of the QlmCustomerSite web application
* Locate the enableCaptcha setting and set the value to False.

### How to install QlmCustomerSite <a href="#h_01hdm5wzxw7wr70b6bgfe1m27d" id="h_01hdm5wzxw7wr70b6bgfe1m27d"></a>

In order to configure QlmCustomerSite, you need to deploy the QlmCustomerSitefiles to the same server where the QLM License Server is installed.

If you have installed the QLM License Server by using our setup program, you have already installed the QlmCustomerSitefiles.

If you have deployed the QLM License Server manually, copy the QlmCustomerSite folder from C:\Users\Public\Documents\Quick License Manager\DeployToServer\QlmCustomerSite to your server and configure the QlmCustomerSite folder as an IIS Application that uses the same Application Pool as the QLM License Server.

Once deployed, you must update a few settings in the web.config file of QlmCustomerSite, namely:

\<!-- Update these settings with your own values -->

\<connectionStrings>

\<add name="QlmSvcLib.Properties.Settings.qlmConnectionString"\
connectionString="Provider=sqloledb;Data Source=localhost;Initial Catalog=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
providerName="System.Data.OleDb" />

\<add name="QlmCustomerSite.Properties.Settings.qlmConnectionString"\
connectionString="Provider=sqloledb;Data Source=localhost;Initial Catalog=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
providerName="System.Data.OleDb" />

\
\</connectionStrings>



<-- Update the application settings below with your own values -->

\<setting name="sqlSyntax" serializeAs="String">\<value>sql\</value> \</setting>

\<setting name="webServiceUrl" serializeAs="String">\<value>https://qlm3.net/qlmdemo/QlmLicenseServer/qlmservice.asmx\</value> \</setting>

\<setting name="communicationEncryptionKey" serializeAs="String">\<value>{B6163D99-F46A-4580-BB42-BF276A507A14}\</value> \</setting>

\<setting name="adminEncryptionKey" serializeAs="String"> \<value>{C6163D99-F46A-4580-BB42-BF276A507A14}\</value>\</setting>
