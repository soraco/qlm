# FloatingLicenseMaxOfflineDuration

Set or get the maximum duration a floating license can remain offline, in hours.

After this period expires, the license is no longer considered offline.

When the MaxOfflineDuration period is exceeded, the license validation will attempt to contact the floating license database. If it cannot contact the DB, a violation event will be fired.
