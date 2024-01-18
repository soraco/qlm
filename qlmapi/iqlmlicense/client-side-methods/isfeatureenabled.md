# IsFeatureEnabled

### Description

Returns whether the specified feature is enabled in this license key.

```c#
bool IsFeatureEnabled ( int feature)
```

### Arguments

| Name      | Data Type | Description                      |
| --------- | :-------: | -------------------------------- |
| featureID |    int    | id of the feature to be checked. |

### Return

| Data Type | Description                    |
| :-------: | ------------------------------ |
|    bool   | true if the feature is enabled |

### Remarks

This function is now obsolete and has been superseded by IsFeatureEnabledEx.

You must call ValidateLicense prior to calling IsFeatureEnabled.
