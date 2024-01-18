# SubscribeToMailListHttp

### Description

Subscribes or unsubscribes a user from the mail list.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://server/qlm/qlmservice.asmx/SubscribeToMailListHttp?is_email=user@cie.com&is_include=1
```

### Arguments

\[block:parameters] { "data": { "h-0": "Argument", "h-1": "Description", "0-0": "is\_email", "0-1": "customer's email address", "1-0": "is\_include", "1-1": "1 to subscribe, 0 to unsubscribe", "2-0": "is\_html", "2-1": "when true, the result is plain html. When false, the result is an XML fragment. \nFacebook Twitter LinkedIn" }, "cols": 2, "rows": 3, "align": \[ "left", "left" ] } \[/block]
