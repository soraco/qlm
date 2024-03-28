# StoreKeysOptions

The QLM API includes 2 methods that can store and read back the keys: StoreKeys and ReadKeys. If you use the StoreKeys and ReadKeys API, or if you use the QLM .NET Web Control, the activation key and computer key are stored in a file or in the registry on the end user system.\
\
QLM tries to stores the keys in 2 locations: 1 location at the user level and 1 location at the machine level.\
\
The folders where keys are stored are: \
&#x20;   C:\ProgramData\IsolatedStorage\
&#x20;   C:\Users\AppData\Local\IsolatedStorage or C:\Users\AppData\Roaming\IsolatedStorage\
\
Example:\
&#x20; C:\ProgramData\IsolatedStorage\1zy03lmk.jql\epxur3qn.na0\StrongName.gziza0ait44cgjtqq2fgdpi3yp0idvio\AssemFiles\
\
Under these folders, look for a file whose name is the GUID associated with your product (GUID in the Define Products page).\
\
\
When you call the ReadKeys API, ReadKeys tries to load the keys at the user level. If no keys are found at the user level, then QLM tries to read the keys at the machine level.\
\
The **StoreKeysOptions** property controls this behavior. The possible values are: EStoreKeysPerUser, EStoreKeysPerMachine, EStoreKeysPerUserAndMachine..\
\
The QlmLicense.FavorMachineLevelLicenseKey property determines which license key to pick up if QLM finds license keys at the user level as well as the machine level.\
\
To clear the keys stored on the system, call the DeleteKeys API.
