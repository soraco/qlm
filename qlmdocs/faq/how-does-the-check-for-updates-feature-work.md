# How does the Check for Updates feature work

QLM provides the framework for implementing a "Check for Updates" feature in your application.

Any time you release a new version of your product, modify the Latest Version tab (in the Define Products tab) field accordingly. You specify the latest version, a URL to download the latest version as well as release notes that you may want to display to users to inform them of the content of the new release,

In your application, you can either periodically check if a new version is available or add a menu item called Check for Updates that triggers the check.

Note that the QLM License Wizard in v10 automatically performs all the verifications described below.

There are 2 ways to retrieve the latest version from the server: (a) the QlmLicense.GetLatestVersion or (b) via a URL call to GetLatestVersionHttp.

The 2 calls above require as input a product ID, a major version and a minor version. These three variables uniquely identify a product and therefore the latest version associated to this product. Additionally, these 3 variables are typically required when you call DefineProduct in your application.

Once you call GetLatestVersion and retrieve the latest version available on the server. you need to compare the version that the user is running with the version received from the server to determine if the user is running the latest version of your software.

If the user is running an older version, you may opt to display the notes and provide the user with an option to download the software or you could perform everything automatically.

Note that QLM does not handle the download and installation part. This is expected to be handled by your application.

Example using GetLatestVersionHttp:

[https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)/GetLatestVersionHttp?is\_productid=1\&is\_majorversion=1\&is\_minorversion=0

If you are using the QLM Maintenance Plan feature, you can use the [GetLatestEligibleVersion](https://support.soraco.co/hc/en-us/articles/208630416-QlmLicense-GetLatestEligibleVersion) function to get the latest version a given customer is entitled to, based on their Maintenance Plan Expiry Date.
