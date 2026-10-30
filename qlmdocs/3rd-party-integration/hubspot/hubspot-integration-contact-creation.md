# HubSpot Integration - Contact Creation

Applies to: QLM Enterprise

Version: 15.1.22017.5

***

### Overview

QLM can automatically create a Contact in HubSpot when a customer is created in the QLM Trial Registration Form.

The information transferred to HubSpot is:

* First name
* Last name
* Company
* Phone
* Country
* Default Lead Status
* Default Lifecycle Stage

### Authentication

To authenticate with HubSpot, you need to first get a HubSpot API Key as follows:

* Log in to your HubSpot account
* Click the Settings icon in the top toolbar
* In the left-hand panel, locate the Integrations section and expand it
* Click Private App
* Click Create a Private App
* Set the name of the App
* In the Scopes section, enable the following scopes: `crm.objects.deals.writecrm.objects.deals.readcrm.objects.contacts.readcrm.objects.contacts.write`
* Click Create app
* A token will be generated. Copy the token and store it in a secure place.

To configure QLM with the API Key created above:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions
* Locate HubSpot
* Check Enabled to enable the extension
* Set the API Key value to the Token created above and click OK

![mceclip1.png](https://support.soraco.co/hc/article_attachments/4414293245204)

&#x20;

### Enable Contact Creation

Contact creation can be enabled via QLM's Server Properties.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then go to the Server Properties tab
* Locate the HubSpot section
* Set the following properties
  * createContactFromTrialRegistration
  * defaultLeadStatus. Possible values: NEW, OPEN, IN\_PROGRESS, OPEN\_DEAL, UNQUALIFIED, ATTEMPTED\_TO\_CONTACT, CONNECTED, BAD\_TIMING. The values are case-sensitive.
  * defaultLifecycleStage: Possible values: subscriber, lead, marketingqualifiedlead, salesqualifiedlead, opportunity, customer, evangelist, other. The values are case-sensitive.
