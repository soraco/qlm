# SubscribeToMailListHttp

### Description

Subscribes or unsubscribes a user from the mailing list.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://server/qlm/qlmservice.asmx/SubscribeToMailListHttp?is_email=user@cie.com&is_include=1
```
{% endcode %}

### Arguments

| Argument    | Description                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------- |
| is\_email   | customer's email address                                                                       |
| is\_include | 1 to subscribe, 0 to unsubscribe                                                               |
| is\_html    | true \| false. When true, the result is plain html. When false, the result is an XML fragment. |
