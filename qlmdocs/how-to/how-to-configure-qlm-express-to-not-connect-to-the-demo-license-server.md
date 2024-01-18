# How to configure QLM Express to not connect to the Demo License Server

By default, QLM automatically connects to our DEMO License Server for evaluation purposes. If you purchased QLM Express and would like QLM to stop connecting to the QLM License Server, follow the steps below:

* Launch the QLM Management Console
* Click the QLM icon in the top left corner and select "Options"
* Uncheck "Connect to QLM License Server at startup"
* Click OK
* Close QLM

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4419414915732/mceclip0.png)

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/4419400287764/mceclip1.png)

Additionally, the QLM Agent application is not required when using QLM Express. The QLM Agent application runs scheduled tasks by connecting to the QLM License Server. You can disable the QLM Agent in one of several ways:

a. Right mouse click the QLM Agent icon in the system tray and uncheck "Show in System Tray"

b. Delete the  following file: %appdata%\Soraco\Quick License Manager\scheduledTasks.xml

Note that QLM Express does not store the keys that you create. QLM Pro does. QLM Express does not support online activation. QLM Pro does.

If you want to issue computer bound license keys to your customers using QLM Express, you need to do the following:

* Contact the customer and ask them to send you their computer identifier, say a Computer Name.
* Go to the "Generate keys" tab in QLM and issue a license key as follows:
  * Set the "License Type" to "Computer Name"
  * Enter the Computer Name in the next field
  * Specify other settings such as expiry date or features
  * Click "Generate License Keys"

The key will be displayed in the "Generated Keys" panel.
