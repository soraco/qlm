# QLM on Non-Windows Platforms

QLM Enterprise supports protecting non Windows applications such as Android, Mac, Java, etc.

Some of the features that are available to Windows apps may not be available on other platforms. This document covers the Windows features that are not currently available on non Windows platforms. Note that many of these features can be implemented at the application level.

&#x20;

<table><thead><tr><th width="307.3333333333333">Feature</th><th width="137">Windows</th><th>Non-Windows</th></tr></thead><tbody><tr><td>QLM License Wizard and User Controls</td><td>√</td><td> </td></tr><tr><td>Extensive .NET API for administrative operations</td><td>√</td><td> </td></tr><tr><td>Analytics API</td><td>√ </td><td> </td></tr><tr><td>Floating or concurrent licensing scheme</td><td>√</td><td> </td></tr><tr><td>Built-in license binding to common hardware identifiers. On non-windows platforms, you need to use UserDefined LicenseBinding and extract the unique identifier of your choice.</td><td>√</td><td> </td></tr><tr><td>Automatic detection and enforcement of the maximum period a user can remain offline.</td><td>√</td><td> </td></tr><tr><td>Automatic redirection to a Disaster Recovery site.</td><td>√</td><td> </td></tr><tr><td>StoreKeys and ReadKeys methods to store the license keys in common locations. On non-Windows platforms, you must store the license key to the appropriate OS specific store.</td><td>√</td><td> </td></tr></tbody></table>
