---
description: >-
  This article describes the recommended procedure for excluding specific
  customers from receiving email notifications that are triggered by QLM's
  scheduled tasks.
---

# How to exclude customers from email notifications

When configuring scheduled tasks, you must select a "search" that returns a list of license keys based on criteria specified in the search as shown in the screenshot below.

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1).png" alt=""><figcaption><p>Scheduled Tasks</p></figcaption></figure>

It is recommended that all "searches" include the following statement in the SQL field:&#x20;

```sql
IncludeInMailList <> 0
```

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>Search configuration</p></figcaption></figure>

Finally, to configure a customer to not receive email notifications, edit the customer information and uncheck the "Mail List" field.

<figure><img src="../.gitbook/assets/image (3) (1).png" alt=""><figcaption><p>Customer Information</p></figcaption></figure>

