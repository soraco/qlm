# QLM Management Console - Client Side Event Logging

When errors and warnings occur in the QLM Management Console, these events are logged in the Windows Event Log.

To diagnose an issue, it can be helpful to verify these logs in the Windows Event Viewer.

1. Start the QLM Management Console
2. Click on the top left settings icon and select Options (see screenshot below)
3. Click on the Logs tab and check all Logging Levels (Error, Warnings, Informational)
4. If the issue is related to the QLM Management Console, restart the QLM Management Console. If the issue is related to the QLM Agent, restart the QLM Agent. The QLM Agent can be stopped from the windows system tray (bottom right hand corner of your desktop). To launch the QLM Agent, click Windows / Start and type "quick license manager agent" then click on the corresponding item.
5. Reproduce the issue and note down the time at which you reproduced the issue.
6. In Windows, click the Start button and type: eventvwr.msc
7. The Windows Event Viewer should start
8. Click the "Application and Services Log" node once then click it again to expand it
9. Locate the "Quick License Manager" node
10. Right mouse click on the "Quick License Manager" node and select "Save All Events As"
11. Enter a name for the file, such as qlm.evt.
12. Review or email us me the qlm.evt file.
13. In your email, please specify the exact time at which you reproduced the issue so that we can locate the relevant events in the logs.

**QLM Settings**

![](https://support.soraco.co/hc/article\_attachments/115012038363/mceclip2.png)
