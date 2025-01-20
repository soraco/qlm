# Data Types

QLM Product Properties support the following data types:

| Data Type | Description                      | QLM Edition |
| --------- | -------------------------------- | ----------- |
| int       | Any integer value                | PRO, ENT    |
| bool      | A boolean value                  | PRO, ENT    |
| string    | Any string of character          | PRO, ENT    |
| ipAddress | An IP address                    | ENT         |
| ipSubnet  | An IP subnet                     | ENT         |
| csv       | A comma separated list of values | ENT         |

QLM can enforce that product properties are set to the expected value when a license is activated. To set a product property during activation, you must use the ActivateLicenseForUserEx4 API and set the enforceProductProperties argument to the value of the product properties to enforce.
