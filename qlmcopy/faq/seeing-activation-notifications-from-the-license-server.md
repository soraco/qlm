# Seeing activation notifications from the License Server?

### QLM Pro and QLM Enterprise

Quick License Manager displays alerts in your system tray when activity is detected on the QLM License Server.

By default, the alerts are configured to monitor the QLM Demo License Server.

If you are evaluating QLM and are connected to the Demo License License, you may see notifications due to actions performed by other users who are evaluating QLM.

If you are a customer and have your own License Server, you can configure notifications to point to your own site instead of the Demo License Server as follows:

* Start QLM
* Go to Manage keys
* Click on Scheduled Tasks
* For each scheduled task, select the License Server that corresponds to your own site.&#x20;

### QLM Express

If you are a QLM Express user, you need to disable all notifications since QLM Express does not support a License Server.

Option 1

* Locate the QLM icon in the Windows system tray
* Right-mouse click the QLM icon&#x20;
* Uncheck "Show In System Tray"
* Then click Exit

Option 2

* Start QLM
* Go to Manage keys
* Click on Scheduled Tasks
* For each scheduled task, uncheck the Scheduled Task Properties
* Close the Scheduled Tasks window by clicking the X button on the window
