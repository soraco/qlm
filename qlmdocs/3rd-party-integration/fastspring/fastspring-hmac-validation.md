# Fastspring HMAC validation

FastSpring allows you to use a secret key to ensure that the payload received by the QLM License Server was indeed sent by FastSpring.

For more details about FastSpring's security, you can review these articles:

* [Message / Secret Security for webhooks ](https://fastspring.com/docs/webhooks/) (FP Contextual)
* [Fulfillment security](https://fastspring.com/docs/fulfillments/)

### Webhook security

To configure webhook security (only required for FastSpring Contextual):

* In Fastspring, go to Integrations / Webhooks
* Edit the QLM Endpoint that you created
* Locate the HMAC SHA256 Secret field and copy the value to the clipboard
* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions and then select FastSpring
* Paste the HMAC SHA256 Secret value in the **Shared Key** field.

### Fulfillment security

To configure security for each fulfillment:

* In FastSpring, for a given product, locate the QLM fulfillment that you already created
* Edit the fulfillment and go to the Security tab
* Locate the Private Key field and copy the value to the clipboard
* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions and then select FastSpring
* Paste the HMAC SHA256 Secret value in the **API Key** field.

Note that QLM supports a single private key for all FastSpring products so you must configure all your products in FastSpring to have the same private key.
