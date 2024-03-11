# DeleteKeysEx

### Description

Deletes license keys, proxy settings, and floating license settings stored on the end-user system with the StoreKeys API. To store keys, use the StoreKeys API. To read the stored keys, use the ReadKeys API.

```c#
void DeleteKeysEx (bool deleteActivationKey, bool deleteComputerKey, 
                 bool deleteProxySettings, bool deleteFloatingSettings, 
                 out string errorMessage)
```

### Arguments

| Name                   | Data Type | Description                                      |
| ---------------------- | :-------: | ------------------------------------------------ |
| deleteActivationKey    |    bool   | If true, deletes the Activation Key              |
| deleteComputerKey      |    bool   | If true, deletes the Computer Key                |
| deleteProxySettings    |    bool   | If true, deletes the Proxy Settings              |
| deleteFloatingSettings |    bool   | If true, deletes the Floating Settings           |
| errorMessage           |   string  | errorMessage returned if some operations failed. |

### Remarks

DeleteKeysEx works in tandem with the [StoreKeysOptions ](https://soraco.readme.io/reference/estorekeysoptions)property. If StoreKeysOptions is set to EStoreKeysPerMachine or EStoreKeysPerUserAndMachine, DeleteKeysEx will attempt to delete keys stored at the machine level. Deleting keys at the machine level is only possible if the process executing the delete is running with elevated privileges.

For example, if you use the QLM License Wizard standalone executable to activate the license and you launch the QLM License Wizard with the elevated privilege option, the Activation Key and ComputerKey will be stored at the machine level. If you then call DeleteKeysEx from within your application which is not running with elevated privileges, you will not be able to delete the keys stored at the machine level.

There are 3 options to resolve this:

* Set [StoreKeysOptions ](https://soraco.readme.io/reference/estorekeysoptions)to EStoreKeysPerUser
* Use the QLM License Wizard executable to deactivate the keys
* Run your application with elevated privileges.
