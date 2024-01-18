# How to restrict trial requests

The QLM Trial Registration Form allows your customers to request a trial by registering on your website.

QLM provides several configurable settings to control **who** can request a trial, the **number** of trials that can be requested, and the **frequency** of these requests.

Additionally, users can try to fool the system by using different allowed email addresses to request a trial. Although a trial license key might be issued to a user, if a user tries to activate a license on the same system on which another trial was activated, QLM can prevent this activation.

### WHO CAN REQUEST A TRIAL <a href="#h_01heahqe3fzf6m6v4w3j6q502v" id="h_01heahqe3fzf6m6v4w3j6q502v"></a>

The following server properties allow you to control who can request a trial:

| **Property Category** | **Property Name**                     | **Description**                                                                                                                                                                                        |
| --------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| options               | bannedEmailProviders                  | Any email that matches the list of banned email providers is denied.                                                                                                                                   |
| customerSite          | allowGenericEmailProviders            | Determines if generic email providers (such as hotmail, gmail) can request license keys. You can customize the list of generic email providers from the server property options/genericEmailProviders. |
| customerSite          | disposableEmailDetectorUrl            | Configure a custom URL to detect disposable email accounts and reject them. We currently support disposable.debounce.io.                                                                               |
| customerSite          | preventMultipleRegistrationsPerDomain | Prevent a user from requesting a trial license key if another user from the same domain has already requested a trial.                                                                                 |
| customerSite          | preventRegistrationsIfCustomer        | Prevent a user from requesting a trial license key if another user from the same domain has already purchased this product. This property does not impact customers that use generic Email Providers.  |
| security              | blockRegistrationByIPAddress          | Allows blocking customers from requesting a trial based on their IP address                                                                                                                            |

&#x20;

### NUMBER, FREQUENCY AND OTHER RESTRICTIONS <a href="#h_01heahqe3gp91szryzgnawg6wh" id="h_01heahqe3gp91szryzgnawg6wh"></a>

The following server properties allow you to control how many trial licenses a user can request, their frequency, and other useful restrictions.

&#x20;

<table data-header-hidden><thead><tr><th width="185.33333333333331"></th><th width="170"></th><th></th></tr></thead><tbody><tr><td><strong>Property Category</strong></td><td><strong>Property Name</strong></td><td><strong>Description</strong></td></tr><tr><td>customerSite</td><td>maxRegistrationsPerUser</td><td>The maximum number of registrations allowed per user (email). The default is 1.</td></tr><tr><td>customerSite</td><td>minimumDaysBetweenTrials</td><td>The number of days a trial user must wait before requesting another trial. A value of -1 indicates an infinite period. This setting works in conjunction with maxRegistrationsPerUser.</td></tr><tr><td>customerSite</td><td>minimumDaysBetweenTrialsDateField</td><td>The date field to use when evaluating the number of days elapsed since the last trial. The options are: OrderDate (the date the last trial license was created), SubscriptionExpiryDate (the expiry date of the last trial license) or ActivationDate (the date the last trial license was activated).</td></tr><tr><td>customerSite</td><td>preventMultipleRegistrationsPerMajorVersion</td><td>Prevent a user from requesting multiple license keys for the same product major version. When true, a user can request license keys for different major versions of the product. The default value is True. </td></tr><tr><td>customerSite</td><td>preventMultipleRegistrationsPerMinorVersion</td><td>Prevent a user from requesting multiple license keys for the same product minor version. When true, a user can request license keys for different minor versions of the product. The default value is False. </td></tr><tr><td>customerSite</td><td>preventMultipleRegistrationsPerProduct</td><td>Prevent a user from requesting multiple license keys for the same product. When true, a user can request license keys for different products. The default value is True. </td></tr></tbody></table>

### &#x20; <a href="#h_01heahqe3gb43t47trpyy3w7r7" id="h_01heahqe3gb43t47trpyy3w7r7"></a>

### LIMIT THE NUMBER OF TRIAL ACTIVATIONS <a href="#h_01heahqe3ghy37b1m1838jnxs0" id="h_01heahqe3ghy37b1m1838jnxs0"></a>

The following server property allows you to limit the number of trial activations per system.

| **Property Category** | **Property Name**                     | **Description**                                                                                                                                                                         |
| --------------------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| options               | numberOfTrialLicensesAllowedPerClient | Limits the number of trial licenses that can be activated by a client. A client is uniquely identified by a ComputerID and a ComputerName.                                              |
| options               | enforceTrialsMatchComputerIDOnly      | When enforcing the numberOfTrialLicensesAllowedPerClient, match the client based on the ComputerID only. By default, QLM will try to match the ComputerID as well as the Computer Name. |
| options               | enforceMaxTrialsWhenActivating        | Controls whether QLM limits the number of trial keys per system. The number of trial keys allowed per system is controlled by the numberOfTrialLicensesAllowedPerClient property.       |

### &#x20; <a href="#h_01heahqe3g7aexqhvdacsjbvjy" id="h_01heahqe3g7aexqhvdacsjbvjy"></a>

### DISABLE OFFLINE MODE <a href="#h_01heahqe3gkz9swx64g2mnwnar" id="h_01heahqe3gkz9swx64g2mnwnar"></a>

It is recommended to disable the ability to work offline during a trial. To do so, you can configure the QLM License Wizard to prevent offline activation. You can also configure the QLM License object to require an internet connection for a trial license. Note that the options below are only available for QLM Engine Version 6.0.00 or higher which is available as of QLM v17.

#### QLM License Wizard <a href="#h_01heahqe3g76qr08thcvyje70n" id="h_01heahqe3g76qr08thcvyje70n"></a>

You can also configure the QLM License Wizard to prevent offline activation of trial licenses by setting the QlmAllowOfflineActivationOfTrialLicense to false. This feature is only available with QLM Engine Version 6.0.00+.

![](https://support.soraco.co/hc/article\_attachments/15044879431188)

#### QLM License  <a href="#h_01heahqe3gedhnreyreb3s19y5" id="h_01heahqe3gedhnreyreb3s19y5"></a>

To prevent a user from working offline during a trial, you must the following properties:

* QlmMaxDaysOfflineDuringTrial = 0
* QlmOfflinePeriodExceededAction = ExitApp or any value of your choice
* QlmValidateLicenseOnServer = True
* QlmVersion = 6.0.00 (only available with QLM v17 and higher)

The properties can be set from the Protect Your Application wizard as shown in the screenshot below or programmatically:

```
license.ValidateOnServer = true;
license.MaxDaysOffline = -1;
license.MaxDaysOfflineDuringTrial = 0;
license.OfflinePeriodExceededAction = EOfflinePeriodExceededAction.ExitApp;
license.Version = "6.0.00";
```

![](https://support.soraco.co/hc/article\_attachments/15044979734164)
