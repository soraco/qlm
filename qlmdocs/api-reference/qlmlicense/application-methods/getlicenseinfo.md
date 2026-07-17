# GetLicenseInfo

### Description

Retrieves information about an Activation Key.

```csharp
  ILicenseInfo GetLicenseInfo (string webServiceUrl, 
                               string activationKey, 
                               bool historyTable, 
                               out string dataSet, 
                               out string response)
```

### Parameters

| Parameter     |    Type    | Description                                        |
| ------------- | :--------: | -------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                      |
| activationKey |   string   | the license key to activate                        |
| historyTable  |    bool    | search for the activation key in the history table |
| dataSet       | out string | data set returned by the server                    |
| response      | out string | result of the call to the server.                  |

### Return

| Type                                | Description                   |
| ----------------------------------- | ----------------------------- |
| [ILicenseInfo](../../ilicenseinfo/) | information about the license |

## Remarks

To parse the data returned in dataSet, check this [article](https://support.soraco.co/hc/en-us/articles/200704985-How-to-parse-data-returned-by-GetDataSet-or-GetDataSetEx-).

### C# Example

{% tabs %}
{% tab title="C#" %}
<pre class="language-csharp"><code class="lang-csharp"><strong>ILicenseInfo li = license.GetLicenseInfo (webServiceUrl, "A2GM0-50K00-PYU3F-784HH-1U1V5T", 
</strong>                                           false, out dataSet out response);
if (li != null)
{
    int numLicenses = li.NumLicenses;
    int availableLicenses = li.AvailableLicenses;
}
</code></pre>
{% endtab %}

{% tab title="VBA" %}
```vb
Dim ds As String
Dim response As String
Dim licenseInfo As Object
    
Set licenseInfo = lv.LicenseObject.GetLicenseInfo("", lv.ActivationKey, False, ds, response)
    
MsgBox ("Order Date: " & licenseInfo.OrderDate)
```
{% endtab %}
{% endtabs %}
