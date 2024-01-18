# Gravity Forms Integration

### Overview

Through QLM's Gravity Forms integration, you can build a user registration form in Gravity Forms and connect the form to QLM such that whenever a user registers, a trial license is automatically created and sent to the customer by email.

### Create and configure Gravity Forms form

In Gravity Forms, create a form with the following elements:

* First Name (optional)
* Last Name (optional)
* Email (required)
* Company (optional)
* Phone (optional)
* Country (optional)

Go to the Settings of the form above, select Webhooks and click Add New:

* Specify a name, e.g. “QLM Feed”
* Set the following Request URL (update the URL to point to your site): [https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is\_args=gravityform\_args](https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is\_args=gravityform\_args)
* Request Method: Post
* Request Format: Form
* Request Body: map the following keys to their corresponding values in your form
  * Required:
    * is\_email
  * Optional:
    * is\_fullname
    * is\_company
* Save Settings

![gravityformsQLM.png](https://support.soraco.co/hc/article\_attachments/360097285692/gravityformsQLM.png)

### QLM Configuration

#### Arguments Definition&#x20;

In the QLM Management Console:

* Go to the Manage Keys tab and click Sites
* Go to the Server Properties tab
* Create a new custom server property by clicking the + sign in the right hand panel
* Set the name of the new property to: gravityform\_args
* Set the value of the new property to (update the values as needed): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_licensemodel=trial\&is\_emailtemplate=Customer.TrialRequest
* Click Ok

Back to Gravity Forms, open your form in a browser and register a user. Once registration is completed, a new license key will be created and emailed to the customer.
