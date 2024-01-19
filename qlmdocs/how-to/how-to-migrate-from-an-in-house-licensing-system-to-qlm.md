# How to migrate from an in-house licensing system to QLM

If you are currently using an in-house licensing system, or a competing product, you can automate the process of migrating your existing customers to QLM.

The first step in migrating to QLM is to import your existing data into the QLM database. The [QlmImport](import-your-existing-data-into-qlm.md) tool allows you to import (a) your customers and (b) license information to the QLM database. For more details about the import process, please review the Readme.txt file included in the import tool project.

During the import process, the import tool will create a new QLM Activation Key for each existing license. The old license key should be stored in the following QLM field: LegacyKey. Doing so will facilitate the automation of the migration.

Once the data is migrated, you will need to add code to the new version of your application to migrate the user to the new QLM licensing as described below:

* At application startup, try to read the QLM Activation Key from the system using the QLM [ReadKeys](../api-reference/qlmlicense/client-side-methods/readkeys.md) API.
* If no QLM keys are found, try to read the old license key using the method you currently use to retrieve your license key. If no old license key is found, prompt the user to enter a QLM Activation Key.
* If an old license key is found, use the QLM API [GetActivationKeyFromLegacyKey](../api-reference/qlmlicense/application-methods/getactivationkeyfromlegacykey.md) to retrieve the new QLM Activation Key based on the old license key.
* Once the QLM Activation Key is retrieved, you can activate it automatically using the [ActivateLicenseEx](../api-reference/qlmlicense/application-methods/activatelicenseex.md) API. If the license activates successfully, you call [StoreKeys](../api-reference/qlmlicense/client-side-methods/storekeys.md) to store the QLM Activation Key on the end-user system.
