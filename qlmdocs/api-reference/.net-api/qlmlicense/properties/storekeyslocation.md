# StoreKeysLocation

This property affects the StoreKeys API.\
\
The QLM API includes 2 methods that can store and read back the keys: StoreKeys and ReadKeys. If you use the StoreKeys and ReadKeys API, or if you use the QLM .NET Web Control, the activation key and computer key can be stored either in a file or in the registry on the end user system.\
\
The possible values for this property are:\
\
**EFile:** stores the license key in a file on the end user system (the file can be stored at the user level, at the machine level or both depending on the value of the [StoreKeysOptions](https://support.soraco.co/hc/en-us/articles/207296716-QlmLicense-StoreKeysOptions) property).\
\
**ERegistry:** stores the license key in the registry on the end user system.

**EFileCommonData:** stores the license keys in the Windows CommonData folder (C:\ProgramData) where the keys are accessible to any user on the system.\
\
To clear the keys stored on the system, call the DeleteKeys API.
