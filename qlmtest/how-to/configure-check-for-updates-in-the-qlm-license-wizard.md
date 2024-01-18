# Configure Check for Updates in the QLM License Wizard

The QLM License Wizard can be configured to inform your users whether a new version of your application is available and allow them to download your setup program and launch it.

### Configure Check for Updates in the QLM License Wizard

In the Protect Your Application wizard, set the following properties:

* QlmShowCheckForUpdates: true
* QlmShowWelcomePage: true

When launching the wizard, add the following argument: /appversion w.x.y.z where w.x.y.z is the version of the application that the user is currently running.

Example: QlmLicenseWizard.exe /settings "my product 1.0.lw.xml" /appversion 2.1.0.0

### Publish the latest version of your application to the License server

Every time your release a new version of your application, do the following:

* Go to the Define Products tab
* Select your product
* Go to the Latest Version tab
* Set all the fields on this tab
* Save the new Product
* Go to the Manage Keys tab
* When prompted to upload the products to the server, answer Yes

Note that the QLM License Wizard displays the "check for updates" information when it is launched. If you'd like your application to automatically check for updates, you must explicitly call the required API such as [GetLatestVersion](https://support.soraco.co/hc/en-us/articles/207609923-QlmLicense-GetLatestVersion) or [GetLatestEligibleVersion](https://support.soraco.co/hc/en-us/articles/208630416-QlmLicense-GetLatestEligibleVersion).&#x20;
