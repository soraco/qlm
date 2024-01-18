# QLM License Wizard - Download Latest Version from a Cloud Drive

When using the Check for updates feature in the QLM License Wizard, the latest version URL can be a URL to a cloud drive.

QLM currently supports links to a file on Google Drive or OneDrive.

In order to access files on Google Drive or OneDrive, you must configure some authentication settings as described below.

#### Google Authentication

To configure Google Authentication, you must acquire a Google Client ID from the [Google API Console](https://console.developers.google.com/)

* In the [Google API Console](https://console.developers.google.com/)
* Click Credentials
* Create a Project or pick an existing project
* Click "Create Credentials" and select "Service Account"
* Set the Application Type to "Desktop app"
* Set the Name to "QLM License Wizard" or any name of your choice
* Click "Create"
* Take note of the generated Client ID and Secret

Then, in the QLM Management Console:

* Go to Manage Keys / Sites
* Go to the Server Properties tab
* Locate the authentication/cloudDrive\_googleClientID property and set its value
* Locate the authentication/cloudDrive\_googleSecrettID property and set its value

#### Azure Authentication

To configure Azure Authentication, you must acquire an Azure App Client ID from the [Azure Portal.](https://portal.azure.com/)

* Log in to your [Azure Portal](https://portal.azure.com/)
* Click App Registrations
* Create New Registration
* Set the Name to "QLM Cloud Drive" or any name of your choice
* Set account types to: Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)
* Do not configure the "Redirect URI"
* Click Register
* In the Overview tab, take note of the Application Client ID.&#x20;
* Click "Add a Redirect URI"
* Click "Add a platform"
* Select "Mobile and desktop applications"
* Select "[https://login.microsoftonline.com/common/oauth2/nativeclient"](https://login.microsoftonline.com/common/oauth2/nativeclient%22)
* Click Configure

Then, in the QLM Management Console:

* Go to Manage Keys / Sites
* Go to the Server Properties tab
* Locate the authentication/cloudDrive\_azureClientId property and set its value

To create a shared file for OneDrive:

* Go to onedrive.com and login to your account
* Select the file that you would like to share
* Click the "Share" menu item
* Click the > next to "Anyone with the link can edit"
* Uncheck "Allow editing"
* Click Apply
* Copy the link to the clipboard
* In the QLM Management Console, go to the Define Products tab
* Select your product
* Go to the Latest Version tab
* Paste the link in the field "URL to the latest version"
* Click Save
* Go to the Manage Keys tab and select yes when prompted to upload the products to the License Server
