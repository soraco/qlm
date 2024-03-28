# ValidateOnServer

Set or get whether QLM should contact the License Server to validate the license.

This property is used in 2 scenarios:

* When calling the LicenseValidator.ValidateLicenseAtStartup
* If [MaxDaysOffline](https://support.soraco.co/hc/en-us/search/click?data=BAh7CjoHaWRsKwjOHuLGGgA6CXR5cGVJIgxhcnRpY2xlBjoGRVQ6CHVybEkiPi9oYy9lbi11cy9hcnRpY2xlcy8xMTUwMDU4NTc0ODYtUWxtTGljZW5zZS1NYXhEYXlzT2ZmbGluZQY7B1Q6DnNlYXJjaF9pZEkiKTYwN2E0ZTg5LTQwMzYtNDMyZS1hZDVjLTk5OTI3YjQ5NGQ1ZAY7B0Y6CXJhbmtpBg%3D%3D--2c01feba53fceeb6a605ed3897688defccb3b0ca) is set to a value > 0, a QLM timer automatically connects to the License Server once per day to perform server-side validation. If the server-side validation fails, QLM performs the action specified in the [OfflinePeriodExceededAction](https://support.soraco.co/hc/en-us/search/click?data=BAh7CjoHaWRsKwhGH%2BLGGgA6CXR5cGVJIgxhcnRpY2xlBjoGRVQ6CHVybEkiZWh0dHBzOi8vc3VwcG9ydC5zb3JhY28uY28vaGMvZW4tdXMvYXJ0aWNsZXMvMTE1MDA1ODU3NjA2LVFsbUxpY2Vuc2UtT2ZmbGluZVBlcmlvZEV4Y2VlZGVkQWN0aW9uLQY7B1Q6DnNlYXJjaF9pZEkiKTNlOGRiNGM2LTMzNTYtNGEzOS1hNGMzLTNkZWY0ODQwYzgwMgY7B0Y6CXJhbmtpBg%3D%3D--0c02c543ca55572bc9063572dba0c58506f8e306).&#x20;
