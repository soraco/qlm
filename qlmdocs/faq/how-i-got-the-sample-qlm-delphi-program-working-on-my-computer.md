# How I got the Sample QLM Delphi program working on my computer

This article is now superseded by an improved article found [here](../step-by-step-guides/protect-an-embarcadero-delphi-application-with-qlm.md).

\[This is a contribution from one of our customer]

&#x20;

I wrote these notes after I configured QLM's Delphi sample program to work with my copy of Delphi. I wanted to share this information with other Delphi programmers to help make it easier for you to get QLM up and running.

&#x20;I was using Delphi 2010 on 32-bit Vista. The steps that you take may be different depending on your version of Delphi and Windows.

&#x20;&#x20;

**1. Install the trial edition of QLM.**

&#x20;Your Windows user account needs to be set to Administrator to install QLM with no errors. I normally run my Windows user account as Standard, so in my case I had to switch it to Administrator then reboot before installing QLM.

&#x20;

**2. Copy the IsLicense50.dll files to the correct locations**

I'm not sure why Soraco doesn't do this for you automatically during the QLM installation, but at the time I wrote this they don't. So you need to do it.

Using File Explorer, navigate to the C:\Program Files\Soraco\QuickLicenseManager\Redistrib folder.

Copy (don't cut) the x64 and x86 folders to your Windows clipboard. These folders contain different versions of IsLicense50.dll&#x20;

Navigate to the ".net 2.0" folder, which is right in front of you under C:\Program Files\Soraco\QuickLicenseManager\Redistrib,

Paste the copies of the x64 and x86 folders so that they become subfolders of the ".net 2.0" folder.

&#x20;

**3. Register the QlmLicenseLib.dll assembly on your system**

&#x20;QlmLicenseLib.dll is a .NET assembly file. You do NOT use regsvr32.exe to register it. Instead, you need to use RegAsm.exe.

&#x20;I created a batch file on my computer to do the deed. The line below is what I put in the batch file:

&#x20;"C:\Windows\Microsoft.NET\Framework\v2.0.50727\RegAsm.exe" "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseLib.dll" /codebase

&#x20;NOTE: If your OS is 64 bit and your app is 64 bit, you need to use this path to register QlmLicenseLib.dll:

&#x20;"C:\Windows\Microsoft.NET\Framework64\v2.0.50727\RegAsm.exe" "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseLib.dll" /codebase

&#x20;&#x20;

Of course, you should confirm the paths to RegAsm.exe and QlmLicenseLib.dll on your computer and adjust your batch file accordingly.

&#x20;Note: Even though my user account was set to Administrator status, to make the batch file run properly I had to start the batch file by right-clicking it and selecting RUN AS ADMINISTRATOR.

&#x20;&#x20;

**4. Open the QLM Sample Program for Delphi.**

&#x20;You will find the Delphi QLM Pro sample program at:

&#x20;C:\Users\Public\Public Documents\Quick License Manager\Samples\qlmpro\Delphi

&#x20;I copied that folder over to my user account's Documents folder, for easy access and to make sure I maintained an original copy of the sample files in case I messed things up.

&#x20;In your copy of Delphi, open QLMProSample.dproj

&#x20;&#x20;

**5. Regenerate the QLMLicenseLib\_TLB.pas and mscorlib\_TLB.pas component wrapper files.**

&#x20;Since I was going to recreate these component wrapper files, first I renamed the ones that shipped with the sample program (call me a hoarder, but I didn't want to overwrite/delete them). So these files...

IsLicense50\_TLB.pas\
mscorlib\_TLB.pas\
QlmLicenseLib\_TLB.pas

were renamed to...

&#x20;z\_IsLicense50\_TLB.pas  (Note: This file isn't regenerated in my instructions because it doesn't appear to be needed by QLM. As far as I know, you can rename it and forget it.)\
z\_mscorlib\_TLB.pas\
z\_QlmLicenseLib\_TLB.pas

With the old files safely renamed, here's how to regenerate the component wrapper files:

\*\*\* This steps appears to be broken from the Delphi GUI \*\*\*&#x20;

\*\*\* If you get an error importing the .NET DLL, proceed with the steps at the end of this section \*\*\*

From Delphi's menu select Component > Import Component

Select Import .NET Assembly, then click the NEXT button.

A list is populated with the Registered Assemblies on your computer. This may take a few seconds.

Do NOT select anything in the list of components.

Click the ADD button.

Navigate to C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0 and select QlmLicenseLib.dll.

Click the OPEN button.

The Import Component window shows your selected file in the list.

Click the NEXT button.

I wanted to share the QLM component wrapper files for several Delphi programs, so I wanted the wrappers in a common shared folder. In the Unit Dir Name box, I selected C:\Users\\\Documents\RAD Studio\\\Imports

Leave the Search Path alone.

Make sure the Generate Component Wrappers box is checked.

Click the NEXT button

Select Add Unit To Project.

Click the FINISH button.

Wait a few seconds for the process to complete. This generates new QLMLIcenseLib\_TLB and mscorlib\_TLB files in the folder that you specified in the Unit Dir Name box.

\*\*\* End of adding .NET component- if this step failed, you can use the following command line tool to regenerate the wrapper code \*\*\*&#x20;

&#x20;

\*\*\* Command line way of generating the wrapper classes \*\*\*

\> tlibimp -P "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseLib.dll"

&#x20;

This will generate a set of classes that you can copy to the project folder.&#x20;

\*\*\*

You should be ready to run the sample program. I hope it works for you!

&#x20;

**6. Extra Credit**

&#x20;Here are some additional tips to improve the functionality of the QLM Delphi sample program.

&#x20;**A. Closing the license activation form.**

I edited two procedures in QlmLicenseFrm.pas as shown below to allow the form to close by clicking the Close button once, rather than twice. Also, setting modalresult in QLMlicenseFrm lets you easily organize how to handle exiting the form and/or program. For example, if an invalid registration key was entered, you could set the ModalResult to mrAbort, show a message then shut down the entire app.

procedure DisplayLicenseForm(Const wsu, cek : String);

var

&#x20; i:integer;

begin

&#x20; LicenseForm := TLicenseForm.Create(nil);

//  Application.CreateForm(TLicenseForm, LicenseForm);

&#x20; LicenseForm.webServiceUrl:=wsu;

&#x20; LicenseForm.communicationEncryptionKey:=cek;

&#x20; i := LicenseForm.ShowModal();

&#x20; LicenseForm.Release;

&#x20; case i of

&#x20;   mrAbort:

&#x20;     begin

&#x20;       ShowMessage('ShowModal result: Abort (due to registration key failed).' +

&#x20;       'You need to enter a valid registration key.');

&#x20;       //Close down the whole application. In this situation, it's

&#x20;       //best to use this method of exiting the program because the main

&#x20;       //form is still not completely created yet, so you can't just

&#x20;       //close that to shut things down.

&#x20;       PostMessage(Application.handle, WM\_CLOSE, 0, 0);

&#x20;     end;

&#x20;   mrClose, mrCancel:

//Go back to the main app. Let it finish loading.

ShowMessage('ShowModal Close or Cancel called. Back to the main form we go.');

&#x20; end;

end; // DisplayLicenseForm

&#x20;

procedure TLicenseForm.btnCloseClick(Sender: TObject);

begin

//  Close;

&#x20; ModalResult := mrClose;

end;

&#x20;

**B. Testing for embedded Feature flags**

&#x20;You can add this function to the LicenseValidator.pas file to test the QLM license for enabled features:

&#x20;function TLicenseValidator.isFeatureEnabled(featureSet: Integer; featureID: Integer): Boolean;

begin

&#x20; Result := license.IsFeatureEnabledEx(featureSet, featureID);

end;

&#x20;&#x20;

**C. Distribution Note**

&#x20;When you distribute your application, you will need to install QlmLicenseLib.dll on the customer's computer. Soraco recommends that you put it in C:\Program Files\Common Files\Soraco

&#x20;Then under that folder, create two subfolders, x86 and x64

&#x20;Into the x86 folder, copy IsLicense50.dll from C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\x86

&#x20;Into the x64 folder, copy IsLicense50.dll from C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\x64

&#x20;Finally, as part of your installation routine, you'll need to run RegAsm /codebase on the QlmLicenseLib.dll file to register it on the end user's computer.

&#x20;

&#x20;I hope that these instructions will help you use QLM with Delphi!

\-Chris
