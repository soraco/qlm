---
description: How to update the ClientVersion / ApplicationVersion
---

# How to update the ClientVersion / ApplicationVersion

The ClientVersion property on the server side stores the specific version of your application that the customer is running. The ClientVersion is typically set upon activation of the license by setting the [ApplicationVersion](../how-to/how-to-set-the-application-version-dynamically.md) property&#x20;

To force the ClientVersion to be updated, you must trigger a reactivation of the license by calling ReactivateLicense.

{% tabs %}
{% tab title="C#" %}
{% code overflow="wrap" %}
```csharp
string dataSet;
string response;
string clientVersion = "1.0.2";
ILicenseInfo li = lv.QlmLicenseObject.GetLicenseInfo(string.Empty, lv.ActivationKey, false, out dataSet, out response);

if (li.ClientVersion != clientVersion)
{
    lv.QlmLicenseObject.ApplicationVersion = clientVersion;
    lv.QlmLicenseObject.ReactivateLicense (string.Empty, lv.ActivationKey, Environment.MachineName, out response);
}
```
{% endcode %}
{% endtab %}

{% tab title="VB.NET" %}
{% code overflow="wrap" %}
```vbnet
Dim dataSet As String
Dim response As String
Dim clientVersion As String
Dim li As ILicenseInfo

clientVersion = "1.0.3"
dataSet = String.Empty
response = String.Empty

li = lv.QlmLicenseObject.GetLicenseInfo(String.Empty, lv.ActivationKey, False, dataSet, response)

If li.ClientVersion <> clientVersion Then
    lv.QlmLicenseObject.ApplicationVersion = clientVersion
    lv.QlmLicenseObject.ReactivateLicense(String.Empty, lv.ActivationKey, Environment.MachineName, response)
End If
```
{% endcode %}
{% endtab %}
{% endtabs %}
