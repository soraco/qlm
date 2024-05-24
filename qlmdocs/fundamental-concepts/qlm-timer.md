# QLM Timer

The QLM Timer is a client-side timer automatically created when you create an instance of the QlmLicense object.

The timer is a background process that performs the following tasks:

* Validates the license on the server
* Enforces the MaxDaysOffline property

By default, the timer is configured to trigger once per day.

You can control the frequency of the timer by setting the [QlmTimerFrequency ](https://docs.soraco.co/docs/api-reference/.net-api/qlmlicense/properties)property. You can also delay the start time by setting the [QlmTimerDelayStart ](https://docs.soraco.co/docs/api-reference/.net-api/qlmlicense/properties)property.
