# Protect a VB6 app with QLM

\[You can watch a video version of this guide [here](https://www.youtube.com/watch?v=OjRyNeWlZ98)]

Following is a step-by-step procedure to protect a VB6 application. Note that the steps below assume you have a QLM License Server already setup.

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

6\. In your VB6 app, declare the following global variables

{% code overflow="wrap" %}
```vba
' Global variables
Dim lv As LicenseValidator
Dim homeDir As String
Dim settingsFile As String
```
{% endcode %}



7\. In your VB6 app's Form\_Load events add the following code:

{% code overflow="wrap" %}
```vba
Private Sub Form_Open()
    QlmCheckLicense   
End Sub
```
{% endcode %}



8\. In your VBA code, add the code below:

{% code overflow="wrap" %}
```vba
Function QlmCheckLicense()
    Dim trialCount As Integer
    Dim bValidKey As Boolean
    Dim needsActivation As Boolean
    Dim errorMsg As String

    homeDir = App.Path
    settingsFile = homeDir & "\Demo 1.0.lw.xml"

    Set lv = New LicenseValidator
    lv.InitializeLicense (homeDir, settingsFile)

    If lv.ValidateLicenseAtStartup(Environ("computername"), needsActivation, errorMsg) = False Then

        If LaunchWizard = 4 Then
            Unload Me
        End If

        If lv.ValidateLicenseAtStartup(Environ("computername"), needsActivation, errorMsg) = False Then
            Unload Me
        End If
    End If
End Function
Private Function LaunchWizard() As Integer
    Dim args As String

    args = args & " /settings " & """" & settingsFile & """"
    args = args & " /computerID " & lv.fOSMachineName
    Dim exitCode As Long
    Dim wizardExe As String
    wizardExe = homeDir & "\QlmLicenseWizard.exe"
    If Dir(wizardExe) = "" Then
        wizardExe = "C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe"
    End If
   
    exitCode = lv.LicenseObject.LaunchProcess(wizardExe, args, True, True)
    LaunchWizard = exitCode


End Function
```
{% endcode %}

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
* Select the Product (Demo 1.0 for trials) and click OK.
* Copy and Paste the generated Activation Key in the License Wizard the steps in the wizard.
