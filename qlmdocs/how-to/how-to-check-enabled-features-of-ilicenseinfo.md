# How to check enabled features of ILicenseInfo

The normal procedure to check if a feature is enabled is by calling QlmLicense.IsFeatureEnabledEx. In some cases, you might have a ILicenseInfo object and would like to check the ennabled features.

The code below shows how to check which features are enabled in an ILicenseInfo object. The ILicenseInfo object can be created by calling GetLicenseInfo.

{% tabs %}
{% tab title="C#" %}
{% code overflow="wrap" %}
```csharp
ILicenseInfo li = lv.QlmLicenseObject.GetLicenseInfo(string.Empty, lv.ActivationKey, false, out string ds, out string response);

int[] enabledFeatures = lv.QlmLicenseObject.ConvertFeaturesToArray(li.Features);

if ((enabledFeatures[0] & 1) != 0)
{
    Console.WriteLine("Feature Set 0, Feature ID 1 is enabled");
}

if ((enabledFeatures[0] & 2)  != 0)
{
    Console.WriteLine("Feature Set 0, Feature ID 2 is enabled");
}

if ((enabledFeatures[0] & 4) != 0)
{
    Console.WriteLine("Feature Set 0, Feature ID 4 is enabled");
}
```
{% endcode %}
{% endtab %}

{% tab title="C++" %}
{% code overflow="wrap" %}
```cpp
CComBSTR ak = m_lv->GetActivationKey();
if ((ak.m_str != nullptr) && (ak.Length() > 0))
{
	CComBSTR bstrDataSet;
	CComBSTR bstrResponse;

	ILicenseInfo* li = m_lv->license->GetLicenseInfo(_T(""), _bstr_t(ak), 			
				VARIANT_FALSE, &bstrDataSet, &bstrResponse);

	SAFEARRAY* enabledFeatures = m_lv->license->ConvertFeaturesToArray (li->Features);

	long* pFeatures = nullptr;
	HRESULT hr = SafeArrayAccessData(enabledFeatures, (void**)&pFeatures);
	if (SUCCEEDED(hr))
	{
		if ((pFeatures[0] & 1) != 0)
		{
			OutputDebugString(_T("Feature Set 0, Feature ID 1 is enabled\n"));
		}

		if ((pFeatures[0] & 2) != 0)
		{
			OutputDebugString(_T("Feature Set 0, Feature ID 2 is enabled\n"));
		}

		if ((pFeatures[0] & 4) != 0)
		{
			OutputDebugString(_T("Feature Set 0, Feature ID 4 is enabled\n"));
		}

		SafeArrayUnaccessData(enabledFeatures);
	}
	SafeArrayDestroy(enabledFeatures);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

{% code overflow="wrap" %}
```csharp


```
{% endcode %}
