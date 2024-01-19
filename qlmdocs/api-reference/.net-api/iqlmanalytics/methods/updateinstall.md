# UpdateInstall

### Description

Updates information of a registered installation on the server.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```c#
bool UpdateInstall(string installID, string softwareVersion, 
                   string osVersion, string computerName, 
                   string computerID, string activationKey, 
                   string computerKey, bool trial, 
                   string productName, 
                   int majorVersion, int minorVersion).
```

### Parameters

| Parameter       |  Type  | Description                                                              |
| --------------- | :----: | ------------------------------------------------------------------------ |
| installID       | string | unique identifier of this installation, returned by a call to AddInstall |
| softwareVersion | string | version of your software                                                 |
| osVersion       | string | version of the operating system                                          |
| computerName    | string | name of the computer.                                                    |
| computerID      | string | unique computer identifier                                               |
| activationKey   | string | activation key on the system                                             |
| computerKey     | string | computer key associated with the system                                  |
| trial           |  bool  | flag indicating if the license is a trial                                |
| productName     | string | name of your product                                                     |
| majorVersion    |   int  | major version of your product                                            |
| minorVersion    |   int  | minor version of your product                                            |

### Return

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
