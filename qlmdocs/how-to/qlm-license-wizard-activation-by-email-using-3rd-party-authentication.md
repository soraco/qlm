# QLM License Wizard - Activation by Email using 3rd party authentication

The QLM License Wizard can use an email address instead of an Activation Key for online activation. The email address entered by the user needs to be validated in order to ensure that the user is indeed who he/she claims to be.

QLM supports 4 different ways to validate an email address when it is entered by the customer in the QLM License Wizard:

* An email or SMS message is sent to the end-user with a 6 digit code that can be used to complete the activation. This is the default option.
* Authentication with Google (available as of QLM v15).
* Authentication with Facebook (available as of QLM v15).
* Authentication with Microsoft Azure AD (available as of QLM v15).

#### Google Authentication

To configure Google Authentication, you must acquire a Google Client ID from the [Google API Console](https://console.developers.google.com/)

* In the [Google API Console](https://console.developers.google.com/)
* Click Credentials
* Create a Project or pick an existing project
* Click "Create Credentials" and select "OAuth Client ID"
* Set the Application Type to "Desktop app"
* Set the Name to "QLM License Wizard" or any name of your choice
* Click "Create"
* Take note of the generated Client ID and Secret

Then, in the QLM Management Console:

* Go to Manage Keys / Sites
* Go to the Server Properties tab
* Locate the authentication/wizard\_googleClientID property and set its value
* Locate the authentication/wizard\_googleSecrettID property and set its value

#### Facebook Authentication

To configure Facebook Authentication, you must acquire a Facebook App ID from the [Facebook Developers page.](https://developers.facebook.com/apps)

* Log in to the Facebook for Developers site
* Click My Apps
* Click Create App
* Select "More Options"
* Select "Something Else"
* Set the App Display Name to "QLM License Wizard" or any name of your choice
* Set the other options as required and click Create App ID
* In the Add a Product section, click Setup in the Facebook Login panel
* Once the App is created, click Settings / Basic
* Take note of the generated App ID and App Secret
* Configure other options in the Settings section as needed such as Business Verification, logo, address, etc.
* Click Products, the Configure/Settings
* In the Client OAuth Settings, set the Valid OAuth Redirect URIs to a valid URL such as your website or any URL of your choice. The URL is not used but is required for validation.
* Click Save Changes
* Click Use Cases
* Click Edit "Authentication and account creation"
* Click Add in the email section

Then, in the QLM Management Console:

* Go to Manage Keys / Sites
* Go to the Server Properties tab
* Locate the authentication/wizard\_facebookAppId property and set its value
* Locate the authentication/wizard\_facebookAppSecret property and set its value
* Locate the authentication/wizard\_facebookOAuthRedicretURL property and set its value to the URL specified above.

#### Azure Authentication

To configure Azure Authentication, you must acquire an Azure App Client ID from the [Azure Portal.](https://portal.azure.com/)

* Log in to your [Azure Portal](https://portal.azure.com/)
* Click App Registrations
* Create New Registration
* Set the Name to "QLM License Wizard" or any name of your choice
* Set account types to: Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)
* Do not configure the "Redirect URI"
* Click Register
* In the Overview tab, take note of the generated Application Client ID.&#x20;
* Click "Add a Redirect URI"
* Click "Add a platform"
* Select "Mobile and desktop applications"
* Select "[https://login.microsoftonline.com/common/oauth2/nativeclient"](https://login.microsoftonline.com/common/oauth2/nativeclient%22)
* Select "https://login.live.com/oauth20\_desktop.srf"
* Click Configure and configure the security settings
* Click Save

Then, in the QLM Management Console:

* Go to Manage Keys / Sites
* Go to the Server Properties tab
* Locate the authentication/wizard\_azureClientId property and set its value

&#x20;

#### Facebook Configuration Screenshots

![](https://support.soraco.co/hc/article\_attachments/16202019921044)

![](https://support.soraco.co/hc/article\_attachments/16202020429972)

![](https://support.soraco.co/hc/article\_attachments/16202021124500)
