# QLM Agent Service

The QLM Agent is responsible for processing your Scheduled Tasks.

Prior to QLM v12.1, the QLM Agent ran as separate process in the Windows System Tray. Therefore, in order to process scheduled tasks, a user needed to be constantly logged in to the computer.

As of QLM v12.1, you can configure the QLM Agent to run as a Windows Service. This has the benefit of processing tasks without requiring a user to be constantly logged in.

When you enable the QLM Agent to run as a service, scheduled tasks that send emails as well as scheduled backups are performed by the service.

Emails in scheduled tasks must be configured to use an SMTP server to send emails. You cannot send emails via Outlook when the agent is running as a service.

Scheduled tasks that display Desktop Alerts are still performed by the QLM Agent in the Windows System tray.

Note that the QLM Agent Windows Service must be configured to run with the same user account as the user who configured the scheduled tasks.

To configure the user account of the QLM Agent service:

* Launch the Windows Services control panel (services.msc)
* Locate the Quick License Manager Agent entry
* Open its Properties
* Go to the Log On tab
* Check "This account" and enter your credentials

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360043115732/mceclip1.png)

&#x20;

To enable the QLM Agent to run as a service:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Options
* Go to the QLM Agent tab

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360043115612/mceclip0.png)
