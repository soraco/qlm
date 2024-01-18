# StoreKeys and ReadKeys

After the user enters a license key for the first time, the license key must be stored on the end user system for subsequent validation.\
You can store the license keys with your application's configuration files, registry, database or anywhere else that fits your application's model.\
\
The QLM API includes 2 methods that can store and read back the keys: StoreKeys and ReadKeys.\
\
If you use the StoreKeys and ReadKeys API, or if you use the QLM .NET Users Control or the QLM License Wizard, the activation key and computer key are stored in a file or in the registry on the end user system.

The QlmLicense.StoreKeysLocation property determines whether license information is stored on the file system or in the registry.

By default QLM stores license information at the user level and at the machine level. The QlmLicense.StoreKeysOptions property controls this behavior and can be set to one of these values: EStoreKeysPerUser, EStoreKeysPerMachine, EStoreKeysPerUserAndMachine (default).

**Storing keys on the file system**

When QlmLicense.StoreKeysLocation is set to EStoreKeysTo.EFile, QLM tries to stores the keys in 2 folders, one folder at the user level and one folder at the machine level. The folders are:

> C:\ProgramData\IsolatedStorage\
> C:\Users\AppData\Local\IsolatedStorage or C:\Users\AppData\Roaming\IsolatedStorage

\
Example:\
C:\ProgramData\IsolatedStorage\1zy03lmk.jql\epxur3qn.na0\StrongName.gziza0ait44cgjtqq2fgdpi3yp0idvio\AssemFiles\
\
Under these folders, look for a file whose name is the GUID associated to your product (GUID in Define Products page).

**Storing keys in the registry**

When QlmLicense.StoreKeysLocation is set to EStoreKeysTo.ERegistry, QLM tries to stores the keys in 2 registry hives, one hive at the user level and one hive at the machine level.

On a 32 bit OS, QLM will write license information to:

HKEY\_CURRENT\_USER\Software\Classes\CLSID\\\<GUID>

HKEY\_LOCAL\_MACHINE\Software\Classes\CLSID\\\<GUID>

On a 64 bit OS, QLM will write license information to:

HKEY\_CURRENT\_USER\Software\Classes\CLSID\\\<GUID>

HKEY\_LOCAL\_MACHINE\Software\Classes\CLSID\\\<GUID>

HKEY\_CURRENT\_USER\Software\Wow6432Node\Classes\CLSID\\\<GUID>

HKEY\_LOCAL\_MACHINE\Software\Wow6432Node\Classes\CLSID\\\<GUID>

**Reading keys**

When you call the ReadKeys API, ReadKeys tries to load the keys at the user level. If no keys are found at the user level, then QLM tries to read the keys at the machine level.

The QlmLicense.FavorMachineLevelLicenseKey property determines which license key to pick up if QLM finds license keys at the user level as well as the machine level.

To clear the keys stored on the system, call the DeleteKeys API. You must call DefineProduct before calling DeleteKeys.
