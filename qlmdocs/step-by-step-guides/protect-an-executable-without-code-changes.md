# Protect an Executable without code changes

**WARNING:**

_While protecting an executable is easy and simple to implement, beware that some antivirus software may detect and flag a wrapped executable as a threat, thus preventing your end-user from running your application. This can sometimes be circumvented by instructing the antivirus software to ignore the file or by disabling the antivirus feature (heuristic detection or other) that triggered the detection. Therefore, we recommend using this approach in a controlled environment where you can control antivirus settings._

_<mark style="color:red;">**Due to the Antivirus issue that is beyond our control, protecting an executable is no longer offered.**</mark>_

QLM Enterprise can protect Windows Executables by wrapping your EXE file with another executable file that protects your application using QLM’s licensing mechanism.

This executable contains an encrypted copy of your application along with metadata required to enforce the licensing of your application.

To protect your Windows Executable:

* &#x20;Launch the QLM Management Console
* Go to the Define Products tab and create a new product for your application. _During the trial period, if you are connected to our Demo License Server, you should skip this step._
* Then, go to the Protect Your Application tab
* On page 2 of the wizard, select the product you defined. _During the trial period, if you are connected to our Demo License Server, you should select "Demo 1.0"._
* On page 3, check the option “Windows Executable” and click Next
* On page 4, select the executable you want to protect
* Optionally, select an icon to associate with your EXE
* Optionally, select the digital certificate to sign the final executable
* Click Next
* On the Look and Feel Customization page, in addition to customizing any look & feel setting, you may want to customize one of the following settings:
  * QlmExeWrapperRunWithElevatedPrivileges: set this value to true if your EXE needs to run with elevated privileges. This is typically the case for an installer.
  * QlmExeWrapperShowWizardBeforeExpiry: set this value to the number of days before expiry to force the wizard to be displayed every time the application is launched.
* By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* On the "Save your customizations" page, select a folder where the protected executable file will be generated.
* Click Save. An executable will be generated along with some DLLs that you need to distribute with your application. If your application depends on other DLLs, make sure to copy these DLLs to the same folder as the generated EXE. Double-click the executable to launch it.
* If no license was previously activated, the QLM License Wizard will prompt you to enter a license key.
* Go to the Manage Keys tab in QLM and click the “Create Activation Key” button
* Select your product and any other option of your choice and click OK
* A new Activation is created. Copy the Activation Key and paste it in the QLM License Wizard that was prompting you for a license.
* Click Activate and proceed with the wizard
* Your application should now open up

Note: Any command-line arguments passed to the wrapped executable are automatically forwarded to the underlying executable (your app).
