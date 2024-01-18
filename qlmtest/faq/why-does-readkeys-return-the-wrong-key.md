# Why does ReadKeys return the wrong key

_This article applies if you have set QlmStoreKeysLocation to ERegistry or EFile._

When you activate a key, QLM will, by default, store the keys (activation key and computer key) in 2 locations on the system: one location at the user level and another location at the machine level. Storing keys at the machine level is only possible when the application storing the keys is running with elevated privileges. For example, if you are using the QLM License Wizard standalone application to activate keys, and you launched the License Wizard by calling the [QlmLicense.LaunchProcess](https://support.soraco.co/hc/en-us/articles/115004668486-QlmLicense-LaunchProcess) function, the last argument of this function controls whether to launch the process with elevated privileges.&#x20;

**Scenario 1:**

A user initially activates a license with elevated privileges. The activation key and computer key are stored at the machine level and at the user level.&#x20;

The user then activates another license without elevated privileges. The activation key and computer key are stored at the user level only.

You then end up with 2 different sets of keys, each stored in a different location.

Note that the ReadKeys API will pick up the key based on the QlmFavorMachineLevelLicenseKey property.

**Scenario 2:**

A user initially activates a license with elevated privileges. The activation key and computer key are stored at the machine level and at the user level.&#x20;

The user then deactivates the license without elevated privileges. The activation key and computer key that are stored at the user level are deleted. Those stored at the machine level cannot be deleted without elevated privileges and therefore remain stored.

You then end up with 2 different sets of keys, each stored in a different location.

Note that the ReadKeys API will pick up the key based on the QlmFavorMachineLevelLicenseKey property.

**Recommendations**

To circumvent these issues, we recommend one of these options:

1. Store keys in the Windows Common data folder. The [QlmLicense.StoreKeysLocation](https://support.soraco.co/hc/en-us/articles/207296726-QlmLicense-StoreKeysLocation) property allows you to control the location where QLM store keys. The options are: registry, file system or Windows Common data folder. By setting this property to **EFileCommonData,** QLM will store the license keys in the Windows CommonData folder (C:\ProgramData) where the keys are accessible to any user on the system.&#x20;
2. Always use the QLM License Wizard to activate keys with the same setting (either with elevated privileges or without).
3. Do not store keys at the machine level. The QlmLicense.StoreKeysOptions property controls this behavior and can be set to one of these values: EStoreKeysPerUser, EStoreKeysPerMachine, EStoreKeysPerUserAndMachine (default). So you would set StoreKeysOptions to EStoreKeysPerUser. The drawback of this approach is that each user of a given machine will need to activate the license the first time they run your application.
