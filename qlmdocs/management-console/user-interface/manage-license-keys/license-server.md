# License Server

The options in this control group pertain to the QLM License server, which acts as an interface between a client system and the QLM database. Although you will typically have a single License Server, the QLM Console can manage a list of License Server profiles, each with its own server address along with data such as the type of database engine on the server, the encryption keys for communicating with the License Server and so on. Until you set up your own License Server, and during your QLM trial period, you can use the DEMO License Server provided by Soraco. Note that the DEMO License Server does not allow you to upload your own products and can only manage keys for the built-in Demo product that ships with the trial version of QLM.

### ![](<../../../.gitbook/assets/image (19).png>)Sites

Click this button to open the License Server Settings dialog window, which lets you create, edit and select your connection to the QLM License Server.

#### General

* **Primary Site**: The URL to the QLM License Server is typically of this form: http://yourdomain/yourvirtualdirectory/qlmservice.asmx
* **Disaster Recovery Site**: The URL to the QLM License Server hosted on a disaster recovery server
* **Test**: Once you have configured all fields, click on the Test button to validate that you can properly connect to the QLM License Server.
* **Database**: Select whether the database you installed on the server uses Microsoft Access or Microsoft SQL Server.
* Active Site: Select which site is active
* **Database Engine**: SQL Server is now the only option
* Upgrade DB Schema: Upgrade the DB schema after upgrading the QLM License Server to a new version
*   Repair options when upgrading the DB schema:&#x20;

    * No Repair: perform a schema upgrade without any data repair
    * SimulateRepair: runs a series of diagnosis on the license data and reports data that needs to be repaired but performs no actual repair
    * Repair: runs a series of diagnosis on the license data and repairs inconsistent data.


* Products
  * Upload: upload the local products to the server
  * Download: download the products from the server to the client

#### Files and Folders

* **Path to products file**: The products you define in QLM are initially stored locally on your computer. Once you are satisfied with your products definition, your products need to be uploaded to the QLM database. QLM automatically detects if your products are out of sync with the server and prompts you to either upload or download products from the server. If you want to force an update, click on the appropriate button in this section. Use this feature with caution as you may inadvertently overwrite the QLM database with the wrong products or vice versa.
* **Path to the searches files**: The searches you define in QLM are initially stored locally on your computer. QLM v18 and higher automatically upload the searches to the server when modified.
* **Path to the Email Templates files**: The Email Templates you define in QLM are initially stored locally on your computer. QLM automatically upload the email templates to the server when modified.

#### Encryption Keys

* **Communication/Admin Encryption Key**: Communication between a client and the QLM License Server is protected via an encryption mechanism that prevents hackers from directly calling your License Server. This is critical due to the fact that the License Server is typically configured to allow anonymous connections.

#### Authentication

The QLM Customer Portal can use 3rd party authentication to allow users to login to the portal. In order to enable 3rd party authentication, you must configure a Client ID for each supported authentication provider.

#### Deployment

The deployment tab configures all the Set the properties below if you are manually uploading the QLM License Server to your server. If you are using the QlmLicenseServerSetup.exe to deploy the QLM License Server, you do not need to set these properties.

* Config files

After setting the properties of your server, database, etc. click the Update Confilg Files button to update all the config files located in %Public%\Documents\Quick License Manager\DeployToServer&#x20;

* Azure Deployment

After setting the properties of your server, database, etc. click the Create Azure Package button to create zip files for each Azure App Service to deploy to your Azure server.

#### License Keys

The license keys tab allows you to activate your QLM Portal licenses.

#### Advanced

* Errors detected in the QLM License Server are stored in the QLM database. You can specify the verbosity of the logs by setting the LoggingLevel property. If you increase the L**oggingLevel** to Verbose or Informational to diagnose a specific issue, remember to set it back to Warning to avoid bloating of your QLM database.

Server Properties

Server Properties are settings that allow you to customize the behavior of the License Server. For more details about server properties, [click here](../../../qlm-license-server/server-properties.md).



