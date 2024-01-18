# Protect an Excel Application with Quick License Manager

\[You can watch a video version of this guide [here](https://www.youtube.com/watch?v=gCgt1FkYojM) - Note that the instructions were updated after the video was recorded. Use the instructions below for the most up-to-date steps]

Following is a step by step procedure to protect an Excel application. Note that the steps below assume you have a QLM License Server already setup. If you are evaluating QLM, you can use the "Demo License Server" that is available to you during the trial period.

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

6\. Open your Excel application and click Alt-F11 to launch the VBA Editor.&#x20;

7\. Click Tools / Add References and add the following references

* c:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscorlib.tlb
* c:\Windows\Microsoft.NET\Framework64\v4.0.30319\mscoree.tlb
* QlmLicenseLib.tlb ((this is only required for Intellisense which is useful during development to enable the IDE to show all the properties and methods of the QLM classes). We recommend that you remove this reference before deploying the product to your customer's systems.

8\. Add the following code to your workbook (ThisWorkbook)

> Dim lv As LicenseValidator

> Dim settingsFile As String

> Dim homeDir As String

> Dim binDir As String

\
Private Sub Workbook\_Open()

CheckLicense

End Sub

Public Sub CheckLicense()&#x20;

&#x20;   '\
&#x20;   ' for debugging purposes / stepping through the code - remove the Stop when done.\
&#x20;   '\
&#x20;   Stop\
\
&#x20;   On Error GoTo PROC\_ERR

&#x20;   Set lv = New LicenseValidator   \
\
&#x20;   homeDir = lv.GetHomeDir(ThisWorkbook.path)

&#x20;   binDir = homeDir & "\Qlm"

&#x20;   ' Update the filename below with the one that you generated via the Protect Your App Wizard\
&#x20;   settingsFile = homeDir & "\Demo 1.0.lw.xml"

&#x20;   \
&#x20;   lv.InitializeLicense homeDir, settingsFile, binDir

&#x20;   Dim binding As ELicenseBinding\
&#x20;   binding = ELicenseBinding\_ComputerName\
\
&#x20;   Dim needsActivation As Boolean\
&#x20;   Dim errorMsg As String

&#x20;   If lv.ValidateLicenseAtStartupByBinding(binding, needsActivation, errorMsg) = False Then\
\
&#x20;       Dim args As String\
\
&#x20;       args = args & " /settings " & """" & settingsFile & """"\
&#x20;       args = args & " /computerID " & lv.fOSMachineName\
\
&#x20;       \#If VBA7 Then\
&#x20;           Dim exitCode As LongPtr\
&#x20;       \#Else\
&#x20;           Dim exitCode As Long\
&#x20;       \#End If\
\
&#x20;       Dim wizardExe As String\
&#x20;       wizardExe = binDir & "\QlmLicenseWizard.exe"\
&#x20;       If Dir(wizardExe) = "" Then\
&#x20;           wizardExe = "C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe"\
&#x20;       End If\
\
&#x20;       exitCode = lv.LicenseObject.LaunchProcess(wizardExe, args, True, True)\
&#x20;        \
&#x20;       ' Validate the license again after activation, if it fails, exit the app\
&#x20;       If lv.ValidateLicenseAtStartupByBinding(binding, needsActivation, errorMsg) = False Then\
&#x20;           ExitApp\
&#x20;       End If\
&#x20;   End If\
\
&#x20;   Exit Sub\
\
PROC\_ERR:\
&#x20;   MsgBox "Error: (" & Err.Number & ") " & Err.Description, vbCritical\
&#x20;   Stop\
&#x20;   ExitApp\
\
End Sub

Private Sub ExitApp()

&#x20;   ' Before shipping your app, uncomment the Close statement in the ExitApp Sub\
&#x20;   ' During development, you may want to comment it out to avoid getting locked out of your app\
\
&#x20;   'Me.Close savechanges:=False\
End Sub

9\. In the VBA editor, click Insert "Class Module"

10\. Set the Class Module Name to: LicenseValidator

11\. Paste the content of the LicenseValidator.cls file (this file was generated by the Protect Your application wizard) into the LicenseValidator class module.

This completes the integration. The next time you open your Excel Application, the Workbook\_Open event should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.

IMPORTANT NOTES:

* During development, if a license is not valid, the Excel workbook will still open. When ready, uncomment the **Close** statement in the **ExitApp** Sub.
* Do not forget to password protect your VBA code to protect it. To protect your VBA code:
  * In the VBA Editor, click Toos / VBAProject Properties
  * Go to the Protection tab
  * Check "Lock project for viewing"
  * Enter a password / confirm password
  * Click Ok
* Do not allow the user to open your Excel sheet if macros are disabled. There are several techniques to do that. This [article](https://support.soraco.co/hc/en-us/articles/115005573403-How-to-prevent-an-Excel-sheet-from-opening-if-macros-are-disabled) covers one method.

**Restrictions**

QLM does not support loading Excel apps from a network share or hosted on a SharePoint site. The Excel files must be located in a local folder.

If you need to support hosting your Excel files on a network share, you will need to use the early binding approach and register the QlmLicenseLib.dll when deploying your application.
