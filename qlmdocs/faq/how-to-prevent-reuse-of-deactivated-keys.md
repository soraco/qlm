# How to prevent reuse of deactivated keys

If you are using the QLM License Wizard, the wizard automatically prevents an end-user from reusing deactivated keys.

If you have implemented your own user interface for activation/deactivation, and would like to prevent end-users from reusing deactivated keys, you will need to implement this functionality in your own user interface as shown below.

* Add the 2 functions below to your project
* After you deactivate a license, call StoreDeactivateKey
* Before you activate a license, call IsDeactivatedKey. If the key has been deactivated, display an error to the user.

{% code overflow="wrap" %}
```csharp
private void StoreDeactivatedKey(QlmLicense license, string computerKey)
{
 try
 {
     // we will store the deactivated computerkey on the system and prevent the user from reusing it
   bool userLevelResult;
   bool machineLevelResult;
   string errorMessage1;
   string deactivatedKeys = string.Empty;
   license.ReadCookie("DeactivatedKeys", 0, out deactivatedKeys);

   if (!String.IsNullOrEmpty(deactivatedKeys))
   {
     deactivatedKeys += ";";
   }
   deactivatedKeys += this.computerKey.Replace("-", "").Trim ();

   license.StoreCookie(deactivatedKeys, "DeactivatedKeys", 0, out userLevelResult, out machineLevelResult, out errorMessage1);
 }
 catch { }
 }

private bool IsDeactivatedKey (QlmLicense license, string newkey)
{
 try
 {
     newkey = newkey.Replace("-", "").Trim ();
     // Check if this is a deactivated key
     string deactivatedKeys;
     license.ReadCookie("DeactivatedKeys", 0, out deactivatedKeys);

     if (!String.IsNullOrEmpty(deactivatedKeys))
     {
         char[] sep = { ';' };
         string[] keys = deactivatedKeys.Split(sep, StringSplitOptions.RemoveEmptyEntries);
         foreach (string key in keys)
         {
             if (String.Compare(key, newkey, true) == 0)
             {
                return true;
             }
          }
      }
 }
 catch { }

 return false; 
 }
```
{% endcode %}
