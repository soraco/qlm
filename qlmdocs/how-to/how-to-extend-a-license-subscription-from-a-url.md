# How to extend a license subscription from a URL

You can extend a license subscription by invoking the _RenewSubscriptionHttp_ method as follows:

http://yourserver.com/qlm/qlmservice.asmx/RenewSubscriptionHttp?is\_avkey=ABC-DEF-GHI\&is\_expduration=\<duration>\&is\_expdate=\<yyyy-mm-dd>

You can set one and only one of the expiry arguments: is\_expdate or is\_expduration.

When setting the _is\_expdate_ argument, the expiry date is absolute. The new expiry date will be set to the date you specified regardless of the previous value.

When setting the _is\_expduration_ argument, the expiry date is incremental. The new expiry date will be set to the previous value plus the new duration.

**Examples:**

{% code overflow="wrap" %}
```http

https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx
/RenewSubscriptionHttp?is_avkey=BDHD0-X0K00-G5AK6-I8W4J-1Q1AKMAHN&is_expduration=90


https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx
/RenewSubscriptionHttp?is_avkey=BDHD0-X0K00-G5AK6-I8W4J-1Q1AKMAHN&is_expdate=2014-12-31

```
{% endcode %}
