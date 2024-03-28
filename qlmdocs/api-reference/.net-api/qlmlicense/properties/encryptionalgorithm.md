# EncryptionAlgorithm

When storing license information on the end user system using [QlmLicense.StoreKeys](https://support.soraco.co/hc/en-us/articles/207611633) or [QlmLicense.StoreCookie, ](https://support.soraco.co/hc/en-us/articles/115002736646)you can select whether to encrypt the information on disk.

&#x20;To do so, set the EncryptionAlgorigthm property to Aes.

&#x20;Example:

```csharp
LicenseValidator lv = new LicenseValidator (settingsXmlFile);

lv.QlmLicenseObject.EncryptionAlgorithm = QlmEncryptionAlgorigthm.Aes;

lv.QlmLicenseObject.StoreKeys (...);
```

&#x20;
