# How to enable TLS 1.2 on legacy systems

### Overview

As of June 30, 2025, the QLM License Server that we host to activate your QLM licenses will no longer accept connections from client computers that do not support TLS 1.2. Additionally, if your own License Server is hosted by Soraco Technologies, your server will no longer accept connections from client computers that do not support TLS 1.2.

This can impact you at two levels:

* If you are using an older version of QLM prior to QLM v11
* If your application is using .NET Framework 4.52 or earlier and your QLM License Server is hosted by Soraco Technologies.

### Older versions of QLM

If you are using QLM version prior to v11, connection to the QLM License Server will most likely fail. If it does, you will need to update your computer's registry as follows:

* Launch regedit
* Go to: HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft.NETFramework\v4.0.30319
* Add a new DWORD (32 bit) value named `SchUseStrongCrypto` and set its value to `1`.
* Go to: HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Microsoft.NETFramework\v4.0.30319
* Add a new DWORD (32 bit) value named `SchUseStrongCrypto` and set its value to `1`.
* Reboot your computer

### Apps running .NET Framework version 4.5

If your application is using a .NET Framework 4.5 , you will need to explicitly add the following line of code to your application (C#):

{% code overflow="wrap" %}
```csharp
ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
```
{% endcode %}

### Apps running .NET Framework version < 4.5

You will need to update your application to use a more recent version of .NET





