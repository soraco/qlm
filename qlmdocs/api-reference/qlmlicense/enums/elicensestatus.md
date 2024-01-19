# ELicenseStatus

| Name                         |                                  Description                                 | Value |
| ---------------------------- | :--------------------------------------------------------------------------: | ----- |
| EKeyNotFound                 |                             the key was not found                            | 0     |
| EKeyNotSet                   |                        the status was not initialized                        | 1     |
| EKeyPermanent                |                          the key is a permanent key                          | 2     |
| EKeyDemo                     |                    the key is a trial or subscription key                    | 4     |
| EKeyInvalid                  |                             the key is not valid                             | 8     |
| EKeyProductInvalid           |     the product ID embedded in the key does not match the current product    | 16    |
| EKeyVersionInvalid           |      the version embedded in the key does not match the current version      | 32    |
| EKeyExpired                  |                              the key has expired                             | 64    |
| EKeyTampered                 |                       the system date was tampered with                      | 128   |
| EKeyMachineInvalid           | the machine identifier embedded in the key does not match the current system | 256   |
| EKeyNeedsActivation          |                           the key needs activation                           | 512   |
| EKeyExceededAllowedInstances |    the number of allowed instances on a Terminal Server has been exceeded    | 1024  |
| EKeyRevoked                  |                              the key was revoked                             | 2048  |
