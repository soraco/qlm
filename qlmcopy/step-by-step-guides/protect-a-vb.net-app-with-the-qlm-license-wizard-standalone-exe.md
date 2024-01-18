# Protect a VB.NET App with the QLM License Wizard Standalone Exe

Following is a step by step procedure to protect a VB.NET application by using the QLM License Wizard Standalone application. Note that the steps below assume you have a QLM License Server already setup.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application" tab:

* Click Next
* Page 1: Select the product to protect and the License Server.
* Page 2: Select VB.NET.
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4a: Select the folder where your source code is located and click Save
* Page 4b: Click Update Visual Studio Project and locate your \*.csproj or \*.vbproj file. If this step fails, just skip it.
* Page 5: Click Finish

The "Protect your application" should have generated a class file called LicenseValidator.vb and an XML file that contains your customizations. In this guide, we will assume the XML file is called "Demo 1.0.lw.xml" which should be the case if you are evaluating QLM.

* Open your Visual Studio project
* If the Visual Studio integration above succeeded, confirm that the following was added to your project:
  * A reference to QlmLicenseLib.dll
  * A new file called LicenseValidator.vb
  * A new file called Demo 1.0.lw.xml
* If the Visual Studio integration did not work, do the following:
  * Add a reference to QlmLicenseLib.dll
  * Add the file LicenseValidator.vb to your project
  * Add the file Demo 1.0.lw.xml to your project and set the property "Copy to Output Directory" to "Copy if newer"
* You will now need to update your application to add the license validation code.
* Add the following statement your main module: Imports QlmLicenseLib
* Define the following global variables:

> &#x20;   Dim lv As QLM.LicenseValidator\
> &#x20;   Dim settingsFile As String\
> &#x20;   Dim wizardExec As String

* Copy and paste the code below into your application     &#x20;

> &#x20;Sub ValidateLicense()\
> &#x20;   Dim thisAssembly As Reflection.Assembly\
> &#x20;   thisAssembly = Reflection.Assembly.GetExecutingAssembly()
>
> &#x20;   Dim location As String\
> &#x20;   location = System.IO.Path.GetDirectoryName(thisAssembly.Location)
>
> &#x20;   settingsFile = System.IO.Path.Combine(location, "Demo 1.0.lw.xml")
>
> &#x20;   ' You must deploy the QlmLicenseWizard.exe to the same folder as your application and the QlmLicenseLib.dll\
> &#x20;   wizardExec = System.IO.Path.Combine(location, "QlmLicenseWizard.exe")
>
> &#x20;   lv = New QLM.LicenseValidator(settingsFile)
>
> &#x20;   Dim needsActivation As Boolean = False\
> &#x20;   Dim errorMessage As String = String.Empty\
> &#x20;   Dim licenseValid As Boolean
>
> &#x20;   Dim licenseBinding As ELicenseBinding\
> &#x20;   licenseBinding = ELicenseBinding.ComputerName
>
> &#x20;   licenseValid = lv.ValidateLicenseAtStartup(licenseBinding, needsActivation, errorMessage)
>
> &#x20;   If needsActivation = True Or licenseValid = False Then\
> &#x20;   Dim exitCode As Integer
>
> &#x20;   exitCode = DisplayLicenseForm()
>
> &#x20;   If exitCode = 4 Then\
> &#x20;   Environment.Exit(0)\
> &#x20;   End If
>
> &#x20;   licenseValid = lv.ValidateLicenseAtStartup(licenseBinding, needsActivation, errorMessage)\
> &#x20;   If licenseValid = False Then\
> &#x20;   Environment.Exit(0)\
> &#x20;   End If
>
> &#x20;   End If
>
> End Sub
>
> Private Function DisplayLicenseForm() As Integer
>
> &#x20;   Dim errorMessage As String\
> &#x20;   errorMessage = String.Empty
>
> \
> &#x20;   If (lv.QlmLicenseObject.ValidateSettingsFile(settingsFile, errorMessage) = False) Then\
> &#x20;   Console.WriteLine(errorMessage)\
> &#x20;   Return 4\
> &#x20;   End If
>
> &#x20;   Dim args As String
>
> \
> &#x20;   args = String.Format("/settings ""{0}"" ", settingsFile)
>
> &#x20;   If System.IO.File.Exists(wizardExec) = False Then
>
> &#x20;   wizardExec = "C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe"
>
> &#x20;   End If
>
> &#x20;   Return lv.QlmLicenseObject.LaunchProcess(wizardExec, args, True, True)
>
> End Function

Now in your application's startup code, call ValidateLicense().

This completes the integration.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.
