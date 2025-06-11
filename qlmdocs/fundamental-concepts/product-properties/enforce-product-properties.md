# Enforce Product Properties

QLM can enforce that product properties are set to the expected value when a license is activated.&#x20;

To enforce product properties when using the QLM License Wizard, you must set the QlmEnforcedProductProperties property to the value of the product properties to enforce.

To enforce product properties when using the QLM API, you must use the [ActivateLicenseForUserEx4 ](../../api-reference/.net-api/qlmlicense/application-methods/activatelicenseforuserex3-1.md)API and set the enforceProductProperties argument to the value of the product properties to enforce.

The syntax for setting product properties is:

\<category>.\<name>::value||\<category>.\<name>::value||...

The following table describes how product properties are enforced, depending on the property data type:

| Data Type |                                                                                                                                                                                                                                                                                                                |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| int       | The value of the product property in the database must be equal to the value specified in the operation                                                                                                                                                                                                        |
| bool      | The value of the product property in the database must be equal to the value specified in the operation                                                                                                                                                                                                        |
| string    | The value of the product property in the database must be equal to the value specified in the operation. The comparison is case insensitive                                                                                                                                                                    |
| ipAddress | the value of the product property in the database must be equal to the value specified in the operation.                                                                                                                                                                                                       |
| ipSubnet  | The IP Address specified in the operation must be in the same subnet specified in the database                                                                                                                                                                                                                 |
| csv       | The item specified in the operation must be one of the values specified in the database. If multiple values are specified in the operation, they can be separated by & to indicate that all values must match or \| to indicate that just one value must match. You cannot mix & and \| in the same operation. |
|           |                                                                                                                                                                                                                                                                                                                |

