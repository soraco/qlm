# How to protect a Mac OS X application with QLM Enterprise

QLM Enterprise can protect Mac OS X applications with permanent, trial and device bound keys. An Objective-C library (source code included) exposes an API that enables you to provide your customers with an evaluation of your software and then turn it at anytime into a permanent license, or simply extend it for subscription based applications.

The Objective-C library along with a sample applications are provided in the following QLM Enterprise samples folder:\
\
&#x20;       %Public%\documents\quick license manager\samples\qlmenterprise\Mac\QlmMacSample

The sample contains 2 projects: QlmLicenseMobile and QlmMobileDeviceSample.

**QlmLicenseMobile** is the project that performs the license validation, activation, encryption, etc. You typically do not need to change any code in this package. The QlmLicense class in this package is the main class you need to interfact with. The most common methods of this class are document in the help under "Quick License Manager Enterprise / Non-Windows Platforms / Mobile Devices API".

**QlmMobileDeviceSample** simulates your application. When the application is launched, the application startup code checks if a license has ever been activated on the device. If no key was ever activated, the user is required to enter an Activation Key and activate it. If a key was previously activated, the license is validated to determine if the license is still valid and has not expired.

Use the QLM Pro Application to create an Activation Key from the Manage Keys tab. Note that activation keys can be created from your server using our API or directly from one of the ecommerce provider integrated with QLM. For a full list of ecommerce providers integrated with QLM, check the help or our web site.

Once the user enters the Activation Key, you call the QlmLicense.ActivateLicense method with the required arguments. If activation is successful, encrypted license information is stored on the device. QLM uses RSA asymmetric encryption to store license information on the device. The RSA public/private key pair is automatically generated by QLM when you define a product in the QLM Application Define Products page. The keys are displayed on the Encryption Keys tab / Mobile Devices Encryption.

Note that the encrypted data stored on the device is encrypted on the QLM server using the RSA private key and decrypted on the device using the RSA public key.

On the OS X application, the RSA public key should ideally be embedded in your application. The sample code loads the public key from an external file called QlmPublicKey.xml but it is recommended that the public key be hard coded in your applicaiton.

In the event a client does not have an internet connection to activate a license online, you can perform an **offline activation** as described below:

* In the QLM applicatinon, under the Manage Keys tab, locate and select the license to activate.
* Click on the Activate button.
* Fill in the Computer ID field on the Activation tab along with other fields as required.
* Click on the **Advanced** tab.
* Select a location where you would like to store a license file then click Ok.
* Send the generated license file to your customer and ask them to copy it to the folder where your application expects the license file to be located.

&#x20;

### Troubleshooting

* When building the sample, if the linker cannot find the crypto library, you must download it as follows:
  * Launch a Terminal instance
  * Type: brew
  * Type: brew update
  * Type: brew install openssl (or brew upgrade openss)
  * At the end of the installation, note the path of the SSL libraries and update your project accordingly.

![](https://support.soraco.co/hc/article\_attachments/360023957252/mceclip0.png)

* If your License Server does not use SSL, you need to do the following:
  * Open the projects info.plist file
  * Add a key called `AppTransportSecurity` as a Dictionary.
  * Add a Subkey called `AllowsArbitraryLoads` as Boolean and set its value to YES
