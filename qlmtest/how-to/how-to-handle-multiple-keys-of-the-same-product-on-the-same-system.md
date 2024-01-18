# How to handle multiple keys of the same product on the same system

Out of the box, QLM assumes that for a given product, a user will register a single license on a given system. In some scenarios, such as the case where you might be hosting your application for several customers on a given computer, you might need to handle multiple license keys for the same product on a given machine.

The QLM limitation lies in the way we store license keys on a system for a given product. You can only store a single license key per system and per product using the QlmLicense.StoreKeys API.

To by pass this limitation, you must manage the storing of the license key yourself. If your application includes a database (ideally per customer), the database would be a perfect location to store license keys.

The QLM License Wizard uses the QlmLicense.ReadKeys and QlmLicense.StoreKeys methods to read and write the keys to the end user system. You can continue to use the QLM License Wizard but must perform some additional steps before and after launching the wizard:

**Before launching the QLM License Wizard**

* Delete all keys stored on the end user system using the [QlmLicense.DeleteKeys](https://support.soraco.co/hc/en-us/articles/207296906-QlmLicense-DeleteKeys) method.
* Retrieve the Activation Key and Computer Key from your database
* Call [QlmLicense.StoreKeys](https://support.soraco.co/hc/en-us/articles/207611633-QlmLicense-StoreKeys) to write the keys to the end user system
* Launch the QLM License Wizard

**After launching the QLM License Wizard**

* When the QLM License Wizard exits, you must now store the new keys (if any) in your database
* Call [QlmLicense.ReadKeys](https://support.soraco.co/hc/en-us/articles/207296736-QlmLicense-ReadKeys) to retrieve the Activation Key and Computer Key from the system
* Store the new keys in your database&#x20;

**LicenseValidator class**

Additionally, in your application's LicenseValidator class, you must replace the call to ReadKeys with a call to retrieve the keys from your database.

Note that the approach suggested here is not designed to handle concurrency during the license registration process, i.e. do not attempt to activate multiple customers at the same time.
