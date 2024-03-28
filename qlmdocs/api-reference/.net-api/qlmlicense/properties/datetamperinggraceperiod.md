# DateTamperingGracePeriod

QLM can detect date tampering on a client's computer without an internet connection by comparing the current system date with the date the application last ran.

The DateTamperingGracePeriod allows you to control how strict the algorithm should be when detecting date tampering.

By default, the grace period is set to 1.&#x20;

To provide stricter control, you should set the grace period to 0.

When QLM detects date tampering, which occurs when the user sets the date of the system back in time, the ValidateLicense APIs will return a date tampering error.
