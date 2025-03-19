# How to change the name of your product

Your product name can be changed at any time from the QLM Management Console / Define Products tab. After changing the name of the product, save the changes and upload the new product definition to the server (you will be automatically prompted to upload your products to the server).

The product name is used for display purposes only except if you have set the [StoreKeysLocation ](../api-reference/.net-api/qlmlicense/properties/storekeyslocation.md)property to be EFileCommonData.

When selecting this option, license keys are stored in C:\ProgramData\\\<CommonDataFolder>\\\<CommonDataFileName>

where :

CommonDataFolder = Product Name (by default) or the value configured in the Protect Your App wizard

CommonDataFileName = license.txt or the value configured in the Protect Your App wizard

To ensure that customers are unaffected after changing your product's name, you could set the CommonDataFolder to the old product name. If you do not, when customers upgrade to the latest version of your product, QLM will not find previously activated license keys.

Alternatively, you could also add code to your application to retrieve the license keys from the previous location and set them in the new location.

For example:

```csharp
// Assuming lv is an instance of the LicenseValidator class
string ak;
string ck;
lv.QlmLicenseObject.CommonDataFolder = "OldProductName";
lv.QlmLicenseObject.ReadKeys (ref ak, ref ck);
lv.QlmLicenseObject.CommonDataFolder = "NewProductName";
lv.QlmLicenseObject.StoreKeys (ak, ck);

```



