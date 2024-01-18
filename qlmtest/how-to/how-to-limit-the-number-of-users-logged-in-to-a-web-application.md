# How to limit the number of users logged in to a web application

If your application runs on a server, such as an ASP.net application or any type of application where the actual process runs on the server rather than the workstation, you can control the number of users that are allowed to run or login to your application at once.

For example, if you have an ASP.net web application that requires users to logon and a customer purchased 5 licenses, you can allow only 5 users to login at a given time or you can limit the number of user accounts that can be created to 5.

To do so, create an Activation Key as follows:

* Go to the Manage Keys tab
* Click Create Activation Key
* Set Number of Keys to: 1
* Set Number of activations per key to: 1
* Set Floating seats to: 5
* Set any other value as required
* Click Ok.
* Send your customer the Activation Key

When the end-user activates their key, a new Computer Bound Key (ComputerKey) is generated and sent back to the application. This ComputerKey embeds the number of floating seats / users.

In your application, to determine the number of allowed users:

* Instantiate the LicenseValidator class (generated from the Protect your application wizard, 4th tab in QLM)
* Call ValidateLicenseAtStartup
* Call the QlmLicense.NumberOfLicenses to get the number of allowed users

&#x20;Once you get the number of licensed users, you need to add the logic to your application to either prevent creating new user accounts or prevent users from logging in to your application if the number of logged on users exceeds the number of licensed users.

The typical API used by ASP.NET applications to determine the number of logged in users is via the [Membership](https://msdn.microsoft.com/en-us/library/system.web.security.membership\(v=vs.110\).aspx) class, more specifically, [GetNumberOfUsersOnline](https://msdn.microsoft.com/en-us/library/system.web.security.membership.getnumberofusersonline\(v=vs.110\).aspx) and [GetAllUsers](https://msdn.microsoft.com/en-us/library/dy8swhya\(v=vs.110\).aspx).

**Example:**

LicenseValidator lv = new LicenseValidator ();

bool needsActivation = false;

string errorMsg = string.Empty;

string computerID = Environment.MachineName;

if (lv.ValidateLicenseAtStartup(computerID, ref needsActivation, ref errorMsg) == false)\
{

&#x20;   // Launch a form that prompts the user to enter the ActivationKey and activate it.

}

else

{

&#x20;   Console.WriteLine (lv.QlmLicenseObject.NumberOfLicenses.ToString());

}
