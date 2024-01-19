# ReadProductPropertiesFile

### Description

Reads a Product Properties file and validates its signature.

```csharp
IQlmProductProperties ReadProductProperties (string productPropertiesFileName, 
                                             out string errorMessage)
```

### Arguments

| Name                      | Data Type | Description                                  |
| ------------------------- | :-------: | -------------------------------------------- |
| productPropertiesFileName |   string  | the filename of the products properties file |
| errorMessage              |   string  | error message if the operation failed.       |

### Return

|                                     Data Type                                     | Description                                                          |
| :-------------------------------------------------------------------------------: | -------------------------------------------------------------------- |
| [IQlmProductProperties](https://soraco.readme.io/reference/iqlmproductproperties) | an object that contains a collection of IQlmProductProperty objects. |

### Remarks

This function can also read a license file that contains a ProductProperties section.

### Example

```c#
IQlmProductProperties pps = license.ReadProductPropertiesFile ("pps.xml", out errorMessage)

foreach (QlmProductProperty pp in pps.Properties)
{
    Console.WriteLine(String.Format("Property: {0}, Value: {1}", pp.ToString(), pp.PropValue));
}
```
