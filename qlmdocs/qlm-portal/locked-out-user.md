# Locked out user

If a user attempts to log in to the portal with an invalid password, the account will be locked out after 5 attempts.

In order to unlock the account, you have 3 options:

1. If you are using QLM v11 or later, you can unlock the account from the QLM Management Console
2. Delete the user account and recreate it
3. Unlock the account by editing the QLM database

&#x20;How to unlock a user account from the QLM Management Console (v11+)

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click User Accounts
* Select the user account then click Unlock

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360035520851/mceclip0.png)

&#x20;How to unlock the account by editing the QLM database

* Locate the QLM database in SQL Server
* In the QLM database, locate the aspnet\_Users table
* View all the rows of this table and locate the user that is locked out.
* Make note of that user's UserID&#x20;
* Execute the following SQL command:

{% code overflow="wrap" %}
```sql
UPDATE [aspnet_Membership] SET [IsLockedOut]=0,[FailedPasswordAttemptCount] = 0 WHERE UserID='The USER ID OF THE LOCKED OUT USER'
```
{% endcode %}
