# QLM v11 GDPR Support

## Overview

General Data Protection Regulation ([GDPR](https://en.wikipedia.org/wiki/General\_Data\_Protection\_Regulation)) is a regulation in EU law on data protection and privacy for all individuals within the European Union. It takes effect on May 25 2018.

\-> [Read](https://soraco.co/products/qlm/QlmPrivacyPolicy.pdf) Soraco's GDPR compliant privacy policy.-> [View a video tutorial](https://www.screencast.com/t/JIFVSmFyjGdQ) of QLM's GDPR features.

QLM v11 provides the tools you need to request and track privacy policy consent from your customers. Here are the GDPR related changes in QLM v11:

* The QLM License Wizard includes a new Privacy Policy page that the user must consent to before activating a license or registering a user.
* The QLM Customer Site Trial Registration Form now requires the user to consent to a Privacy Policy before registering to download a trial.
* The QLM License Wizard and the QLM Trial Registration web page now include a field to specify the customer's country.
* New API method QlmLicense.UpdatePrivacyConsent.
* New HTTP method UpdatePrivacyConsentHttp
* 2 new fields were added to the Customers table: PrivacyPolicyConsent and PrivacyPolicyLastUpdate. These fields are automatically populated from the QLM License Wizard, from the QLM Trial Registration Form, from the QLM UpdatePrivacyPolicy and UpdatePrivacyPolicyHttp APIs.
* A sample email template was added to request Privacy Policy consent from your existing customers: PrivacyPolicy.Consent
* A sample email template was added to send customers an email containing the data that was collected about them: PrivacyPolicy.CollectedData
* An audit trail of changes to the Privacy Policy is now recorded in a new table in the DB (AuditTrail)

### Requesting consent from your current customers

GDPR requires that you contact all your current customers and request their consent to keep the personal information that you may have collected in the past.

QLM provides an email template that you can use to contact your customers and request consent.

First, in order to track which customers have not provided consent yet, you should create a custom search as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the "search" drop down and select "edit searches"
* Click Add to add a new search
* Set the Name to: Privacy Policy Consent Required
* Check Favorite
* Set the SQL statement to: (PrivacyConsent is NULL Or PrivacyConsent = 0)
* Click Ok
* Back to the QLM Management Console, click the new search we created
* All the customers that have not consented yet will be listed

Now, you can send emails to the customers that have not consented yet to your privacy policy.

* In the Manage Keys tab, click Email Templates
* Locate the email template called "PrivacyPolicy.Consent"
* Edit the email template, modify it to suit your needs and then save it
* Select all or a subset of the records returned when selecting the search created earlier
* Click Mail Send
* Select the "PrivacyPolicy.Consent" template and then click Send.&#x20;

To track which customers have provided consent, you can create a custom search as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the "search" drop down and select "edit searches"
* Click Add to add a new search
* Set the Name to: Privacy Policy Consent Given
* Check Favorite
* Set the SQL statement to: (PrivacyConsent = -1)
* Click Ok
* Back to the QLM Management Console, click the new search we created
* All the customers that have consented will be listed

### Consent request in your application

#### Requesting consent from the QLM License Wizard

For new customers, and if you are using the QLM License Wizard, you can enable the new Privacy Polciy page to enforce consent before users activate their license. To do so:

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* Select your product and license server
* Select your programming language
* On the Customize the Look & Feel page:
  * Click the QlmPrivacyPolicy property, then click the \[...] button to open up the Editor. Paste the contents of your Privacy Policy and click Save.
  * Click the QlmShowPrivacyPolicyPage and set the property to true.
  * Click Next
  * Save the settings and update your application with the newly generated files

#### Requesting consent when customers upgrade to a new version

For existing customers who are upgrading to a new version of your application, you can use the QLM License Wizard to request consent before launching your application.

The QLM License Wizard now includes a new command line argument that only displays the Privacy Policy consent form and requests consent from the user.&#x20;

To launch this special mode of the QLM License Wizard:

QlmLicenseWizard.exe /settings "\<your settings xml file>" /showprivacy

To determine if the user consented, you can check the exit code of the QLM License Wizard. An exit code of 12 indicates that the user did not consent.&#x20;

#### Requesting consent via the QLM API

If you are not using the QLM License Wizard, you can use the QLM API to set the privacy consent:

[QlmLicense.UpdatePrivacyConsent](../api-reference/qlmlicense/application-methods/updateprivacyconsent.md)

[UpdatePrivacyConsentHttp](../api-reference/qlmlicense/application-methods/updateprivacyconsent.md)

### Consent request for trials

When customers download a trial version of your application via the QLM Trial Registration Form, you need to prompt the user for consent prior to storing their contact information in QLM.

The new QLM Trial Registration Form includes a consent checkbox that is automatically enabled when you set your privacyPolicyUrl in the Server Properties.

To enable this feature:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Go to the Server Properties tab
* Locate the "customerSite" category
* Within that category, locate the privacyPolicyUrl property and set it to a URL that points to your online privacy policy
* Click Ok

The next time you launch the QLM trial registration form, a checkbox will be displayed requiring the user to consent to your privacy policy.

### Sending customers data collected about them

When customers request to be sent the data that was collected about them, you can use the provided email template "PrivacyPolicy.CollectedData" as a sample of the collected data.

First, you must update the email template to suit your requirements

* In the Manage Keys tab, click Email Templates
* Locate the email template called "PrivacyPolicy.CollectedData"
* Edit the email template, modify it to suit your needs and then save it
* On the Manage Keys tab, locate the record of the customer
* Click Mail Send
* Select the "PrivacyPolicy.CollectedData" template and then click Send.&#x20;

### Deleting customer data

If you receive a request from a customer to delete his/her data, follow the procedure below:

#### Delete Computer Identifiers from the Search History

* Launch the QLM Management Console
* Go to the Manage Keys tab
* In the search area:
  * Set the field to \<CommonFields>
  * Set the opeator to: like
  * Set the value to the customer's name or email address
  * Click the **search** dropdown and select **search history**
* For each matching record, click Delete.

#### Delete Computer Identifiers from the License Data

* Launch the QLM Management Console
* Go to the Manage Keys tab
* In the search area, enter the customer's name or email address and click search/search history
* For each matching record, click **Release** License. Release License will clear computer information from the license record such as the unique computer identifier, IP address, etc.
* If you have stored any customer specific data in the UserData / Comments field, click **Edit** and clear this data.

#### Delete Customer Information

* Launch the QLM Management Console
* Go to the Manage Customer tab
* In the search area:
  * Set the field to \<CommonFields>
  * Set the opeator to: like
  * Set the value to the customer's name or email address
  * click **search**
* Select all the matching records and click Delete
