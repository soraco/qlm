# 🗜️ QLM Agent

The QLM Agent is a process that runs in the background, either as a Windows Service (QLM Agent Service) or as an application in the Windows system tray (QLM System Tray Agent).

The QLM Agent is responsible for performing scheduled tasks and backup jobs.&#x20;

By default, after QLM is installed, the QLM System Tray Agent is automatically configured to run when the user logs in. You can configure the startup options of the QLM System Tray Agent from the Manage Keys tab / Options / General as shown in the screenshot below.

You can also launch the QLM System Tray Agent from the QLM installation folder: C:\Program Files\Soraco\QuickLicenseMgr\QlmSysTray.exe

If you configure QLM to use the QLM System Tray Agent instead of the QLM Agent Service, the user must be logged in to process scheduled tasks and backup jobs.

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>
