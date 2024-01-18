# Why is the license not stored (or deleted) at the machine level even if the user is an Administrator

When you use the StoreKeys or DeleteKeys API with StoreKeysOptions set to EStoreKeysPerUserAndMachine or EStoreKeysPerMachine, QLM will try to store license key information at the machine level (and the user level in the case of EStoreKeysPerUserAndMachine).

In order to do so, QLM requires specific privileges as outlined below:

1\. If UAC is turned off and the user is an Administrator or a member of the Administrators group, the call to store keys at the machine level should succeed.

2\. If UAC is turned on and the user is an Administrator or a member of the Administrators group, the call to store keys at the machine level will fail. This can be addressed by having your application request elevated privileges. For .NET apps, this can be done by creating a manifest file for your application and adding the following to your manifest file:

&#x20;         \<requestedExecutionLevel level="requireAdministrator" uiAccess="false" />

Alternatively, if the user runs your application as Administrator by launching it via the "Run As Administrator" option, the call to store keys at the machine level should succeed.

When StoreKeys fails to write data at the MACHINE level, other users running your application on the same computer need to activate the license again. Activating the license multiple times on the same computer does not consume additional licenses if the computer identifier is not user dependent.

When a license key has been successfully stored at the MACHINE level and DeleteKeys fails to clear that key because of insufficient privileges, the ReadKeys API will successfully locate this key and use it. For example, running QLM License Wizard or any of the QLM .NET Controls will pick up this license key and try to use it. In order to completely remove this key, you need to ensure that the process calling DeleteKeys runs with elevated privileges.

If you are using the QLM License Wizard, when launching the QLMLicenseWizard.exe from within your application, we recommend that you use the [QlmLicense.LaunchProcess](https://support.soraco.co/hc/en-us/articles/115004668486-QlmLicense-LaunchProcess) API and set the elevatedPrivileges argument to true.&#x20;

The [QlmDeleteKeys.exe](https://support.soraco.co/hc/en-us/articles/203691130-Tool-to-delete-registered-license-keys-on-a-system) is a standalone tool that you can use and distribute to remove keys from a system.
