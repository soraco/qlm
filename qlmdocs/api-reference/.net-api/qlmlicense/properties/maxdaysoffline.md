# MaxDaysOffline

Set or get the number of days the app can work offline. ValidateOnServer must be true for this setting to take effect.

If MaxDaysOffline is -1, the application can work offline indefinitely.

If MaxDaysOffline is 0, the application must be online all the time.

When the MaxDaysOffline threshold is reached, the action defined in OfflinePeriodExceededAction is executed.
