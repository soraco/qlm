# How to call UpdateLicenseInfo and update UserData with an XML fragment

The syntax for calling UpdateLicenseInfo and update the UserData with an XML fragment is a bit tricky.

Here's an example:

```
// This is the user data we want to set
string userData = "<Test>abc</Test><Data>mydata</Data>";

// We must escape the xml data
string escapedUserData = SecurityElement.Escape (userData);

// You can specify multiple properties in the licenseArguments tag. Here we're only setting one attribute.
// Note the UserData1 attribute value is prefixed with  \" followed by a single quote ' and then suffixed with a single quote ' followed by \".
string licenseUpdateData = String.Format ("<licenseArguments UserData1=\"'{0}'\" />", escapedUserData);

// Call the web service
license.UpdateLicenseInfo (webServiceUrl, activationKey, licenseUpdateData, out response);

// Analyze the results
ILicenseInfo li = new LicenseInfo();
string msg = string.Empty;
if (target.ParseResults(response, ref li, ref msg))
{

}
```

&#x20;

**Note:** if the value that you are setting contains a single quote, you must escape the single quote with another single quote. For example, to set a value to "Mary's Lamb", set the value to "Mary''s lamb".
