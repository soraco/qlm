# Your license key does not allow you to call the QLM Pro API

In order to debug an application that uses the QLM DLL, you need to have a valid license of QLM on the computer from which you are debugging. Evaluation licenses are able to debug applications as long as the license has not expired. Note that evaluation licenses cannot be used for development purposes after you purchased QLM.

[Read ](https://support.soraco.co/hc/en-us/sections/201579136-Legal-stuff)QLM's licensing terms to determine how many QLM licenses you need to purchase.

Additionally, executing the same code outside the context of a debugger should work fine. QLM assumes that if you are executing code in the context of a debugger, you must be a developer and therefore, as per our EULA, you require a QLM license.\
\
If you do have a valid license and get the following error message while debugging:

> _Your license key does not allow you to call the QLM Professional API_

\
then try one of the suggestions below:\
\
**Solution 1**

* Start QLM
* Click on the About button
* Click on the Activate button
* Close QLM
* Try debugging your application

**Solution 2**

The error can occur if you have recently upgraded your system to the latest version of QLM but your application is still referencing an older version of the QLM binaries. To resolve this, simply update the references in your application to point to the binaries of the latest version of QLM.

**Solution 3**

The error may indicate that the QLM DLLs  required to validate a license are not found. More specifically, make sure that the QlmLicenseLib.dll and the x86\IsLicense50.dll and x64\IsLicense50.dll are in the same folder as your executable. For example, if you are debugging a .net application, these Dlls need to be in your bin\Debug folder.

**Solution 4**\
\
This solution is specific to users whose application is either a service, a web service or an asp.net application.

* Start regedit and go to HKEY\_CURRENT\_USER\Software\Soraco\Quick License Manager
* Copy the content of the LicenseKey entry
* Create the registry key: HKEY\_LOCAL\_MACHINE\Software\Soraco\Quick License Manager
* Create a LicenseKey entry identical to the one above.
* Try debugging your application
