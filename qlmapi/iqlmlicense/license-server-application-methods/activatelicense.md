# ActivateLicense

### Description

Activates a license key over the internet.

```c#
void ActivateLicense (string webServiceUrl, string activationKey, 
                      string computerID, string computerName,
                      string qlmVersion, string userData1, out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                              |
| ------------- | :----: | ------------------------------------------------------------------------ |
| webServiceUrl | string | URL to the QLM License Server.                                           |
| activationKey | string | The license key to activate                                              |
| computerID    | string | The unique computer identifier                                           |
| computerName  | string | The name of the computer. This argument is not required but recommended. |
| qlmVersion    | string | The version of the QLM Engine                                            |
| userData1     | string | User data to associate with the license key                              |
| response      | string | XML fragment containing the result of the call.                          |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<pckey>C06C4C90A497F091C2F080501000C076A0578E</pckey>
<userCompany>My Company</userCompany>
<userFullName>John Smith</userFullName>
<userEmail>john@smith.com</userEmail>
</QuickLicenseManager>
```

### Example error response

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

### Remarks

You must call [DefineProduct ](https://soraco.readme.io/reference/defineproduct)before calling this function.

### Example

{% code overflow="wrap" %}
```c#
private void ActivateLicense(string activationKey, ref string message)
{ 
     string computerID = Environment.MachineName;
     bool needsActivation = false;


     if (lv.ValidateLicense (activationKey, string.Empty, ref computerID, ELicenseBinding.ComputerName, ref needsActivation, ref message) == false)
     {

         if (lv.WrongProductVersion || lv.EvaluationExpired || needsActivation )
         {
             string response;
             lv.QlmLicenseObject.ActivateLicense(string.Empty, activationKey, computerID, Environment.MachineName, "5.0.00", string.Empty, out response);

             ILicenseInfo li = new LicenseInfo();
             string message = string.Empty;
             if (lv.QlmLicenseObject.ParseResults(response, ref li, ref message))
             {
                 lv.QlmLicenseObject.StoreKeys(activationKey, li.ComputerKey);
             }
         }
      }
}
```
{% endcode %}
