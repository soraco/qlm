# How to create a Gmail Service account

Applies to: QLM Pro v17

***

A Gmail Service account is required when sending emails from the QLM License Server, the QLM Portal or the QLM Self Help. To create a Gmail service account you must have a Google Workspace (G Suite) account.



Go to the [Google Cloud Platform Console](https://console.developers.google.com/) and sign in as an administrator.

* From the main dashboard, click **Create Project**.

![Gmail1.jpg](https://ebstalimited.zendesk.com/hc/article\_attachments/360010817058/Gmail1.jpg)

* Enter a project name and select your organization

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/12908729649172)

* Select your new project and click **+ Enable APIS and Services**

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/12908785952660)

&#x20;

* Enter Gmail in the search field, select the Gmail API option then click **Enable**.

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/12908788353044)

&#x20;

* To create the service account, select Service Accounts as shown below:

![mceclip5.png](https://support.soraco.co/hc/article\_attachments/12908833744020)

* Click Create Service Account

![mceclip6.png](https://support.soraco.co/hc/article\_attachments/12908886892948)

&#x20;

* Enter a name for your account then click Create and Continue

![mceclip7.png](https://support.soraco.co/hc/article\_attachments/12908890675348)

* Leave all the default options for the Service Account Details and click Done.

![mceclip8.png](https://support.soraco.co/hc/article\_attachments/12908927312020)

* Copy the Client ID
* Select Manage Keys as shown below:

![mceclip14.png](https://support.soraco.co/hc/article\_attachments/12909135592852)

* Click Add Key / Create new key

![mceclip10.png](https://support.soraco.co/hc/article\_attachments/12908934725524)

* Select JSON for the key format and click Create

![mceclip11.png](https://support.soraco.co/hc/article\_attachments/12908987151636)

* Store the generated JSON file securely. You will need it later on when configuring QLM.
* &#x20;
* Next, you must enable service accounts with Gmail.&#x20;
* Login to the [GSuite Admin Console](https://admin.google.com/).
* Scroll down to locate the **Security** item and select it

![mceclip12.png](https://support.soraco.co/hc/article\_attachments/12909030632212)

* Scroll down to locate the **API Controls** item and select it
* Click Manage Domain Wide Delegation

![mceclip13.png](https://support.soraco.co/hc/article\_attachments/12909034919956)

* Click Add New
* Enter the Client ID that you copied earlier
* Set the authorization scope to: [https://www.googleapis.com/auth/gmail.send](https://www.googleapis.com/auth/gmail.send)
* Click Authorize

![mceclip15.png](https://support.soraco.co/hc/article\_attachments/12909290127636)
