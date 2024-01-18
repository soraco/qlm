# How to configure and test MaxDaysOffline

MaxDaysOffline allows you to require your customers to go online every _x_ days to perform server side license validation.

To test this feature without waiting a full day while being offline, add the following code to your application, **after** the license has been successfully validated:

```
// Assuming lv is an instance of the LicenseValidator class

lv.QlmLicenseObject.MaxDaysOffline = 0;
lv.QlmLicenseObject.SimulateNoConnectivity = true;
lv.QlmLicenseObject.OfflinePeriodExceededAction = EOfflinePeriodExceededAction.FireEvent;
lv.QlmLicenseObject.OfflinePeriodExceeded_Event += QlmLicenseObject_OfflinePeriodExceeded_Event;
lv.QlmLicenseObject.QlmTimerDelayStart = 1;
lv.QlmLicenseObject.QlmTimerFrequency = 1;


private void QlmLicenseObject_OfflinePeriodExceeded_Event(object sender, OfflinePeriodExceeded_EventArgs e)
{
   MessageBox.Show(e.errorMessage); 
}
```

&#x20;

With the code above, after about 1 minute from the execution of that code, the OfflinePeriodExceeded\_Event will fire.

The settings above are to be used strictly for testing purposes.
