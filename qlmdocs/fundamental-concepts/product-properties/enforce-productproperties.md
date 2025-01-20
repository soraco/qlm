# Enforce ProductProperties

QLM can enforce that product properties are set to the expected value when a license is activated. To set a product property during activation, you must use the ActivateLicenseForUserEx4 API and set the enforceProductProperties argument to the value of the product properties to enforce.

The syntax for setting product properties is:

is\_pp=\<category>.\<name>::value::expiryDate||\<category>.\<name>::value::expiryDate||...

The following table describes how product properties are enforced,depending on the property data type:

| Data Type |                                                                                                                                                                                                                                                                                                                |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| int       | The value of the product property in the database must be equal to the value specified in the operation                                                                                                                                                                                                        |
| bool      | The value of the product property in the database must be equal to the value specified in the operation                                                                                                                                                                                                        |
| string    | The value of the product property in the database must be equal to the value specified in the operation. The comparison is case insensitive                                                                                                                                                                    |
| ipAddress | the value of the product property in the database must be equal to the value specified in the operation.                                                                                                                                                                                                       |
| ipSubnet  | The IP Address specified in the operation must be in the same subnet specified in the database                                                                                                                                                                                                                 |
| csv       | The item specified in the operation must be one of the values specified in the database. If multiple values are specified in the operation, they can be separated by & to indicate that all values must match or \| to indicate that just one value must match. You cannot mix & and \| in the same operation. |
|           |                                                                                                                                                                                                                                                                                                                |

