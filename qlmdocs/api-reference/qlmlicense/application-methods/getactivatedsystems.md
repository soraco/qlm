# GetActivatedSystems

### Description

Gets information about all the activations of a specific activation key

```csharp
 ILicenseInfo[] GetActivatedSystems(string webServiceUrl, 
                                    string activationKey, 
                                    out string message)


```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | Activation Key                |
| message       | string | Error message                 |

### Return

| Type            | Description                                                                       |
| --------------- | --------------------------------------------------------------------------------- |
| ILicenseInfo\[] | Array of ILicenseInfo objects containing information about each activated license |

## Example

```csharp
private void GetActivatedSystems ()
{
	string message;
	ILicenseInfo[] activatedSystems = lv.QlmLicenseObject.GetActivatedSystems(string.Empty, lv.ActivationKey, out message);

	if (activatedSystems!= null)
	{
  	foreach (ILicenseInfo ai in activatedSystems)
    {
    	Console.WriteLine(String.Format("License {0} is activated on {1} with ComputerKey {2}", ai.ActivationKey, ai.ComputerID, ai.ComputerKey));
    }
	}
}
```
