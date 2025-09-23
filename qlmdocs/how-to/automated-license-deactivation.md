# Automated License Deactivation

### Overview

QLM Activation Keys are bound to a user or a computer. To allow your customers to share an Activation Key between different users/computers, you could allow them to forcefully deactivate the license of another user and take it over. The steps below provides guidance on how to accomplish that.

Assuming a customer has an Activation Key that can be used on a single computer, if the license is activated on Computer A, it cannot be used on Computer B without deactivating from A.

To deactivate A, you can follow one of the following methods:

* Display the QLM built-in Deactivation Form and allow the user to deactivate a computer (available on Windows / C# / VB.NET only)
* Use the QLM API to deactivate the license from A

### QLM Deactivation Form Method

The QLM Deactivation Form is a simple window that displays the currently activated computers and allow the user to deactivate them.

{% code overflow="wrap" %}
```csharp
// Assuming lv is an instance of the LicenseValidator class

// Set the computerID to the unique identifier that you are using for node locking
string computerID = Environment.MachineName;

// The deactivation form displays all the computers on which this license is activated
// and allows the user to deactivate any of the activated systems
QlmDeactivateFrm frm = new QlmDeactivateFrm(lv.QlmLicenseObject, lv.ActivationKey, computerID);
frm.ShowDialog(this);
```
{% endcode %}

### QLM Deactivation API Method

To use the QLM API to deactivate licenses, you must first get the list of computers on which the license is activated, then you can deactivate the computer of your choice.

{% code overflow="wrap" %}
```csharp
// Assuming lv is an instance of the LicenseValidator class

// Set the computerID to the unique identifier that you are using for node locking
string computerID = Environment.MachineName;

string errorMessage;
ILicenseInfo[] liList = lv.QlmLicenseObject.GetActivatedSystems(string.Empty, lv.ActivationKey, out errorMessage);

if (liList != null)
{
    foreach (ILicenseInfo li in liList)
    {
        if (String.Compare(li.ComputerID, computerID, true) != 0)
        {
            // If you want to deactivate the first computer in the list
            string deactivateComputerID = lvi.Text;
            string response;                    
            lv.QlmLicenseObject.ReleaseLicense(
                                string.Empty,
                                lv.ActivationKey,li.ComputerID, string.Empty, 
                                false, false, out response);
            
            ILicenseInfo li = new LicenseInfo();
            string message = string.Empty;
            
            if (license.ParseResults(response, ref li, ref message))
            { 
                // The deactivation was successful
            }
            else
            {
                // The deactivation failed
                MessageBox.Show(this, message, license.ProductName,
                                MessageBoxButtons.OK, MessageBoxIcon.Error);
            }                        
        }
    }
}
```
{% endcode %}
