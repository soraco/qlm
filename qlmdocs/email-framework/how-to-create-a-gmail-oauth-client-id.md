# How to create a Gmail OAuth Client ID

Applies to: QLM Pro v17

***

&#x20;Go to the [Google Cloud Platform Console](https://console.developers.google.com/) and sign in as an administrator.

* From the main dashboard, click **Create Project**.

![Gmail1.jpg](https://ebstalimited.zendesk.com/hc/article\_attachments/360010817058/Gmail1.jpg)

* Enter a project name and select your organization

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/12908729649172)

* Select your new project and go to the **API & Services** section
* Click **+ Enable APIS and Services**

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/12908785952660)

&#x20;

* Enter Gmail in the search field, select the Gmail API option then click **Enable**.

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/12908788353044)

&#x20;

* To create an OAuth Client ID, select Credentials

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/12910549317652)

* Click Create Credentials and select OAuth Client ID

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/12910590024340)

&#x20;

* Set the Application type to Desktop and Click Create

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/12910581287572)

* Make a copy of the Client ID and the Client Secret and store them in a secure location. You will need them to configure QLM.
* Configure the OAuth Consent Screen. This step is required to verify your app registration with Google. Once the app is verified, you should be able to send emails from QLM.

![mceclip4.png](https://support.soraco.co/hc/article\_attachments/12911777901460)
