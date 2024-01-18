# Protect a VC++ app with Quick License Manager

Following is a step by step procedure to protect a VC++ app (unmanaged C++). Note that the steps below assume you have a QLM License Server already setup.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server
* Page 2: Select "VC++"
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4a: Select the folder where your VC++ source code is located and click Save
* Page 4b: Click Update Visual Studio Project and locate your \*.vcxproj file. If this step fails, you can ignore the error and do the following to update your Visual Studio project:
  * Add LicenseValidator.cpp and LicenseValidator.h to your project
  * Copy QlmLicenseLib.dll, QlmLicenseLib.dll.manifest and QlmLicenseWizard.exe to your bin folder from where your application runs. These files can be found in: C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0
* Copy the generated XML file (YourProduct.lw.xml) to your bin folder from where your application runs.
* Page 5: Click Finish

5\. Open your VC++ project in Visual Studio

6\. Add the following to your main view header file:

> **private:**\
> LicenseValidator \*m\_lv;\
> void FreeResources();\
> void LaunchLicenseWizard ();\
> CString wizardSettingsFile;&#x20;

7\. Add the following code to your main view cpp file, in the OnInitialUpdate method:

> void CYourClass::OnInitialUpdate()\
> {
>
> &#x20;   CView::OnInitialUpdate(); // remove this line if you are not using a Windowed app.
>
> &#x20;   m\_lv = new LicenseValidator();
>
> &#x20;   // Rename Demo 1.0.lw.xml to your app's xml file and make sure the file is copied to the binary folder
>
> &#x20;   PathAppend(wizardSettingsFile.GetBuffer(MAX\_PATH), m\_lv->GetThisModuleFolder());\
> PathAppend(wizardSettingsFile.GetBuffer(MAX\_PATH), \_T("Demo 1.0.lw.xml"));\
> wizardSettingsFile.ReleaseBuffer();
>
> &#x20;   ELicenseBinding licenseBinding = ELicenseBinding\_ComputerName;
>
> &#x20;   bool needsActivation = false;\
> &#x20;   CString returnMsg ("");
>
> &#x20;   if (m\_lv->ValidateLicenseAtStartup(licenseBinding, needsActivation, returnMsg) == FALSE)\
> &#x20;   {\
> &#x20;       this->LaunchLicenseWizard();
>
> &#x20;       if (m\_lv->ValidateLicenseAtStartup(licenseBinding, needsActivation, returnMsg) == FALSE)\
> &#x20;       {\
> &#x20;           FreeResources ();\
> &#x20;           ExitProcess (0);\
> &#x20;       }
>
> &#x20;   }
>
> }
>
> void CYourClass::FreeResources()\
> {\
> &#x20;   if (m\_lv != NULL)\
> &#x20;   {\
> &#x20;       delete m\_lv;\
> &#x20;       m\_lv = NULL;\
> &#x20;   }\
> }
>
> void CYourClass::LaunchLicenseWizard ()\
> {\
> &#x20;   CString strLicenseWizardExe (\_T("C:\\\Program Files\\\Soraco\\\QuickLicenseMgr\\\QlmLicenseWizard.exe"));
>
> &#x20;   if (FileExists(strLicenseWizardExe) == false)\
> &#x20;   {\
> &#x20;       // If not found, assume the wizard was installed in the same folder as the current app/module\
> &#x20;       strLicenseWizardExe = m\_lv->GetThisModuleFolder();\
> &#x20;       PathAppend(strLicenseWizardExe.GetBuffer(MAX\_PATH), \_T("QlmLicenseWizard.exe"));\
> &#x20;       strLicenseWizardExe.ReleaseBuffer();
>
> &#x20;       if (FileExists(strLicenseWizardExe) == false)\
> &#x20;       {\
> &#x20;           CString msg;\
> &#x20;           msg.Format(\_T("The file %s does not exist."), strLicenseWizardExe);\
> &#x20;           ::MessageBox(NULL, msg, \_T("QlmLicenseWizard"), MB\_OK);
>
> &#x20;           return;\
> &#x20;       }\
> &#x20;   }
>
> &#x20;   CString strArgs;
>
> &#x20;   // Configure the settings files - update the name of the settings file below
>
> &#x20;   if (FileExists(wizardSettingsFile) == true)\
> &#x20;   {\
> &#x20;       strArgs += " /settings \\"";\
> &#x20;       strArgs += wizardSettingsFile;\
> &#x20;       strArgs += "\\"";\
> &#x20;   }
>
> &#x20;   m\_lv->license->LaunchProcess(\_bstr\_t(strLicenseWizardExe), \_bstr\_t(strArgs), VARIANT\_TRUE, VARIANT\_TRUE);
>
> }
>
> &#x20;
>
> bool CYourClass::FileExists (const CString \&strFileName)\
> {\
> return \_taccess (strFileName, 4) ? false : true;\
> \
> }

&#x20;

This completes the integration. The next time you open your VC++ application the OnInitialUpdate method should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.

The files that you need to distribute with your application are:

* QlmLicenseLib.dll
* QlmLicenseLib.dll.manifest
* QlmLicenseWizard.exe
* XML file generated by the Protect Your Application Wizard

**Troubleshooting Tips**

If you run into compilation issues after adding the LicenseValidator class to your project, you can try the following:

* include _atlstr.h_ in LicenseValidator.h
* include _io.h_ in LicenseValidator.h
* Define _UNICODE_ in the pre-processor args (in VS project properties).
* Add 'version.lib' to Additional Dependencies (in VS project properties).
