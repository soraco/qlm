# IsValid

### Description

Returns whether the current license key is a valid key.

```c#
bool IsValid ()
```

### Return

| Data Type | Description              |
| :-------: | ------------------------ |
|    bool   | true if the key is valid |

### Remarks

This function must be called after calling ValidateLicense or ValidateLicenseEx

A valid license key is a key that was decoded properly and is either a permanent or an evaluation key.
