# MailChimp - Quick License Manager Integration with MailChimp

QLM's integration with MailChimp enables you to create a list/form in MailChimp and automatically generate trial license keys that are emailed to the end user upon registration.

The first version of QLM's integration with MailChimp uses WebHooks to interface with the QLM License Server. Note that this is available as of QLM 8.0.15263.2.

### &#x20;MailChimp Webhook Configuration

To configure MailChimp to integrate with QLM, you must create a webhook in MailChimp.

* Login to MailChimp
* Click Audience
* Click Manage Audience then select Settings
* Click Webhooks
* Click Create New Webhook
* Set the Webhook URL to (update the URL as well as the arguments to match your site and product)
  * https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_expduration=10
* In the type of updates, select: S**ubscribes**
* Select the following option as needed:
  * by a subscriber
  * by an account admin
  * via the API
* Click Save

### &#x20;Configure QLM to receive MailChimp requests

* In the web.config file of the QlmCustomerSite project, set the following:
  * useThirdPartyRegistrationFields: true
  * htmlFormat: true (assuming your email will be formatted as html)&#x20;
* To configure QLM to send an email with the license key, configure the SMTP server as follows:
  * From the QLM Management Console, go to the Manage Keys tab
  * Click Sites and select your profile
  * Go to the Server Properties tab
  * Expand the SMTP section and set all fields
  * Click Ok

### Create a MailChimp Campaign

With the configuration above completed, you can create your MailChimp campaign.

* Click Create Campaign
* Select Signup form
* Select the audience and click Begin
* Configure your form as required and save it.

Every time a user subscribes, the webhook created above will be invoked and trigger the creation of a license key.

For details about the qlmregistration.asmx web service, check this [article](https://support.soraco.co/hc/en-us/articles/205933400).
