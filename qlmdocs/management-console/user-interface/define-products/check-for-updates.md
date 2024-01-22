# Check For Updates

QLM provides a framework that allows you to implement a "Check for Updates" feature for your software. The "Check for Updates" feature allows you to automatically inform your users when a new version of your software is available to download.

Below are the steps required to implement a Check for Updates feature in your application:

* In the Define Product screen, click on the Latest Version tab and specify the details of the latest version of your software:&#x20;
  * Latest Version: Enter the version number of your latest release. Example: 3.1.0&#x20;
  * URL the latest version: Enter a URL from where the user can download the latest version. This URL can be used from your application to either automatically download your application or simply display the URL to the user.&#x20;
  * Notes about the latest version: Enter notes that you would like to display to the user if QLM detects that a new version is available.&#x20;
* In QLM, click on Manage Keys / Sites. In the License Server tab, select the appropriate profile and click on "Upload products to License Server" to upload your product data to the server.&#x20;
* In your application, create a button or a timer-based routine that calls the GetLatestVersion function (see API Reference for details).&#x20;
* Compare the server's version with the installed version and prompt users with the option to upgrade their version if appropriate.&#x20;

The QLM Check For Updates Sample shows how to implement the Check for Updates feature in your application. The sample is located in:

%Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmCheckForUpdates
