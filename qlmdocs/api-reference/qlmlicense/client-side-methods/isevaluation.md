# IsEvaluation

### Description

Returns whether the current license key is an evaluation key or a subscription key.

```csharp
bool IsEvaluation ()
```

### Return

| Data Type | Description                                    |
| :-------: | ---------------------------------------------- |
|    bool   | true if the license is a trial or subscription |

### Remarks

You must call ValidateLicense prior to calling IsEvaluation.

Note that at the core license engine level, there is no distinction between a subscription and an evaluation. IsEvaluation returns true if the license has an expiry duration or an expiry date.
