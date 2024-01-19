# StoreCookie

### Description

Writes data into a QLM cookie. To read keys, use the [ReadCookie ](readcookie.md)API.

```csharp
bool StoreCookie(string data, string cookieName, int index, 
                 out bool userLevelResult, out bool machineLevelResult, 
                 out string errorMessage)
```

### Arguments

| Name               | Data Type | Description                                                                           |
| ------------------ | :-------: | ------------------------------------------------------------------------------------- |
| data               |   string  | the filename of the products properties file                                          |
| cookieName         |   string  | a unique name for the cookie                                                          |
| index              |    int    | the index of the element to write. You can write multiple entries into a given cookie |
| userLevelResult    |    bool   | a returned value indicating whether the operation was successful at the user level    |
| machineLevelResult |    bool   | a returned value indicating whether the operation was successful at the machine level |
| errorMessage       |   string  | error message if the operation failed                                                 |

### Return

| Data Type | Description                                                                        |
| :-------: | ---------------------------------------------------------------------------------- |
|    bool   | returns true if either the user-level or the machine-level operation is successful |

### Remarks

QLM can store data in two locations: one location at the user level and another location at the machine level. The StoreKeysOptions property controls where data is stored.

Additionally, the StoreKeysLocation property controls whether data is stored on the file system or in the registry.

#### Data on the file system

If you are running XP, the folders are:

* C:\Documents and Settings\<your account name>\Application Data\IsolatedStorage\*
* C:\Documents and Settings\All Users\Application Data\IsolatedStorage

On Windows 7 or higher, the folders are:

* C:\ProgramData\IsolatedStorage
* C:\Users\tom\AppData\Local\IsolatedStorage

Example on Windows 7 or higher:

* C:\ProgramData\IsolatedStorage\1zy03lmk.jql\epxur3qn.na0\StrongName.gziza0ait44cgjtqq2fgdpi3yp0idvio\AssemFiles

Under these folders, a file whose name is the GUID associated with your product (GUID in the Define Products page) is created and contains the license keys.

#### Data in the registry

When QlmLicense.StoreKeysLocation is set to EStoreKeysTo.ERegistry, QLM tries to store the keys in 2 registry hives, one hive at the user level and one hive at the machine level.

On a 32-bit OS, QLM will write license information to:

* HKEY\_CURRENT\_USER\Software\Classes\CLSID\[GUID]
* HKEY\_LOCAL\_MACHINE\Software\Classes\CLSID\[GUID]

On a 64-bit OS, QLM will write license information to:

* HKEY\_CURRENT\_USER\Software\Classes\CLSID\[GUID]
* HKEY\_LOCAL\_MACHINE\Software\Classes\CLSID\[GUID]
* HKEY\_CURRENT\_USER\Software\Wow6432Node\Classes\CLSID\[GUID]
* HKEY\_LOCAL\_MACHINE\Software\Wow6432Node\Classes\CLSID\[GUID]
