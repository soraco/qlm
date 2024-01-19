# ReadCookie

### Description

Reads data stored in a cookie by the [StoreCookie ](storecookie.md)API.

```csharp
bool ReadCookie(string cookieName, int index, out string data)
```

### Arguments

| Name       | Data Type | Description                          |
| ---------- | :-------: | ------------------------------------ |
| cookieName |   string  | the name of the cookie               |
| index      |    int    | the index of the element to retrieve |
| data       |   string  | the returned data                    |

### Return

| Data Type | Description                     |
| :-------: | ------------------------------- |
|    bool   | true if the call was successful |

### Remarks

Use the FavorMachineLevelLicenseKey to control which key takes precedence if the keys are stored at the user and machine levels.
