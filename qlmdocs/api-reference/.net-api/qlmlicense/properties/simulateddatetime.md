# SimulatedDateTime

The SimulatedDateTime property can be used for testing purposes to simulate a system date time.

When this property is set, all license validation methods use the SimulatedDateTime instead of the system time to validate a license.

This is useful in testing the epxiry of licenses.

Example:

LicenseValidator lv = new LicenseValidator (settingsFile);

// Simulate Jan 1 2019.

lv.QlmLicenseObject.SimulatedDateTime = new DateTime(2019, 1, 1);

lv.ValidateLicenseAtStartup (...);
