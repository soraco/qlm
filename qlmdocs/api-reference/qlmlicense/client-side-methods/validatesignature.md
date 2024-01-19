# ValidateSignature

### Description

Validates the signature of a digitally signed XML fragment.

```c#
bool ValidateSignature(string xmlValue, string publicKey, out string errorMessage)
```

### Arguments

| Name         | Data Type | Description                                                                                          |
| ------------ | :-------: | ---------------------------------------------------------------------------------------------------- |
| xmlValue     |   string  | the digitally signed XML                                                                             |
| publicKey    |   string  | the RSA public encryption key (from Define Products / Encryption Keys / Non-Windows Encryption Keys) |
| errorMessage |   string  | returned error message if the validation fails                                                       |

### Return

| Data Type | Description                    |
| :-------: | ------------------------------ |
|    bool   | true if the signature is valid |

### Remarks

You should use this function to validate that the XML file returned by an XML file digitally signed by the QLM License Server is valid.

For example, you can use this function to validate the XML fragment returned by calling GetProductProperties.
