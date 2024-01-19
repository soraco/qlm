# How to call CreateLicenseKeyEx2 from ASP?

If you need to call CreateLicenseKeyEx2 (Ex3, Ex4, Ex5) from ASP, note that the LicenseType data type does not work as expected in ASP.

For example, the following code will NOT work:

_key = license.CreateLicenseKeyEx2(expDate, 2, 1, UserDefined, "MyComputer")_

Instead, you will need to use the hexadecimal value of the LicenseType argument. The possible values of the LicenseType are:

Generic = 0x47\
Evaluation = 0x45\
Activation = 0x41\
ComputerName = 0x43\
UserDefined = 0x55

For example, to generate a UserDefined license key, the code would then look like:

_key = license.CreateLicenseKeyEx2(expDate, 2, 1, \&H55, "MyComputer")_
