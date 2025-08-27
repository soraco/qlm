# Settings Page

### License Server Configuration

To connect your QLM Mobile App to your QLM License Server, you must configure the URL to the QLM License Server as well at the encryption keys used to communicate with the License Server.

To do so, go to the _Settings_ page and set the corresponding fields.

To simplify this configuration process, the QLM Management Console can generate a QR code which can be scanned by your phone to automatically enter the License Server settings.

To generate the QR code in the QLM Management Console:

* Go to the Manage Keys tab
* Click User Accounts
* Click Generate QR Code
* Copy the QR code to the clipboard and send it by email to the user of your choice.

<figure><img src="../.gitbook/assets/image (58).png" alt=""><figcaption></figcaption></figure>

The user would then simply launch the QLM Mobile App, click _Settings_ then _Retrieve Settings from QR code_. This will configure the app to connect to your License Server.

<figure><img src="../.gitbook/assets/image (59).png" alt=""><figcaption></figcaption></figure>



One of the benefits of using the QR code is to hide sensitive information from the QLM Mobile App user. When you uncheck the User Group property _Access Server Encryption Keys_, the Communication Encryption Key and Admin Encryption Keys fields will be hidden in the QLM Mobile App. This ensures that users of the QLM Mobile App do not have access to sensitive encryption keys.

<figure><img src="../.gitbook/assets/image (57).png" alt=""><figcaption></figcaption></figure>

Note that in addition to scanning a QR Code, the QLM Mobile App can read a QR code from local photos.

### Appearance

The QLM Mobile App supports 3 color themes and 3 font sizes. Select that ones that suit your needs.

### Display Configuration

Recent Days specifies the criteria for the built-in dashboard shortcuts _Recent Orders and Recent Activity_.

Maximum Orders: _Not currently implemented._
