# ValidateLicenseEx

### Description

Validates a computer-bound license key.

```c#
string ValidateLicenseEx (string computeKey, string ComputerID)
```

### Arguments

| Name        | Data Type | Description                |
| ----------- | :-------: | -------------------------- |
| computerKey |   string  | computer-bound license key |
| computerID  |   string  | computer identifier        |

### Return

| Data Type | Description                       |
| :-------: | --------------------------------- |
|   string  | Error message if validation fails |

### Remarks

Prior to calling this function, you must:

* Call [DefineProduct](https://soraco.readme.io/reference/defineproduct)
* Set the PublicKey property

You can call this function for any type of license key. If the license key is not computer-bound, set the ComputerID to an empty string.

After calling this function, call [GetStatus ](https://soraco.readme.io/reference/getstatus)to get the status of the call.
