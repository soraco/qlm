# Protect an Excel Application with Quick License Manager

\[You can watch a video version of this guide [here](https://www.youtube.com/watch?v=gCgt1FkYojM) - Note that the instructions were updated after the video was recorded. Use the instructions below for the most up-to-date steps]

Following is a step-by-step procedure to protect an Excel application. Note that the steps below assume you have a QLM License Server already setup. If you are evaluating QLM, you can use the "Demo License Server" that is available to you during the trial period.

Note that QLM protects the VBA code behind your Excel application. It does not protect the content of the cells in the Excel sheet. There are techniques to hide the Excel sheets in case macros are disabled. These techniques are outside the scope of QLM. You can view one of these techniques [here](https://support.soraco.co/hc/en-us/articles/115005573403-How-to-prevent-an-Excel-sheet-from-opening-if-macros-are-disabled).

1\. Launch QLM

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server
* Page 2: Select "VB6, VBA, ..."
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4: Select the folder where your Excel application is located and click Save
* Page 5: Click Finish

4\. In the folder where your Excel application is located, create a new folder called Qlm and copy the following files to the Qlm folder:

* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmlicenseLib.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.tlb
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmCLRHost\_x64.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmCLRHost\_x86.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseWizard.exe

6\. Open your Excel application and click Alt-F11 to launch the VBA Editor.&#x20;

7\. Click Tools / Add References and add the following references

* c:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.tlb
* c:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscoree.tlb
* QlmLicenseLib.tlb ((this is only required for Intellisense which is useful during development to enable the IDE to show all the properties and methods of the QLM classes). We recommend that you remove this reference before deploying the product to your customer's systems.

8\. Add the following code to your workbook (ThisWorkbook)

{% code overflow="wrap" %}
```vba
Dim lv As LicenseValidator
Dim settingsFile As String
Dim homeDir As String
Dim binDir As String


Private Sub Workbook_Open()
CheckLicense
End Sub
Public Sub CheckLicense() 
    '
    ' for debugging purposes / stepping through the code - remove the Stop when done.
    '
    Stop

    On Error GoTo PROC_ERR
    Set lv = New LicenseValidator   

    homeDir = lv.GetHomeDir(ThisWorkbook.path)
    binDir = homeDir & "\Qlm"
    ' Update the filename below with the one that you generated via the Protect Your App Wizard
    settingsFile = homeDir & "\Demo 1.0.lw.xml"
    
    lv.InitializeLicense homeDir, settingsFile, binDir
    Dim binding As ELicenseBinding
    binding = ELicenseBinding_ComputerName

    Dim needsActivation As Boolean
    Dim errorMsg As String
    If lv.ValidateLicenseAtStartupByBinding(binding, needsActivation, errorMsg) = False Then

        Dim args As String

        args = args & " /settings " & """" & settingsFile & """"
        args = args & " /computerID " & lv.fOSMachineName

        #If VBA7 Then
            Dim exitCode As LongPtr
        #Else
            Dim exitCode As Long
        #End If

        Dim wizardExe As String
        wizardExe = binDir & "\QlmLicenseWizard.exe"
        If Dir(wizardExe) = "" Then
            wizardExe = "C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe"
        End If

        exitCode = lv.LicenseObject.LaunchProcess(wizardExe, args, True, True)
         
        ' Validate the license again after activation, if it fails, exit the app
        If lv.ValidateLicenseAtStartupByBinding(binding, needsActivation, errorMsg) = False Then
            ExitApp
        End If
    End If

    Exit Sub

PROC_ERR:
    MsgBox "Error: (" & Err.Number & ") " & Err.Description, vbCritical
    Stop
    ExitApp

End Sub
Private Sub ExitApp()
    ' Before shipping your app, uncomment the Close statement in the ExitApp Sub
    ' During development, you may want to comment it out to avoid getting locked out of your app

    'Me.Close savechanges:=False
End Sub
```
{% endcode %}

9\. In the VBA editor, click Insert "Class Module"

10\. Set the Class Module Name to: LicenseValidator

11\. Paste the content of the LicenseValidator.cls file (this file was generated by the Protect Your application wizard) into the LicenseValidator class module.

This completes the integration. The next time you open your Excel Application, the Workbook\_Open event should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click OK.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.

IMPORTANT NOTES:

* During development, if a license is not valid, the Excel workbook will still open. When ready, uncomment the **Close** statement in the **ExitApp** Sub.
* Do not forget to password-protect your VBA code to protect it. To protect your VBA code:
  * In the VBA Editor, click Toos / VBAProject Properties
  * Go to the Protection tab
  * Check "Lock project for viewing"
  * Enter a password / confirm password
  * Click Ok
* Do not allow the user to open your Excel sheet if macros are disabled. There are several techniques to do that. This [article](https://support.soraco.co/hc/en-us/articles/115005573403-How-to-prevent-an-Excel-sheet-from-opening-if-macros-are-disabled) covers one method.

**Restrictions**

QLM does not support loading Excel apps from a network share or hosted on a SharePoint site. The Excel files must be located in a local folder.

If you need to support hosting your Excel files on a network share, you will need to use the early binding approach and register the QlmLicenseLib.dll when deploying your application.
