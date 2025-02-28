# TLS 1.2 Requirements

### Overview

As of June 30, 2025, the QLM License Server that we host to activate your QLM licenses will no longer accept connections from client computers that do not support TLS 1.2 or higher. Additionally, if your own License Server is hosted by Soraco Technologies, your server will no longer accept connections from client computers that do not support TLS 1.2 or higher.

This can impact you at two levels:

* If you are using an older version of the QLM Management Console prior to QLM v11
* If your application is using .NET Framework 4.52 and your QLM License Server is hosted by Soraco Technologies.
* If your application is using .NET Framework < 4.52 and your QLM License Server is hosted&#x20;

### Older versions of the QLM Mangement Console

If you are using a QLM version prior to v11, connection to the QLM License Server will most likely fail.&#x20;

Your options are:

1. Upgrade to the latest version of QLM (if you did not purchase a maintenance plan, you will need to purchase a subscription to the latest version of QLM).
2. Update your computer's registry as follows:
   1. Launch regedit
   2. Go to: HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft.NETFramework\v4.0.30319
   3. Add a new DWORD (32 bit) value named `SchUseStrongCrypto` and set its value to `1`.
   4. Go to: HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Microsoft.NETFramework\v4.0.30319
   5. Add a new DWORD (32 bit) value named `SchUseStrongCrypto` and set its value to `1`.
   6. Reboot your computer

### Apps running .NET Framework version 4.52

If your application is using a .NET Framework 4.52 , you can explicitly add the following line of code to your application (C#) to enable support for TLS 1.2:

{% code overflow="wrap" %}
```csharp
ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
```
{% endcode %}

### Apps running .NET Framework version < 4.52

You will need to update your application to use a more recent version of .NET

### How to test your application&#x20;

To test whether your application will work with a server that has TLS 1/1.1 disabled, you can connect your application to the QLM Disaster Recovery Server. When you subscribed to the QLM License Server Hosting service, you were provided with a URL to your QLM Disaster Recovery Server.&#x20;

The QLM Disaster Recovery Server is already configured to reject TLS 1/1.1 requests.&#x20;

If you do not know the URL to your QLM Disaster Recovery Server, please contact our support team at support@soraco.co







