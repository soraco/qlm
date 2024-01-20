# How to use the QLM License Wizard with QLM Express

You can use the QLM License Wizard in QLM Express to allow the end-user to activate a license or deactivate a license.

The QLM License Wizard can be used as a [.NET WinForms control](../api-reference/license-wizard-user-control/) or as a standalone Windows Executable. For more information about using the QLM License Wizard standalone executable, read this [article](online-activation-using-the-qlm-license-wizard-standalone-application.md).

The recommended settings to use the QLM License Wizard with QLM Express are found below. To configure these settings:

* Launch the QLM Management Console
* Go to the the "Protect your application" wizard then click Next
* Select the Product and the License Server
  * Select your product
  * Select the DEMO License Server
* Select the type of application to protect
  *
    * Select the programming language of your application
* Customize the Look & Feel and behavior of the QLM License Wizard by setting the properties as shown in the table below.

| **Section**         | **Property**                           | **Value** |
| ------------------- | -------------------------------------- | --------- |
| GUI  Properties     |                                        |           |
|                     | QlmScanQRCodeCaption                   | \<empty>  |
|                     | QlmShowOnlineActivationPage            | false     |
|                     | QlmShowCheckForUpdates                 | false     |
|                     | QlmShowOfflineActivationKey            | false     |
|                     | QlmShowActivationMethodPage            | false     |
|                     | QlmShowPrivacyPolicyPage               | false     |
|                     | QlmUserRegistrationPageVisibility      | Never     |
| Behavior Properties |                                        |           |
|                     | QlmDeleteActivationKeyWhenDeactivating | true      |
| License Properties  |                                        |           |
|                     | QlmLicenseServerUrl                    | \<empty>  |
|                     | QlmCustomerSiteUrl                     | \<empty>  |

![](https://support.soraco.co/hc/article\_attachments/360025096212/mceclip0.png)
