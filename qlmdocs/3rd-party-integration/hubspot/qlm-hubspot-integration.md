# QLM HubSpot Integration

_The QLM HubSpot App is available on demand only as of QLM v15.0.21149.1._\
\
_Contact us if you are interested in evaluating our Beta version. Note that a special license key is required to use the HubSpot integration._

***

The QLM HubSpot App allows you to view license information associated with a customer directly from within HubSpot as a CRM Card.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360096913852)

&#x20;

### HubSpot Configuration

A [HubSpot CRM Card](https://developers.hubspot.com/docs/api/crm/extensions/custom-cards) (HCC) allows information from other systems, such as Quick License Manager, to appear on HubSpot contact, company, deal, or ticket records. A HCC makes an outbound request to the external server (Data Fetch URL), retrieves the relevant data, and displays it in a card on the record page.&#x20;

Due to the HubSpot CRM Card design, a HubSpot App / CRM Card (HCC) cannot be configured to point to a custom License Server (Data Fetch URLs) in order to retrieve data. When a HCC is created, it can be configured to point to a specific Data Fetch URL but once the HCC is installed in a specific account, the Data Fetch URL cannot be customized to point to a specific URL. The implication of this HCC design is that we cannot create a  single HCC that can be used by all customers where each customer would configure the URL to their License Server. Therefore, in order to use the QLM HubSpot integration, you must create your own HCC as outlined below. We realize these steps might be too complex for the average user and are communicating with HubSpot to determine if a change in their design is possible. Note that in order to create an HCC, you will need to create a developer account.

&#x20;

#### Developer Account Creation

* Create a HubSpot developer account
* Login to your developer account&#x20;

#### App Creation

* Click "Apps"
* Click "Create app"
* Set the Public app name to: QLM for HubSpot
* Set a logo as required
* Go to the Auth tab
* Set the Redirect URLs to your company's web site (replace soraco.co below with your company's web site)

![](https://support.soraco.co/hc/article\_attachments/16866065365012)

&#x20;

* Set the Required Scope to:
  * tickets
  * crm.schemas.deals.read
  * crm.lists.read
  * crm.lists.write
  * crm.objects.contacts.read
  * crm.objects.companies.read
  * crm.objects.deals.read
  * crm.objects.deals.write
  * crm.schemas.contacts.read
  * crm.schemas.companies.read

![](https://support.soraco.co/hc/article\_attachments/16866056874132)

* Click Save

#### CRM Card Creation

* Click "CRM Cards" in the Features section
* Click Create CRM Card
* Set the name of the CRM Card to: QLM
* Set the Data fetch URL to (update it to point to your server): qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/QlmWebHookHandler?is\_vendor=hubspot
* In the Target records types, select: Contacts then set the "Properties sent from HubSpot" to company and email (as per the screenshot below)
* In the Target records types, select: Companies then set the "Properties sent from HubSpot" to name (as per the screenshot below)
* Click Save

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360097054172)

To have the CRM Card display the status of the license:

* Go to the Card properties tab
* Click Add property
* Set the property name to: Status
* Set the Display label to any name of your choice
* Set the Data type to: Status
* Click Add option
  * Set the Name to: Expired
  * Set the Label to: Expired
  * Set the Type to: Warning
* Click Add option
  * Set the Name to: Revoked
  * Set the Label to: Revoked
  * Set the Type to: Danger
* Click Add option
  * Set the Name to: Trial
  * Set the Label to: Trial
  * Set the Type to: Info
* Click Add option
  * Set the Name to: Valid
  * Set the Label to: Valid
  * Set the Type to: Success
* Click Add option
  * Set the Name to: NoLicense
  * Set the Label to: No License
  * Set the Type to: Info
* Click Add option
  * Set the Name to: Error
  * Set the Label to: Error
  * Set the Type to: Danger
* Click Add to add the property
* Click Save

#### Authorization the HCC

* In your browser, paste the following URL (the value of YOUR\_CLIENT\_ID can be found in the Auth tab / Client ID field): [https://app.hubspot.com/oauth/authorize?client\_id=\<YOUR\_CLIENT\_ID>](https://app.hubspot.com/oauth/authorize?client\_id=%3CYOUR\_CLIENT)\&scope=tickets crm.objects.contacts.read crm.objects.companies.read crm.objects.deals.read crm.schemas.contacts.read crm.schemas.companies.read\&redirect\_uri=\<REDIRECT\_URI\_USED\_ABOVE>

&#x20;         Example: [https://app.hubspot.com/oauth/authorize?client\_id=1234-123-123123-123123](https://app.hubspot.com/oauth/authorize?client\_id=%3CYOUR\_CLIENT)\&scope=tickets crm.objects.contacts.read crm.objects.companies.read crm.objects.deals.read crm.schemas.contacts.read crm.schemas.companies.read\&redirect\_uri=https://soraco.co

* When prompted to select an account, select your live production account
* When prompted that the app hasn't been reviewed/approved by HubSpot, click "Connect app"
* Once approved, the browser's address bar will look like: \<REDIRECT\_URI\_USED\_ABOVE>[/?code=xxxxxx-8e7e-4473-9ab4-964237xxxxxx](https://qlmhubspot.free.beeceptor.com/?code=xxxxxx-8e7e-4473-9ab4-964237xxxxxx)
* Copy the code for later usage (not that this code expires within minutes so you should proceed to the next step fairly quickly)
* Next, we will use curl to authorize the app
* If you are running Windows 10 v1803 or higher, curl is already available with the OS
* Open a Windows command prompt and execute the command below where:
  * CODE\_GENERATE\_IN\_PREVIOUS\_STEP is the code generated in the previous step
  * YOUR\_CLIENT\_ID can be found in the Auth tab / Client ID field.
  * YOUR\_CLIENT\_SECRET can be found in the Auth tab / Client Secret field.

curl --request POST --url https://api.hubapi.com/oauth/v1/token --header "content-type: application/x-www-form-urlencoded;charset=utf-8" --data "code=\<CODE\_GENERATE\_IN\_PREVIOUS\_STEP>\&redirect\_uri=\<REDIRECT\_URI\_USED\_ABOVE>\&grant\_type=authorization\_code\&client\_id=\<YOUR\_CLIENT\_ID>\&client\_secret=\<YOUR\_CLIENT\_SECRET>"

&#x20;

The response from the curl command above should look like:

{"refresh\_token":"XXXX10c3-450b-9eda-c506aab0022e","access\_token":"XXXXXxIDAQEBGJHMyAkgw8npCyjMjxIyGQAQllp3ggmqkLnVvmX0HIx1niYG4KEZ7vU6GgAKAkEAAAyAwgcIAAAAAQAAAAAAAAAYwAAfQhkAEJZad-Zf3p7fGMlDOBN8DFBvcb27-XXXX","expires\_in":21600}

&#x20;

### QLM Configuration

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions
* Select "HubSpot"
* Check "Enabled" to enable the integration
* Enter the QLM HubSpot App Secret Key (Auth tab / Client Secret field) in the "Shared Key" field
* Click Ok

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/9859228626196)

The QLM HubSpot integration is sold as a separate product that requires a special license key.  To activate your HubSpot license:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions
* Select "HubSpot"
* Go to the License tab
* Enter your Activation Key and click Activate

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/9859253842580)

&#x20;

Once the above steps are completed, if you load a specific contact in HubSpot, the QLM CRM Card is displayed with details about the licenses associated with the contact.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360096913852)

### Limitations

Due to constraints on the amount of time HubSpot imposes on returning data from QLM, QLM returns a maximum of 50 records from the License Server. Hence, if a customer has more than 50 different licenses associated with his or her account, the first 50 licenses are returned, sorted by Order Date, in descending order.

