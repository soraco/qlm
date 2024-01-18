# Protect a VB6 app with QLM

\[You can watch a video version of this guide [here](https://www.youtube.com/watch?v=OjRyNeWlZ98)]

Following is a step by step procedure to protect a VB6 application. Note that the steps below assume you have a QLM License Server already setup.

1\. Launch QLM

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server
* Page 2: Select "VB6, VBA, ..."
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4: Select the folder where your VB6 application is located and click Save
* Page 5: Click Finish

4\. Copy the following files to the folder where your VB6 application is located:

* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmlicenseLib.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.tlb
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmCLRHost\_x64.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmCLRHost\_x86.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseWizard.exe

5\. Open your VB6 application and add the following references:

* c:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb
* c:\Windows\Microsoft.NET\Framework\v4.0.30319\mscoree.tlb
* QlmLicenseLib.tlb

6\. In your VB6 app's delcare the following global variables

&#x20;       ' Global variables

&#x20;       Dim lv As LicenseValidator\
&#x20;       Dim homeDir As String\
&#x20;       Dim settingsFile As String

7\. In your VB6 app's Form\_Load events add the following code:

&#x20;    Private Sub Form\_Open()

> &#x20;   QlmCheckLicense  &#x20;
>
> End Sub

8\. In your VBA code, add the code below:

> Function QlmCheckLicense()
>
> &#x20;   Dim trialCount As Integer\
> &#x20;   Dim bValidKey As Boolean\
> &#x20;   Dim needsActivation As Boolean\
> &#x20;   Dim errorMsg As String\
> \
> &#x20;   homeDir = App.Path
>
> &#x20;   settingsFile = homeDir & "\Demo 1.0.lw.xml"\
> \
> &#x20;   Set lv = New LicenseValidator\
> &#x20;   lv.InitializeLicense (homeDir, settingsFile)\
> \
> &#x20;   If lv.ValidateLicenseAtStartup(Environ("computername"), needsActivation, errorMsg) = False Then\
> \
> &#x20;       If LaunchWizard = 4 Then\
> &#x20;           Unload Me\
> &#x20;       End If\
> \
> &#x20;       If lv.ValidateLicenseAtStartup(Environ("computername"), needsActivation, errorMsg) = False Then\
> &#x20;           Unload Me\
> &#x20;       End If\
> &#x20;   End If
>
> End Function
>
> Private Function LaunchWizard() As Integer
>
> &#x20;   Dim args As String\
> \
> &#x20;   args = args & " /settings " & """" & settingsFile & """"\
> &#x20;   args = args & " /computerID " & lv.fOSMachineName
>
> &#x20;   Dim exitCode As Long
>
> &#x20;   Dim wizardExe As String\
> &#x20;   wizardExe = homeDir & "\QlmLicenseWizard.exe"\
> &#x20;   If Dir(wizardExe) = "" Then\
> &#x20;       wizardExe = "C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe"\
> &#x20;   End If\
> &#x20; &#x20;
>
> &#x20;   exitCode = lv.LicenseObject.LaunchProcess(wizardExe, args, True, True)\
> &#x20;   LaunchWizard = exitCode\
> \
> \
> End Function

9\. Add the LicenseValidator.cls class (created in step 3 above) to your project as follows:

* Right mouse click your project in VB6
* Click Add and select "Class Module"
* In the New tab, select "Class Module" and click Open
* Copy the contents of the LicenseValidator.cls to the clipboard and paste it into the new class
* Set the name of the class to "LicenseValidator"

This completes the integration. The next time you open your VB6 app, the Form\_Open event should get triggered and perform the license validation.

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard the steps in the wizard.
