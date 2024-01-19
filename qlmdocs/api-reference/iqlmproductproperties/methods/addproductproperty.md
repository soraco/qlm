# AddProductProperty

### Description

Adds a new product property.

```csharp
IQlmProductProperty AddProductProperty(string guid, string category, 
                                       string name, string type, 
                                       string help, string val)
```

### Parameters

| Parameter |  Type  | Description                                                                   |
| --------- | :----: | ----------------------------------------------------------------------------- |
| guid      | string | the unique identifier of the product property                                 |
| category  | string | category of the product property                                              |
| name      | string | name of the product property                                                  |
| type      | string | data type of the product property. Possible values are: bool \| int \| string |
| help      | string | help text to associate with the product property                              |
| val       | string | default value of the product property                                         |

### Return

| Type                                              | Description                    |
| ------------------------------------------------- | ------------------------------ |
| [IQlmProductProperty](../../iqlmproductproperty/) | Newly created product property |
