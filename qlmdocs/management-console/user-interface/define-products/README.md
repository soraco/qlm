# Define Products

A QLM license key embeds information about your product such as the product ID, version, expiry date, and features.

To add a product, click on the Add button and enter the product information.

The full set of properties is divided into four tabs, _Product Information_, _Latest Version_, _Keys,_ and _Vendor_.\


### Product Information

_Product name_: Enter the base name of your product without versioning.\
\
_Product ID:_ This field is automatically generated when the database record for the product is stored and remains permanently associated with it from then on.

_Major version, Minor version:_ This pair of numbers, both of which can have at most two digits, specify a particular generation and release of the product for licensing. Taken together, the name and the two version fields constitute a unique handle by which this product will be identified in QLM.

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

### Encryption Keys

#### License Key Encryption

QLM uses asymmetric encryption to encrypt the license key. Asymmetric encryption uses a private key to encrypt the license and a public key to decrypt it. You only need to include the public key in your source code. The private/public key pair is automatically generated and is by default the same for all versions of the same product. In your code, right after calling the DefineProduct method, you must set the PublicKey property to the value defined below.

_New_: Click this button to generate a new key pair at any time.&#x20;

If you change the encryption keys of an existing product, license keys that have already been created for that product will no longer be valid.

It is recommended to create a new product version when updating the encryption keys to minimize the impact on existing customers.

#### License File Encryption (RSA)

QLM can protect apps on non-Windows devices such as Mac, Android, Linux, etc. When storing license data on these platforms, QLM uses RSA asymmetric encryption to encrypt data on the server side (QLM License Server) and decrypt it on the client side. Your app uses the Public Key below to decrypt the data sent by the server.

_New_: Click this button to generate a new key pair at any time.&#x20;

If you change the RSA Keys of an existing product, license files, settings files, and product properties files that have already been signed with the current RSA keys will no longer be valid.

It is recommended to create a new product version when updating the encryption keys to minimize the impact on existing customers.

For more details about updating encryption keys, refer to this [article](../../../how-to/how-to-release-a-new-version-of-your-product-with-new-encryption-keys.md).

\
