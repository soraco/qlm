# Jotform Integration

### Overview

Through QLM's JotForm integration, you can build a user registration form in JotForm and connect the form to QLM such that whenever a user registers, a trial license is automatically created and sent to the customer by email.

### Create and configure JotForm form

In JotForm, create a form with the following elements:

* First Name (optional)
* Last Name (optional)
* Email (required)
* Company (optional)
* Phone (optional)
* Country (optional)

Go to the Settings of the form above and select Integrations:

* Click Thank you page
* Select "Redirect to an external link after submission"
* Set the following URL (update the URL to point to your site): [https://qlm3.net/qlmdemo/qlmcustomersite/qlmregistration.asmx/Register?is\_args=jotform\_args](https://qlm3.net/qlmdemo/qlmcustomersite/qlmregistration.asmx/Register?is\_args=jotform\_args)

### QLM Configuration

#### Field mappings

To map the JotForm fields to QLM:

* In JotForm, edit your form and click the BUILD tab
* Select the first field in your form
* In the properties panel, click the Advanced tab and expand Field Details
* Note the Unique Name value of this field and record it to be used later in the process
* Repeat the steps above for all the fields on the form
* Note that if a field is a combination of 2 values such as First Name and Last Name, the Unique Name value should be suffixed with \[]. Example: fullName\[]

To map the JotForm fields to QLM fields:

* On your License Server, locate the QlmCustomerSite folder&#x20;
* Open the web.config file with any text editor
* Set the useThirdPartyRegistrationFields property to True
* In the thirdPartyRegistrationFields section, set the field names captured in the previous section to the JotForm names in exactly the following order: Email, FirstName, LastName, Phone, Company

#### Arguments Definition&#x20;

In the QLM Management Console:

* Go to the Manage Keys tab and click Sites
* Go to the Server Properties tab
* Create a new custom server property by clicking the + sign in the right hand panel
* Set the name of the new property to: jotform\_args
* Set the value of the new property to (update the values as needed): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_licensemodel=trial\&is\_emailtemplate=Customer.TrialRequest
* Click Ok

Back to Jotform, open your form in a browser and register a user. Once registration is completed, a new license key will be created and emailed to the customer.

#### Customize the Response

To customize the response printed in the browser, you must:

* Create an HTML fragment with the content that you wish to display. The HTML content can include a variable called %QlmResponse% which will be replaced by the QLM result of the trial request.
* Encode your HTML fragment
  * To encode your html in the web.config file, use an online encoder such as [FreeFormatter.com:](https://www.freeformatter.com/xml-escape.html)
  * Place your HTML content on a single line
  * Use FreeFormatter to escape your HTML content so that it can be placed in the web.config
* Update the QlmCustomerSite.Properties.Settings section in the QlmCustomerSite web.config file by adding a new setting called "registrationCustomResponse" as shown below:

```
<setting name="registrationCustomResponse" serializeAs="String">
<value>&lt;html&gt;&lt;head&gt;&lt;meta http-equiv=&quot;refresh&quot; content=&quot;2; URL=https://soraco.co&quot; /&gt;&lt;/head&gt;&lt;script&gt;&lt;!-- window.location = &quot;https://apple.com&quot;; --&gt;&lt;/script&gt;&lt;body&gt;Thank you for registering. %QlmResponse%&lt;/body&gt;&lt;/html&gt;</value>
</setting> 
```
