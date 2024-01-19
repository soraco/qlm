# QLM WebHooks

With QLM Enterprise v11, QLM can invoke external webhooks when certain events occur.

Events fall into two general categories:

* License events: these events pertain to changes to the license keys data.
* Customer events: these events pertain to changes to the customer's data.&#x20;

### License Events

| **Event**          | **Description**                                   |
| ------------------ | ------------------------------------------------- |
| license\_activated | Event that occurs when a license is activated.    |
| license\_created   | Event that occurs when a license is created.      |
| license\_deleted   | Event that occurs when a license is deleted.      |
| license\_released  | Event that occurs when a license is deactivated.  |

&#x20;

### Customer Events

| **Event**          | **Description**                                 |
| ------------------ | ----------------------------------------------- |
| customer\_created  | Event that occurs when a customer is created.   |
| customer\_deleted  | Event that occurs when a customer is deleted.   |
| customer\_modified | Event that occurs when a customer is modified.  |

### &#x20;Configuring WebHooks

To configure your webhooks:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Go to the Server Properties tab
* Locate the **webhook events** section (if you do not see this section and you are running QLM Enterprise v11, upgrade your DB schema from the General tab in the same editor, then close the editor and reopen it).
* For each event, set the URL of the webhook that you wish to invoke. If you need to invoke more than one webhook per event, separate the URLs with a semi-comma.
* Click Ok

### WebHooks Payload

When a webhook is invoked, QLM sends a JSON payload with specific information about the affected object along with the event type.&#x20;

To verify the authenticity of the request, the webhook request header includes a SHA256 value of the request's content + a secret key. The hash value is stored in a header entry called: X-QLM-Signature

### WebHooks Settings

WebHooks settings allow you to control the behavior of webhooks processing.

#### Retry Mechanism

If a webhook invocation fails, QLM adds the webhook call to a retry queue and will retry at a regular interval for a period of time, as specified in the webhook settings.

#### Logging

All webhook invocations are logged by QLM and stored in a log table.

#### Configuration

To configure your webhook settings:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Go to the Server Properties tab
* Locate the **webhook settings** section (if you do not see this section and you are running QLM Enterprise v11, upgrade your DB schema from the General tab in the same editor, then close the editor and reopen it).

| **Setting**          | **Description**                                                                                                                                                                |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| webHookMaxRetries    | Specifies the number of times to retry invoking a webhook if it failed.                                                                                                        |
| webHookRetryInterval | Specifies the retry interval in seconds.                                                                                                                                       |
| webHookSecretKey     | Specifies a secret key that you can use to validate the authenticity of the webhook request. The request header will contain the SHA256 value of the content + the secret key. |
| webHooksEnabled      | Enables or disables all webhooks.                                                                                                                                              |
