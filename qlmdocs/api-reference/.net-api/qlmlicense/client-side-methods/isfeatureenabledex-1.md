# IsFeatureEnabledEx

### Description

Returns whether the specified feature is enabled in this license key.

```csharp
 bool IsFeatureEnabledEx (int featureSet, int feature)
```

### Arguments

| Name       | Data Type | Description                                                     |
| ---------- | :-------: | --------------------------------------------------------------- |
| featureSet |    int    | id of the feature set. QLM supports four feature sets (0 to 3). |
| featureID  |    int    | id of the feature to be checked.                                |

### Return

| Data Type | Description                    |
| :-------: | ------------------------------ |
|    bool   | true if the feature is enabled |
