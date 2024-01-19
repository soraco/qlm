# Creating Trial Keys from the QLM License Wizard

There are 2 ways to generate trial keys from the QLM License Wizard:

1. After the user enters his/her contact information, generate a trial key and activate it automatically.
2. After the user enters his/her contact information, send an email to the user with the trial key. The benefit of this approach is that you ensure that the email address entered by the user is a valid email.

Additionally, the QLM Licence Wizard includes a **Try** button that can be used in 2 ways (as of QLM v12.0.19133.3)

1. The default behaviour of the **Try** button is to simply close the wizard and allow the user to evaluate the application. In this model, the Try button will only be visible after the user activates a trial key.
2. The second behaviour is to use the **Try** button to generate a trial key. In this model, the Try button is visible before a key is entered if the QlmTryButtonVisibility property is set to Always. When the user clicks the Try button, he/she is redirected to the User Registration page. Once the user registers, a license key is generated as specified by the QlmEmailTrialKeyAfterUserRegistration and the QlmGenerateTrialKeyAfterUserRegistration properties. To enable this behaviour, set the QlmUseTryButtonToCreateTrialKey setting to true.

Note that the Try button will not be visible if a key is already activated unless the QlmAllowMultipleTrialKeyRequests is set to true.

### Generate a trial key without confirmation

1\. To generate a trial key and activate it automatically after the user enters his contact information, configure the following properties in the "Protect Your Application" wizard (3rd tab in the QLM Management Console):

* **1. GUI Properties**
  * QlmUserRegistrationPageVisiblity: TryButton
* **2. User Registration**
  * QlmEmailTrialKeyAfterUserRegistration: false
  * QlmGenerateTrialKeyAfterUserRegistration: true
  * QlmTrialKeyDuration: -1 (the duration is defined by the Server Property trialDuration)
  * QlmTrialKeyFeatures: Select which features are enabled for the automatically generated trial key. Enter a semi-comma-separated list of feature sets and their corresponding values.
    * Example: 0:1;1:2;2:3;3:7
      * Enables feature 1 in feature set 0,
      * Enables feature 2 in feature set 1
      * Enables feature 1 + 2 (3) in feature set 2
      * Enables features 1 + 2 + 4 (7) in feature set 3.
  * QlmUserRegistrationCompanyRequired: set to true to require the user to enter their company
  * QlmUserRegistrationEmailRequired: set to true to require the user to enter their email address
  * QlmUserRegistrationFullNameRequired: set to true to require the user to enter their full name
  * QlmUserRegistrationPhoneRequired: set to true to require the user to enter their telephone number
  * QlmUseTryButtonToCreateTrialKey: true&#x20;

### Generate a trial key with email confirmation

To email a trial key after the user enters his contact information, configure the following properties in the "Protect Your Application" wizard (3rd tab in the QLM Management Console):

* **1. GUI Properties**
  * QlmUserRegistrationPageVisiblity: TryButton
* **2. User Registration**
  * QlmEmailTrialKeyAfterUserRegistration: true
  * QlmGenerateTrialKeyAfterUserRegistration: false
  * QlmTrialKeyDuration: 30
  * QlmTrialKeyEmailTemplate: the name of the email template to use when sending the email to the customer. Email templates can be created from the Manage Keys tab / Email Templates.
  * QlmTrialKeyFeatures: Select which features are enabled for the automatically generated trial key. Enter a semi-comma-separated list of feature sets and their corresponding values.
    * Example: 0:1;1:2;2:3;3:7
      * Enables feature 1 in feature set 0,
      * Enables feature 2 in feature set 1
      * Enables feature 1 + 2 (3) in feature set 2
      * Enables features 1 + 2 + 4 (7) in feature set 3.
  * QlmUserRegistrationCompanyRequired: set to true to require the user to enter their company
  * QlmUserRegistrationEmailRequired: set to true to require the user to enter their email address
  * QlmUserRegistrationFullNameRequired: set to true to require the user to enter their full name
  * QlmUserRegistrationPhoneRequired: set to true to require the user to enter their telephone number
  * QlmUseTryButtonToCreateTrialKey: true
* **6. QLM License Properties**
  * QlmCustomerSiteUrl: A URL to your [QLM Customer Site](../qlm-license-server/qlmcustomersite-qlm-self-help.md). Example: https://qlm3.net/qlmdemo/QlmCustomerSite

Note that the email is sent to the user from the QLM License Server. You must therefore configure the SMTP Server settings of the License Server to send emails. For more details about configuring the SMTP Server settings, check the "Configure the QLM License Server to send emails using SMTP" section in this [article](how-to-use-smtp-to-send-emails.md).

Note that this feature is dependent on the proper configuration of the QlmCustomerSite.
