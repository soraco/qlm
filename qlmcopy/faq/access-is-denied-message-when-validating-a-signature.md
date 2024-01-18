# Access is denied message when validating a signature

When validating the signature of a digitally signed xml, if you get an error message saying "Access is denied", the issue may be related to corrupted permissions on a Windows system.

This issue is resolved in QLM 11.1.18192.2. If you cannot upgrade to this version, you can apply the manual fix described below.

To resolve this corruption, restore the permissions of the **c:\Users\All Users\Application Data\Microsoft\Crypto\RSA\MachineKeys** folder by following the procedure in this Microsoft [article](https://support.microsoft.com/en-ph/help/278381/default-permissions-for-the-machinekeys-folders).

You can also restore the permissions by running the QlmDiagnostics.exe tool attached to this article. To use the QlmDiagnostics.exe tool:

* Download the zip file and extract it
* Open a command prompt as Administator (Run As Administrator)
* Type: QlmDiagnostics.exe /rsa
* [QlmDiagnostics.zip](https://support.soraco.co/hc/en-us/article\_attachments/360001917246)5 KB [Download](https://support.soraco.co/hc/en-us/article\_attachments/360001917246)
