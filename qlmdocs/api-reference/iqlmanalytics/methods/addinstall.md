# AddInstall

### Description

Registers an installation with the server. You should call this function once when your application is installed. You should store the returned installID in your application's settings and reuse it on subsequent calls to the QlmAnalytics API.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```c#
bool AddInstall(string softwareVersion, string osVersion, 
                string computerName, string computerID, 
                string activationKey, string computerKey, 
                bool trial, string productName, 
                int majorVersion, int minorVersion, 
                ref string installID)
```

### Parameters

| Parameter       |  Type  | Description                               |
| --------------- | :----: | ----------------------------------------- |
| softwareVersion | string | version of your software                  |
| osVersion       | string | version of the operating system           |
| computerName    | string | name of the computer.                     |
| computerID      | string | unique computer identifier                |
| activationKey   | string | activation key on the system              |
| computerKey     | string | computer key associated with the system   |
| trial           |  bool  | flag indicating if the license is a trial |
| productName     | string | name of your product                      |
| majorVersion    |   int  | major version of your product             |
| minorVersion    |   int  | minor version of your product             |
| installID       | string | retuned unique install identifier         |

### Return

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
