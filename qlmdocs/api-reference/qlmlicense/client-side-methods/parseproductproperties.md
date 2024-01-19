# ParseProductProperties

### Description

Parses a product properties XML fragment and populates a [IQlmProductProperties ](https://soraco.readme.io/reference/iqlmproductproperties)object with the results.

```c#
IQlmProductProperties ParseProductProperties(string productPropertiesXml, 
                                             out string errorMessage)
```

### Arguments

| Name                 | Data Type | Description                              |
| -------------------- | :-------: | ---------------------------------------- |
| productPropertiesXml |   string  | XML fragment of product properties       |
| errorMessage         |   string  | an error message if the operation fails. |

### Return

|                                     Data Type                                     | Description                                                |
| :-------------------------------------------------------------------------------: | ---------------------------------------------------------- |
| [IQlmProductProperties](https://soraco.readme.io/reference/iqlmproductproperties) | object populated with the data read from the XML fragment. |
