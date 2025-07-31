# TLS 1.2 Requirements

### Overview

The Soraco QLM License Server that we host to activate your QLM licenses will soon no longer accept connections from client computers that do not support TLS 1.2 or higher. Additionally, if your own License Server is hosted by Soraco Technologies, your server will no longer accept connections from client computers that do not support TLS 1.2 or higher.

The official cut off date will be announced soon.

This can impact you at two levels:

* If you are using the QLM Management Console earlier than QLM version 11.1.18192.2
* If your application was built with QLM earlier than version 11.1.18192.2 and your QLM License Server is hosted by Soraco Technologies.

### QLM Management Console

* If you are using QLM < 6.2 , connection to the QLM License Server will fail. You will need to upgrade to a more recent version of QLM (if you did not purchase a maintenance plan, you will need to purchase a subscription to the latest version of QLM).
* If you are using QLM ≥ 6.2 and < 11.1.18192.2, the QLM Management Console will fail to connect to the QLM License Server. Your options are:
  * Upgrade to the latest version of QLM (if you did not purchase a maintenance plan, you will need to purchase a subscription to the latest version of QLM).
  * Update your computer's registry to enable support for TLS 1.2.  To create the registry entries, you can run the following command in a Windows Command Prompt running with Administrative Privileges (Run As Administrator):
    * reg add "HKLM\SOFTWARE\Microsoft.NETFramework\v4.0.30319" /v SchUseStrongCrypto /t REG\_DWORD /d 1 /f
    * reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft.NETFramework\v4.0.30319" /v SchUseStrongCrypto /t REG\_DWORD /d 1 /f
    * Reboot the computer
* If you are using QLM ≥ 11.1.18192.2, you are not impacted by this change.

### Your application

To identify which version of QLM your application uses, check the version of QlmLicenseLib.dll that is deployed with your application.

1. If your application was built with QLM < 6.2, you will need to upgrade your application to a more recent version of QLM (if you did not purchase a maintenance plan, you will need to purchase a subscription to the latest version of QLM).
2. If your application was built using QLM ≥ 6.2 and < 11.1.18192.2, your options are:
   1. Upgrade to the latest version of QLM (if you did not purchase a maintenance plan, you will need to purchase a subscription to the latest version of QLM).
   2. Apply one of the patches below to enable your application to connect to the License Server:
      1.  Without Code Changes

          You can modify the registry on the customer's computer to add support for TLS 1.2.&#x20;

          1. To create the registry entries, you can run the following command in a Windows Command Prompt running with Administrative Privileges (Run As Administrator):
          2. reg add "HKLM\SOFTWARE\Microsoft.NETFramework\v4.0.30319" /v SchUseStrongCrypto /t REG\_DWORD /d 1 /f
          3. reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft.NETFramework\v4.0.30319" /v SchUseStrongCrypto /t REG\_DWORD /d 1 /f
          4. Reboot the computer
      2.  With Code Changes (for .net apps only)

          You can explicitly add the following line of code to your application (C#) to enable support for TLS 1.2:

          ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
3. If your application was built using QLM ≥ 11.1.18192.2, you are not impacted by this change.&#x20;

#### How to test your application

To test whether your application will work with a server that has TLS 1/1.1 disabled, you can connect your application to the QLM Disaster Recovery Server. When you subscribed to the QLM License Server Hosting service, you were provided with a URL to your QLM Disaster Recovery Server.&#x20;

The QLM Disaster Recovery Server is already configured to reject TLS 1/1.1 requests.&#x20;

If you do not know the URL to your QLM Disaster Recovery Server, please contact our support team at support@soraco.co

You should test, at a minimum, the following operations:

* License Activation
* Server-Side License Validation (if you are using this feature)

#### Testing License Activation

1.  Activation using the License Wizard

    If you are using the QLM License Wizard, you will need to regenerate the XML Settings file that is used as input to the wizard. The XML Settings file can be generated from the Protect Your Application wizard. To configure the XML Settings file to connect to the Disaster Recovery Server, you must set the QlmLicenseServerUrl property to the URL of the Disaster Recovery Server. Once you regenerate the XML Settings file, test activating a license that was created more than 24 hours (you need to wait for the license to be replicated to the DR site).
2. If you are using the QLM API to activate your licenses, simply update your code to use the DR License Server URL and test activating a license that was created more than 24 hours (you need to wait for the license to be replicated to the DR site).

#### Testing Server-Side License Validation

If you are using the [LicenseValidator ](../api-reference/.net-api/licensevalidator/)class and have enabled [server-side license validation ](../faq/server-side-license-validation.md)by setting the QlmValidateLicenseOnServer property to true, your application will try to connect to the License Server at startup. The LicenseValidator class has 2 constructors: (a) one constructor with a hard-coded value for the License Server URL (DefaultWebServiceUrl) and (b) another constructor that uses the XML Settings file generated by the "Protect Your Application" wizard.&#x20;

* If you are using the LicenseValidator constructor with hard coded values, you will need to update your code, change the DefaultWebServiceUrl to point to the DR site and then test your application.
* If you are using the LicenseValidator constructor that uses the XML Settings file generated by the "Protect Your Application" wizard, you will need  to regenerate the XML Settings file. The XML Settings file can be generated from the Protect Your Application wizard. To configure the XML Settings file to connect to the Disaster Recovery Server, you must set the QlmLicenseServerUrl property to the URL of the Disaster Recovery Server. You can then test your application with the new XML Settings file.

### Why are we making this change

To ensure alignment with key security certification requirements and in response to requests from many of our customers, support for TLS 1.0 and 1.1 on our servers must be disabled.

TLS (Transport Layer Security) is the encryption protocol that protects your data when it travels across the internet. Versions 1.0 and 1.1 are considered outdated and no longer meet the rigorous standards required by several leading compliance frameworks. Deprecating these protocols allows us to enhance data protection and maintain certifications that are important to our customers and partners.











