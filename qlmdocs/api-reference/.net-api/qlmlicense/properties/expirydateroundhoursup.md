# ExpiryDateRoundHoursUp

The expiry date embedded in a license key does not include the time component of the expiry. Hence, when evaluating the number of days left for a license, any time that is less than a day can either be rounded up to a day or ignored.

The default is to round up to a day.

The ExpiryDateRoundHoursUp property allows you to control this behaviour.
