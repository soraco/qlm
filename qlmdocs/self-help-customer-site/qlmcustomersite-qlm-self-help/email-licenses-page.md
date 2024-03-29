# Email Licenses Page

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
