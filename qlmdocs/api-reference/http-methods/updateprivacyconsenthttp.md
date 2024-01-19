# UpdatePrivacyConsentHttp

### Description

Updates the privacy consent of a customer.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdatePrivacyConsentHttp?is_avkey=ABCD-EFGH-IJKL&is_email=customer@company.com&is_consent=1
```

### Arguments

| Argument    | Description                                                           |
| ----------- | --------------------------------------------------------------------- |
| is\_avkey   | activation key                                                        |
| is\_email   | customer's email address                                              |
| is\_consent | 0 \| 1, where 0 means consent is denied and 1 means consent is given. |
