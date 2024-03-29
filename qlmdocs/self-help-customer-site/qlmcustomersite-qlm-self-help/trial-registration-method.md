# Trial Registration Method

### QlmRegistration.asmx  <a href="#h_01hdm5wzxvd26qzx28grcvv5dk" id="h_01hdm5wzxvd26qzx28grcvv5dk"></a>

A web service page that takes user information from the command line, generates a trial key for a given product and emails it to the user.

Refer to this [article](https://support.soraco.co/hc/en-us/articles/211568803-How-to-hide-the-URL-arguments-of-the-QlmRegistrationForm-aspx-or-QlmRegistration-asmx-pages) for instructions to hide the URL arguments.

To have the QLM License Server send emails, you must have an SMTP server and configure QLM to use your SMTP Server. Refer to the "Configure the QLM License Server to send emails" section in this [article ](https://support.soraco.co/hc/en-us/articles/207894796-How-to-configure-QLM-to-send-mail-using-SMTP)for more details.

Example:

{% code overflow="wrap" %}
```
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is_productid=1&is_majorversion=1&is_minorversion=0&is_expduration=10
```
{% endcode %}

&#x20;Contact information can be sent as URL arguments or as part of the POST data. When integrating with a third party, the web.config thirdPartyRegistrationFields setting defines the mapping between the incoming fields and the QLM fields. To enable third-party integration such as MailChimp, you must set the useThirdPartyRegistrationFields setting to true in the web.config file.

When invoking the QlmRegistration.asmx directly from your own site, you can use the following arguments in the URL to specify the customer's contact information:

| **Argument** | **Description**                   |
| ------------ | --------------------------------- |
| is\_fullname | Full name of the customer.        |
| is\_email    | Email of the customer             |
| is\_phone    | Telephone number of the customer. |
| is\_company  | Company name of the customer.     |
| is\_country  | Country of the customer.          |

**Registration Form Rules**

In addition, you can set the following properties in the QlmCustomerSite's web.config file to control the behaviour of the registration request. Note that as of QLM v10, most of these properties can be set from the [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties) tab in the QLM Management Console.

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
