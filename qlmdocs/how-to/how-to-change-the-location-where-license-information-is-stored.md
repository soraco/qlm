# How to change the location where license information is stored

### Overview

This guide explains how to migrate your end-users' license keys from one storage location to another when you decide to change where your application stores QLM license keys. The provided MyLicenseValidator class demonstrates a best-practice implementation for seamless key migration.

### When to Use This

You should implement key migration when:\
• Changing from Windows Registry to file-based storage (or vice versa)\
• Moving from per-user storage to machine-level storage (or vice versa)\
• Switching between different EStoreKeysTo locations in your application<br>

### How It Works

Key Features:

1. Non-destructive: Original keys remain in the old location
2. One-time operation: Uses a cookie flag to prevent repeated migrations
3. Transparent: Runs automatically on application startup
4. Fallback logic: Checks new location first, then old location Migration Flow
5. Check Migration Status: Reads a cookie named "keyLocationMigrated" to determine if migration has already occurred.
6. Attempt Current Location: Tries to read keys from your newly configured storage location.
7. Fallback to Old Location: If no keys found, temporarily switches to the old storage configuration and attempts to read keys there.
8. Copy Keys Forward: If keys are found in the old location, stores them in the new location using StoreKeys().
9. Set Migration Flag: Writes a timestamp cookie to prevent future migration attempts.

### Implementation Steps

1. Customize Migration Parameters Modify these variables in MigrateKeys() to match your specific migration scenario:

```csharp
// Configure where to migrate FROM
EStoreKeysTo migrateFromLocation = EStoreKeysTo.ERegistry;
EStoreKeysOptions migrateFromOptions = EStoreKeysOptions.EStoreKeysPerUserAndMachine;
```

2. Configure Your New Storage Location Set your desired storage location in your QLM settings file or during LicenseValidator initialization:

```
license.StoreKeysLocation = EStoreKeysTo.EFileCommonData;
license.StoreKeysOptions = EStoreKeysOptions.EStoreKeysPerUserAndMachine;
```

3. Integrate into Your License Validator&#x20;

Instead of using the default LicenseValidator class, update your code to use MyLicenseValidator which inherits from LicenseValidator and adds the migration code.

```csharp
public MyLicenseValidator() : base()
{
    MigrateKeys();  // Runs on every instantiation, but cookie prevents re-execution
}
public MyLicenseValidator(string settingsFile) : base(settingsFile)
{
    MigrateKeys();  // Runs on every instantiation, but cookie prevents re-execution
}
```

{% file src="../.gitbook/assets/MyLicenseValidator.cs" %}
