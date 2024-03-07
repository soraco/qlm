# Customer Portal Deployment

The QLM Customer Portal requires user authentication to allow access to manage license keys. A user who logs in to the QLM Customer Portal can manage license keys associated with his/her email address.

Additionally, if a user is the primary or secondary contact of an organization, this user can manage all license keys associated with the organization.

Before enabling the QLM Customer Portal and providing your customers access to it, it is highly recommended to review the security measures listed in this [article](customer-portal-security-measures.md) to ensure that customers are not given access to license keys that do not belong to them.

There are 2 steps required to set up the QLM Customer Portal:

* Authentication Configuration
* Deployment of the QLM Customer Portal

### Authentication Configuration

The QLM Customer Portal can authenticate users in 4 different ways:

* QLM User Authentication
* Google Authentication
* Facebook Authentication
* Microsoft Azure Authentication

#### QLM User Authentication

To allow users to log in to the QLM Customer Portal, create a user as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* In the ribbon bar Portal section, click User Accounts
* Click Add and enter the user's information then click Ok
* In the User Type drop-down, select Customer.

#### Google Authentication

To configure Google Authentication, you must acquire a Google Client ID from the [Google API Console](https://console.developers.google.com/)

* In the Google API Console
* Click Credentials
* Create a Project or pick an existing project
* Click Create Credentials and select OAuth Client ID
* Set the Application Type to Web application
* Set the Name to "QLM Customer Portal" or any name of your choice
* Set Authorized JavaScript origins to the domain when the QLM Customer Portal is hosted. Example: [https://qlm3.net](https://qlm3.net/)
* Set the Authorized redirect URIs to the same value as above
* Take note of the generated Client ID.

#### Facebook Authentication

To configure Facebook Authentication, you must acquire a Facebook App ID from the [Facebook Developers page.](https://developers.facebook.com/apps)

* Log in to the Facebook for Developers site
* Click My Apps
* Click Create App
* Select "For Everything Else"
* Set the App Display Name to "QLM Customer Portal" or any name of your choice
* Set the other options as required and click Create App ID
* In the Add a Product section, click Setup in the Facebook Login panel
* When prompted for a platform, select "Web"
* Set the Site URL to the URL to the domain when the QLM Customer Portal is hosted. Example: [https://qlm3.net](https://qlm3.net/)
* Click Continue then click Next a few times until&#x20;
* Once the App is created, click Settings / Basic
* Take note of the generated App ID.

#### Azure Authentication

To configure Azure Authentication, you must acquire an Azure App Client ID from the [Azure Portal.](https://portal.azure.com/)

* Log in to the Azure Portal
* Click App Registrations
* Create New Registration
* Set the Name to "QLM Customer Portal" or any name of your choice
* Set account types to: Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)
* Set Redirect URI to "Web and enter the domain when the QLM Customer Portal is hosted. Example: [https://qlm3.net](https://qlm3.net/)
* Click Register
* In the Overview tab, take note of the generated Application Client ID.&#x20;

### Deployment of the QLM Customer Portal

The QLM Customer Portal can be deployed in 3 different ways:

* Using the QLM License Server Installer
* By manually deploying it
* Azure App Service Deployment

#### QLM License Server Installer

When you use the QLM License Server installer, the QLM Customer Portal is automatically deployed to the system when the License Server is deployed in a folder called QlmCustomerPortal.

**Authentication Configuration**

With a text editor, open the QlmCustomerPortal/qlm-portal-app/assets/appsettings.json file:

* Set the googleLoginKey field to the ClientID acquired above.
* Set the facebookLoginKey field to the App ID acquired above.
* Set the azureAuth / clientId field to the ClientID acquired above.
* Set the resetPasswordUrl to the QlmCustomerSite reset password page.
* Set the updatePasswordUrl to the QlmCustomerSite udpate password page.
* Save the file.

Example:

{% code overflow="wrap" fullWidth="false" %}
```
"apiEndpoint": "https://qlm3.net/qlmdemo/QlmCustomerPortal/qlm-portal-api/api/",
  "googleLoginKey": "xyz.apps.googleusercontent.com",
  "facebookLoginKey": "111111111111111111",
  "azureAuth": {
    "clientId": "asdfgsdfg-5555-4a0c-y7hh-qwere1a6d76fb",
    "authority": "https://login.microsoftonline.com/common",
    "redirectUri": "https://qlm3.net/qlmdemo/QlmCustomerPortal/qlm-portal-app",
    "postLogoutRedirectUri": "https://qlm3.net/qlmdemo/QlmCustomerPortal/qlm-portal-app"
  },
  "resetPasswordUrl": "https://qlm3.net/qlmdemo/qlmcustomersite/qlmresetpassword.aspx?is_hide_title=true&is_hide_logo=true&is_hide_poweredby=true",
  "updatePasswordUrl": "https://qlm3.net/qlmdemo/qlmcustomersite/qlmupdatepassword.aspx?is_hide_title=true&is_hide_logo=true&is_hide_poweredby=true",
```
{% endcode %}

**API Endpoint Configuration**

With a text editor, open the QlmCustomerPortal/qlm-portal-app/assets/appsettings.json file:

* Set the apiEndpoint to the URL of the QLM Customer Portal API site and append /api to the URL. Example: [https://quicklicensemanager.com/qlm/qlmcustomerportal/qlm-portal-api/api](https://quick/)

#### Additional Configuration

With a text editor, open the QlmCustomerPortal/qlm-portal-app/index.html file:

* Set the \<base> tag to the path of the customer portal app (excluding the domain)
* &#x20;Example: \<base>/qlm/qlmcustomerportal/qlm-portal-app/\</base>

#### Manual Installation

Instructions for manually deploying the QLM License Server components, including the QLM Customer Portal, can be found [here](../qlm-license-server/how-to-install-the-qlm-license-server.md).

#### Azure App Service Installation

Instructions for deploying the QLM License Server components, including the QLM Customer Portal, can be found [here](../qlm-license-server/qlm-v12+-azure-integration.md).
