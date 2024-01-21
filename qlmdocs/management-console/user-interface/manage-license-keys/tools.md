# Tools

The buttons in this control group pertain to miscellaneous options such as QLM console configuration, Affiliates Portal configuration, Dashboard settings, and eCommerce Provider options.

### Options

* **Path to searches files** : Searches configured in the right-hand panel are stored in a file called queries.xml. You can configure the path of this file. This is typically used if you want to share searches with different people on your team and store searches on a shared path (UNC) on your LAN.
* **Display options**: When you create a query on the fly by selecting the "field", "operator" and "value" in the toolbar over the data set grid, QLM can display the details of your query in the status bar as you build it.
* **Recent Orders**: Allows you to configure the horizon of the recent orders displayed in the QLM dashboard.
* **Upcoming Maintenance Renewals**: Allows you to configure the horizon of the upcoming maintenance renewals displayed in the QLM dashboard.
* **URL to Affiliates Portal**: Allows you to configure the URL to the Affiliates Portal.
* **QLM Agent**: Allows you to configure whether the QLM Agent automatically starts when you log in. The QLM Agent is responsible for running the QLM Scheduled Tasks.

### Scheduled Tasks

Click the Scheduled Tasks button to open a dialog window where you can define operations to be carried out automatically. The scheduled tasks that QLM can execute include emailing notifications to your customers, and displaying alerts when the QLM database is updated. QLM installs with several scheduled tasks predefined and ready for use. One task is designed to handle the email notifications sent to maintenance plan customers; the others are of the alert type. You can use the supplied tasks as-is or customize them to suit your needs. You can also define additional scheduled tasks if required.

Note that as you transition from a trial version of QLM to a purchased version with your own License Server, you should modify the scheduled tasks to point to your own License Server instead of the Default/Demo License Server.

### 3rd Party Extensions

The 3rd party extensions button opens the Edit Commerce Extensions dialog window, which lets you quickly configure integration between your instance of the QLM License Server and any of the major online commerce providers. The typical settings that you will need to modify are the User / Password. For more details, review the eCommerce Provider section under QLM Professional.



