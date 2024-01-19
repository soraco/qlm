# GetCustomersInfoEx

### Description

Retrieves information about a set of customers.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
IQlmCustomerInfo [] GetCustomersInfoEx (string webServiceUrl, string fieldName, 
                                        string fieldOperator, string fieldValue)
```

### Parameters

| Parameter     |  Type  | Description                                                                     |
| ------------- | :----: | ------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                                                  |
| fieldName     | string | field from the Customers table. Typical fields are: Email, FullName, CustomerID |
| fieldOperator | string | a valid SQL operator such as: =, like, <>                                       |
| fieldValue    | string | value of the field to match                                                     |

### Example

```c#
IQlmCustomerInfo[] customers = license.GetCustomersInfo (webServiceUrl, 
                                                         "email", "=", 
                                                         "'customer@mail.com'");
```

```c++
// Get all the customer records

SAFEARRAY * sa = qlmLicense->GetCustomersInfoEx (webServiceUrl _bstr_t(""),_bstr_t(""),_bstr_t(""));IQlmCustomerInfo *ci;

LONG numRecords = 0;

SafeArrayGetUBound (sa, 1, &numRecords);

for (LONG i=0; i < numRecords; i++)

{

SafeArrayGetElement (sa, &i, &ci);

}

// Destroy the safe array when done

SafeArrayDestroy (sa);
```
