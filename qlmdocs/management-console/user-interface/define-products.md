# Define Products

<figure><img src="../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

A QLM license key is associated with a particular product as identified by its name and version in the Define Products tab.\
To add a product, click on the Add button and enter the product information.\
The full set of properties is divided into four tabs, _Product Information_, _Latest Version_, _Keys,_ and _Vendor_.\


### Product Information

_Product name_: Enter the base name of your product without versioning.\
\
_Major version, Minor version:_ This pair of numbers, both of which can have at most two digits, specify a particular generation and release of the product for licensing. Taken together, the name and the two version fields constitute a unique handle by which this product will be identified in QLM.\
\
_Encryption key_: Enter an encryption key to encrypt the license key. An encryption key is like a password. A license key can only be decrypted with this password. The ! character is not allowed in the encryption key. Encryption keys are no longer used as of QLM 5. A PKI algorithm is now employed for encrypting the license key. Each time you define a product in QLM, a key pair is created for it. Typically a different key pair is used for each product. You will use the private key in the pair to generate license keys. The public key is used to decrypt license keys. It must be included in your code and set before licenses can be validated.\
\
_Product ID:_ This field is automatically generated when the database record for the product is stored, and remains permanently associated with it from then on.\
\
_Release Date_: The Release Date is used in conjunction with the Maintenance Plan feature to determine upgrade entitlement. Provided the Maintenance Plan Renewal Date is greater than the Release Date, the customer is entitled to the upgrade.\
\
_GUID_: This identifier is automatically generated for your project by QLM. It is used as a key to the evaluation information for the product in Windows Registry under: HKEY\_CLASSES\_ROOT\CLSID\\\<GUID>. The New button adjoining the field generates a new GUID. Calls to the DefineProduct API in your application will need to be updated if you do this.\
\
_Features_: Up to four feature sets with up to eight licensable features in each can be defined for your product. The licenses for the product can be configured on creation to enable one or more of these sets, thus making their individual features available to the user who holds the license.\
The information about the features you have so far defined for the product is found on the Features list. Each line displays the set number (0 to 3), a numeric ID, and a name provided by you. The numeric values used as IDs are those corresponding to the individual bits of a flag byte: 1, 2, 4, and so on up to 128. To manage the Features list, three buttons are provided: Add, to define a new feature; Edit, to change the assignable properties of the selected feature – its name and the set that it belongs to; and Remove to discard the feature altogether.

### Latest Version

The latest version tab has three fields that let you implement a “Check for Updates” feature in your software.\
\
_Latest Version_: Enter in this field the latest version of your product. The format of this value is up to you. The availability of a particular update will be determined in your running software by retrieving this value and comparing it with the current version.\
\
_URL to latest version_: Enter a URL to the latest version of your software for the QLM updating framework to use.\
\
_Notes about the latest version_: The notes you enter in this text box can be retrieved for display to the user along with other information about the update.

### Keys

QLM uses asymmetric encryption to encrypt license keys. The algorithm requires that a pair of encryption keys, one public and one private, be predefined. QLM generates such a pair for you automatically when your product is created. By default, the same key pair is used across all versions of the same product.\
\
_Public key_: You will need this value in order to validate a license in your program code.\
_Private key_: This value is used for generating licenses. For the security of your licensing process, it is recommended not to generate licenses in the protected software itself, but to use an external mechanism for that purpose.\
_New_: Click this button to generate a new key pair at any time. Remember, however, that your software must be updated to use the new public key value.\
_Unmask:_ Check this box to view the actual text of your private key rather a string of asterisks.
