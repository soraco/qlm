# How to fire an event when MaxDaysOffline is reached

When the MaxDaysOffline period is exceeded, QLM executes the action specified in the property OfflinePeriodExceededAction.

If your application is developed in .NET, one of the possible actions is to fire an event. To fire an event when MaxDaysOffline is reached, you must create an event handler and register it as follows:

{% code overflow="wrap" %}
```csharp
private void RegisterEvent()
{
    // Assuming lv is an instance of the LicenseValidator class

    // Configure QLM to fire an event
    lv.QlmLicenseObject.OfflinePeriodExceededAction = EOfflinePeriodExceededAction.FireEvent;

    //Specify the event to fire
    lv.QlmLicenseObject.OfflinePeriodExceeded_Event += OnOfflinePeriodExceeded;

    // Enable server side validation
    lv.QlmLicenseObject.ValidateOnServer = true;
}

private void OnOfflinePeriodExceeded(object sender, OfflinePeriodExceeded_EventArgs e)
{
    String msg = String.Format("Offline period exceeded. Error: {0}", e.errorMessage);
    MessageBox.Show(msg);
}
```
{% endcode %}

&#x20;

By default, while the application is running, QLM will try to connect to the server once per day. For testing purposes, you will want to accelerate this process. Add the function below to your application and call it after calling RegisterEvent(). Remember to remove the call to MaxDaysOfflineTest before shipping your product.

&#x20;

{% code overflow="wrap" %}
```csharp
private void MaxDaysOfflineTest()
{
    // Assuming lv is an instance of the LicenseValidator class

    // Start the timer immediately
    lv.QlmLicenseObject.QlmTimerDelayStart = 0;

    // Verify connectivity every minute
    lv.QlmLicenseObject.QlmTimerFrequency = 1;

    // specify the number of days a client can remain offline
    lv.QlmLicenseObject.MaxDaysOffline = 0;

    // Enable NO connectivity simulation mode
    lv.QlmLicenseObject.SimulateNoConnectivity = true;
}
```
{% endcode %}
