# Sharing license information on a given system

If you want to have license information shared by multiple users on the same computer without requiring users to have elevated privileges, you can use the new option available in QLM 10.2 which stores license information in the [CommonApplicationData](https://msdn.microsoft.com/en-us/library/system.environment.specialfolder\(v=vs.110\).aspx) folder.

To use this new option, you must:

* Set the QlmStoreKeysLocation property to EFileCommonData
* Set the QlmStoreKeysCommonDataFolder to a value of your choice. This is the name of a subfolder that will be created in the CommonApplicationData folder.
* Set the QlmStoreKeysCommonDataFilename to a value of your choice. This is the name of a file that will be created in the QlmStoreKeysCommonDataFolder  folder.

Once these options are set, regenerate the LicenseValidator class and the License Wizard settings xml file.
