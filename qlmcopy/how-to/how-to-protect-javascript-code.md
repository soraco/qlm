# How to protect Javascript code

### Overview

The JavaScript client side library is located in this folder: C:\Program Files\Soraco\QuickLicenseMgr\CodeGenTemplates\Javascript\
\
There are 5 files: QlmCustomer.js, QlmHardware.js, QlmLicense.js, QlmProduct.js and QlmRsaCrypt.js\
\
The client side library performs the license validation, activation, decryption, etc. You typically do not need to change any code in this package. The QlmLicense class in this package is the main class you need to interact with. The most common methods of this class are documented [here](https://support.soraco.co/hc/en-us/sections/201730676-HTTP-Methods).

### Workflow

* Use the QLM Management Console to create an Activation Key from the Manage Keys tab.&#x20;
* When the user launches your app for the first time, prompt the user to enter an Activation Key.
* Once the user enters the Activation Key, your application should call the QlmLicense.ActivateLicense method. If activation is successful, a digitally signed license file is retrieved from the License Server and stored on the system. QLM uses RSA asymmetric encryption to store license information on the system. The RSA public/private key pair is automatically generated by QLM when you define a product in the QLM Management Console / Define Products page. The keys are displayed on the Encryption Keys tab. You will need to include the Public Key in your code.
* Once the license file is stored on the end user system, the next time the application is launched, your application can just read the license file and validate it by calling QlmLicense.ValidateLicense.&#x20;

### Sample

We provide an Electron sample to illustrate the use of the JavaScript library. The sample is located in the following folder: %Public%\Documents\Quick License Manager\Samples\qlmenterprise\Javascript\electron-sample

You can take a look at the main.js file to see how the Electron app uses the JavaScript client side library.
