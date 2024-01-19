# StoreKeys

### Description

Stores license keys on the end user system.

```c#
void StoreKeys (string activationKey, string computerKey)
```

### Arguments

| Name          | Data Type | Description                     |
| ------------- | :-------: | ------------------------------- |
| activationKey |   string  | the activation key to store     |
| computerKey   |   string  | the computer-bound key to store |

### Remarks

To read keys, use the [ReadKeys ](https://soraco.readme.io/reference/readkeys)API. To clear the stored keys, use the [DeleteKeysEx ](https://soraco.readme.io/reference/deletekeysex)API.

QLM tries to store the keys in two locations: one location at the user level and another folder at the machine level. The StoreKeysOptions property controls where the keys are stored.

The [StoreKeysLocation ](https://soraco.readme.io/reference/estorekeysoptions)property controls whether keys are stored in the registry or on the file system.

In the Registry, data is stored in:

* HKEY\_CURRENT\_USER\Software\Classes\<GUID>
* HKEY\_LOCAL\_MACHINE\Software\Classes\<GUID>

On the file system, data is stored in these folders:

* C:\ProgramData\IsolatedStorage\<GUID>
* C:\Users\<user>\AppData\Local\IsolatedStorage\<GUID>

Example on Windows 10:

* C:\ProgramData\IsolatedStorage\1zy03lmk.jql\epxur3qn.na0\StrongName.gziza0ait44cgjtqq2fgdpi3yp0idvio\AssemFiles

is a unique identifier associated with your product (see the Define Products page in the QLM Management Console).
