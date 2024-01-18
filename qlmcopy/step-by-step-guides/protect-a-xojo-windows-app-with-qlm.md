# Protect a Xojo Windows app with QLM

QLM can protect a Xojo Windows app.

A Xojo sample can be found in the following folder:

&#x20;C:\Users\Public\Documents\Quick License Manager\Samples\qlmpro\Windows\Xojo

&#x20;We highly recommend that you familiarize yourself with the sample before protecting your own application.

To protect your Xojo Windows application with QLM:

* Copy the LicenseValidator class from the Xojo sample to your Xojo app
* Copy the following files from C:\Users\Public\Documents\Quick License Manager\Samples\qlmpro\Windows\Xojo folder to your Xojo project.&#x20;
  * QlmLicenseLib.dll
  * QlmWrapper.dll
  * QlmLicenseWizard.exe
  * register.bat
* Open a command prompt as Administrator (Run As Administrator) and execute register.bat. Make sure the registration is successful before proceeding.
* In the Xojo IDE, click Insert / Active X Component, go to the References tab, locate QlmWrapper.dll, select it and click Ok.&#x20;
* Locate the InitializeLicense method of the LicenseValidator class and update the following to to match your own product:
  * Update all arguments of the call to DefineProduct
  * Update the PublicKey
  * Update the DefaultWebServiceUrl
  * Update the CommunicationEncryptionKey
* When your app starts up, call the ValidateLicenseAtSartup method of the LicenseValidator class.
* If ValidateLicenseAtStartup fails, launch the QLM License Wizard process to prompt the user to enter his Activation Key.
* Right after the QLM License Wizard process returns, call ValidateLicenseAtSartup again. If the call fails, exit your application. If the call succeeds, proceed to launch your application.
