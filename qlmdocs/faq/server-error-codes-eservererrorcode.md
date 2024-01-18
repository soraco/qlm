# Server Error Codes (EServerErrorCode)

As of QLM v10.1, calls to the server will return an error code as defined below:

| **Name**                                                        | **Value** | **Description**                                                                                                    |
| --------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------ |
| NoError                                                         | 0         | No error                                                                                                           |
|                                                                 |           |                                                                                                                    |
| **// Request Errors: 1 - 99**                                   |           |                                                                                                                    |
| RequestBlocked\_Error                                           | 1         | A method call failed - generic error                                                                               |
| RequestBlocked\_TimeDifferenceWithServer                        | 2         | A method call failed because the time between the server and the client exceeds the allowed threshold (10 minutes) |
| RequestBlocked\_IpRestriction                                   | 3         | A method call failed because of IP restrictions configured in the Server Properties                                |
| RequestBlocked\_FailedToDecrypt                                 | 4         | A method call failed because QLM failed to decrypt the data.                                                       |
| RequestBlocked\_InvalidFormat                                   | 5         | A method call failed because the encrypted data was not in the expected format.                                    |
| RequestBlocked\_EmptyData                                       | 6         | A method call failed because the data sent to the server was empty.                                                |
| RequestBlocked\_OperationDisabled                               | 7         | A method call failed because the operation was disabled in the License server security settings                    |
| RequestBlocked\_AuthenticationError                             | 8         | A method call failed because the authentication verification failed                                                |
|                                                                 |           |                                                                                                                    |
| **// Communication Errors: 100 - 199**                          |           |                                                                                                                    |
| ConnectionToServer\_Error                                       | 100       | A connection to the server failed - generic error                                                                  |
| ConnectionToServer\_Failed                                      | 101       | Failed to connect to the license server                                                                            |
| <p>ConnectionToServer_</p><p>TimeDifferenceExceedsThreshold</p> | 102       | The time between the server and the client exceeds the allowed threshold (24 hours)                                |
| <p>ConnectionToServer_MaxDaysOfflineExceeded</p><p> </p>        | 103       | The MaxDaysOffline was exceeded                                                                                    |
|                                                                 |           |                                                                                                                    |
| **// License Errors: 200 - 1899**                               |           |                                                                                                                    |
| License\_Error                                                  | 200       | Generic license error                                                                                              |
| License\_Revoked                                                | 201       | The license key is revoked                                                                                         |
| License\_Illegal                                                | 202       | The license key is illegal                                                                                         |
| License\_NotFound                                               | 203       | The license key was not found on the server                                                                        |
| License\_NoProduct                                              | 204       | No product associated with this license was found                                                                  |
| License\_NotValid                                               | 205       | The license key is not valid                                                                                       |
| License\_NotProvided                                            | 206       | The license key was not provided                                                                                   |
| License\_AlreadyActivatedOnAnotherSystem                        | 207       | The license key is already activated on another system                                                             |
| License\_MissingArgument                                        | 208       | A required argument is missing                                                                                     |
| License\_Expired                                                | 209       | The license has expired                                                                                            |
| License\_NoMoreActivations                                      | 210       | No more activations are available                                                                                  |
| License\_ActivationKeyForWrongVersion                           | 211       | The activation key is for another version than the one the user is running                                         |
| License\_ExceededMaxReleases                                    | 212       | The license key is already activated on another system                                                             |
| License\_ExceededNumberOfTrialLicensesPerClient                 | 213       | Exceeded the number of trial licenses allowed per client                                                           |
| License\_ExceededMaxActivationsPerSystem                        | 214       | Exceeded the maximum number of activations per system                                                              |
| License\_FailedToSign                                           | 215       | Failed to digitally sign an XML fragment using the RSA keys                                                        |
|  License\_Release\_NotActivated                                 | 216       | Failed to release a license because it was not activated                                                           |
| License\_Release\_ActivatedOnAnotherSystem                      | 217       | Failed to release a license because it is activated on another system                                              |
|  License\_ProductNotFound                                       |  218      |  No product was found that matches the provided activation key                                                     |
| License\_NotActivatedOnServer                                   | 219       | The activation key was not activated on the server for the given computer                                          |
| License\_ActivationKeyForWrongProduct                           | 220       | The activation key is for another product                                                                          |
| License\_Delete\_Failed                                         | 221       | The delete request failed                                                                                          |
| License\_Product\_Save\_Failed                                  | 222       | The product was not saved on the server due to a conflict                                                          |
| License\_ActivationOnSameDevice\_InProgress                     | 223       | An activation on the same device is already in progress                                                            |
| License\_WrongDeactivationVerificationCode                      | 224       | The provided deactivation verification code is wrong                                                               |
| License\_ComputerKeyMismatch                                    | 225       | The client ComputerKey does not match the server's ComputerKey                                                     |
|                                                                 |           |                                                                                                                    |
| **// Customer Errors: 1900 - 1999**                             |           |                                                                                                                    |
| Customer\_Error                                                 | 1900      | A generic error related to an operation involving the customer record                                              |
| Customer\_Exists                                                | 1901      | Cannot add a customer that already exists                                                                          |
| Customer\_Add\_Error                                            | 1902      | Failed to add a new customer                                                                                       |
| Customer\_Cannot\_Update\_Builtin\_Customer                     | 1903      | Cannot update the built-in None customer                                                                           |
| Customer\_NotFound                                              | 1904      | The customer was not found                                                                                         |
|                                                                 |           |                                                                                                                    |
| **// DB Errors: 2000-2099**                                     |           |                                                                                                                    |
| DB\_Connection\_Failed                                          | 2000      | The connection to the DB failed                                                                                    |
| DB\_Schema\_Upgrade\_Error                                      | 2001      | Error when upgrading the DB schema                                                                                 |
| DB\_SQL\_Query\_Error                                           | 2002      | Error executing a SQL query                                                                                        |
| DB\_InsertError                                                 | 2003      | Error inserting a record in a table                                                                                |
|                                                                 |           |                                                                                                                    |
| **// Misc Errors: 2100-2199**                                   |           |                                                                                                                    |
| Email\_Error                                                    | 2100      | Failed to send an email                                                                                            |
| Sms\_Error\_NotConfigured                                       | 2101      | SMS messaging is not configured                                                                                    |
| Sms\_Error\_Sending                                             | 2102      | SMS messaging - error sending a message                                                                            |
|                                                                 |           |                                                                                                                    |
| **// Product Properties: 2200-2220**                            |           |                                                                                                                    |
| ProductProperties\_Error                                        | 2200      | Generic product property error                                                                                     |
| ProductProperties\_NotFound                                     | 2201      | No product properties were found for the given key                                                                 |
|                                                                 |           |                                                                                                                    |
| UnknownError                                                    | 3000      |                                                                                                                    |
|                                                                 |           |                                                                                                                    |
| Qlm\_License\_Error                                             | 3100      | Errors related to licensing of QLM itself                                                                          |
