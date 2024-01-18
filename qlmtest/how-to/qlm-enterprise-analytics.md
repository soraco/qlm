# QLM Enterprise Analytics

Requirements: QLM Enterprise v11+

***

### Overview

QLM Enterprise allows you to collect analytics about your application's usage. In the current release, QLM can collect and reports analytics about installations and usage of your software application.&#x20;

You can enable analytics either by directly calling specific API methods from within your application or by setting the QlmEnableAnalytics property if you're using the QLM License Validator class.

The granularity of the usage information is per day. If a user launches your application 5 times in a given day, QLM will report that the application was used on that day but will not report the number of times the application was used.

&#x20;

### Enable Analytics via QlmEnableAnalytics&#x20;

To enable QLM to publish analytics information to the License Server:

* Launch the QLM Management Console
* Go to the Protect Your Application wizard&#x20;
* Set the QlmEnableAnaytics property to true
* Continue stepping through the wizard and generate the LicenseValidator class as well as the XML settings file.
* Update your application to use the files generated above.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4408212034196)

### Enable Analytics by calling the API

To collect data about your application's installs and uninstalls, QLM provides 3 methods: AddInstall, UpdateInstall and RemoveInstall.

AddInstall should be called during the installation of your application or the first time your application runs.

UpdateInstall should be called if any of the data published to the server during installation was modified.

RemoveInstall should be called when your application is uninstalled.

UpdateLastAccessedDate should be called every time your application runs and at least once per day.

To view reports about your applications installations, start the QLM Application and click on the Analytics tab.

The Analytics tab displays two graphs and a table.

The **Trial Installs** graph displays statistics about all the trial installs and uninstalls of your application.

The **Permanent Installs** graph displays statistics about all the permanent installs and uninstalls of your application.

The **All Installs** grid displays data about all installs and uninstalls.

***

#### Methods

**AddInstall**

public bool AddInstall(string softwareVersion, string osVersion, string computerName, string computerID, string activationKey, string computerKey, bool trial, string productName, int majorVersion, int minorVersion, ref string installID).

**Description**

Registers an installation with the server. You should call this function once when your application is installed. You should store the returned installID in your application's settings and reuse it on subsequent calls to the QlmAnalytics API.

**Parameters**

> softwareVersion: Version of your software\
> osVersion: Version of the operating system\
> computerName: Name of the computer\
> computerID: Unique identifier of the computer\
> activationKey: activation key on the system\
> computerKey: computer key associated to the system\
> productName: name of your product\
> majorVersion: major version of your product\
> minorVersion: minor version of your product\
> installID: unique identifier of this installation, returned from the server.\
> &#x20;

**Return**

> Returns true of the data was successfully published to the server.

&#x20;

***

**UpdateInstall**

public bool UpdateInstall(string installID, string softwareVersion, string osVersion, string computerName, string computerID, string activationKey, string computerKey, bool trial, string productName, int majorVersion, int minorVersion).

**Description**

Updates information of a registered installation on the server.

**Parameters**

> installID: unique identifier of this installation, returned by a call to AddInstall\
> softwareVersion: Version of your software\
> osVersion: Version of the operating system\
> computerName: Name of the computer\
> computerID: Unique identifier of the computer\
> activationKey: activation key on the system\
> computerKey: computer key associated to the system\
> productName: name of your product\
> majorVersion: major version of your product\
> minorVersion: minor version of your product\
> &#x20;

**Return**

> Returns true of the data was successfully published to the server.

***

**RemoveInstall**

public bool RemoveInstall(string installID, out string errorMessage)\
\
**Description**\
\
Unregisters an application with the server. You should call this function when the user uninstalls your application.

**Parameters**

> installID: unique identifier of this installation, returned from the server.\
> errorMessage: returned error message if the call fails.\
> &#x20;

**Return**

> Returns true of the data was successfully published to the server.

***

**UpdateLastAccessedDate**

public bool UpdateLastAccessedDate(string installID)\
\
**Description**\
\
Updates the last accessed date. You should call this function every time your application starts up and at least once a day.

**Parameters**

> installID: unique identifier of this installation, returned from the server.

**Return**

> Returns true of the data was successfully published to the server.

### &#x20;

### Viewing Analytics Data

Analytics Data can be viewed from the QLM Management Console or the QLM Portal.

To view analytics data from the QLM Management Console:

* Launch the QLM Management Console
* Go to the Analytics tab
* On the top tool bar, you can select the License Model and the date range of the displayed data.

The different tabs display various graphical representations of the collected data whereas the actual data can be viewed in the Data View tab.&#x20;

To export the data for further analysis in tools such as Excel, click the Export button in the ribbon bar.

&#x20;

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/4408217615508)

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/4408212560020)
