# License Server

The options in this control group pertain to the QLM License server, which acts as an interface between a client system and the QLM database. Although you will typically have a single License Server, the QLM Console can manage a list of License Server profiles, each with its own server address along with data such as the type of database engine on the server, the encryption keys for communicating with the License Server and so on. Until you set up your own License Server, and during your QLM trial period, you can use the Default License Server provided by Soraco. Note that the Default License Server does not allow you to upload your own products and can only manage keys for the built-in Demo product that ships with the trial version of QLM.

### ![](<../../../.gitbook/assets/image (19).png>)Sites

Click this button to open the License Server Settings dialog window, which lets you create, edit and select your connection to the QLM License Server.

* **URL**: The URL to the QLM License Server is typically of this form: http://yourdomain/yourvirtualdirectory/qlmservice.asmx
* **Authentication Method**: Anonymous | Forms Authentication | Windows Authentication. In most cases, you will want to configure the web service for Anonymous Authentication.
* **Database**: Select whether the database you installed on the server uses Microsoft Access or Microsoft SQL Server.
* **Database Schema**: When a new version of QLM is released, the QLM database schema may require updating. This button verifies and updates your DB schema as required.
* **Path to products file**: The products you define in QLM are initially stored locally on your computer. Once you are satisfied with your products definition, your products need to be uploaded to the QLM database. QLM automatically detects if your products are out of sync with the server and prompts you to either upload or download products from the server. If you want to force an update, click on the appropriate button in this section. Use this feature with caution as you may inadvertently overwrite the QLM database with the wrong products or vice versa.
* **Communication/Admin Encryption Key**: Communication between a client and the QLM License Server is protected via an encryption mechanism that prevents hackers from directly calling your License Server. This is critical due to the fact that the License Server is typically configured to allow anonymous connections.
* **Test**: Once you have configured all fields, click on the Test button to validate that you can properly connect to the QLM License Server.

### ![](<../../../.gitbook/assets/image (20).png>)Event Log

Errors detected in the QLM License Server are stored in the QLM database. Use this option to view these errors. At times, you may want to increase the verbosity of the messages that the QLM License Server logs. This can be accomplished by updating the **loggingLevel** setting in the web.config file of the QLM License Server. The highest logging level is 15. The recommended value is 3.\
\
If you increase the **loggingLevel** to 15 to diagnose a specific issue, remember to set it back to 3 to avoid bloating of your QLM database.



