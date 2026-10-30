# HubSpot Integration - Deal Creation

Applies to: QLM Enterprise

Version: 15.1.22017.5

***

### Overview

QLM can automatically create a Deal in HubSpot when a customer requests a trial in the QLM Trial Registration Form.

The information transferred to HubSpot is:

* Product Name
* Activation Key
* Association with Contact

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
* Set the API Key value to the token created above and click OK

![mceclip1.png](https://support.soraco.co/hc/article_attachments/16922340960660)

### Custom Properties

Next, you must create Custom Properties in HubSpot.

* Click the settings (gear) icon on the top toolbar
* Under "Data Management", click Properties
* In the next step we will create 3 properties:
  * Click "Create Property"
    * Click "Edit more options"
    * Set the Property label to "product\_name"
    * Set the Object type to "Deal"
    * Set the Group to "Deal Information"
    * Click Field Type in the left hand panel
    * Set the Field type to Single-line text
    * Click Create
  * Click "Create Property"
    * Click "Edit more options"
    * Set the Property label to "activation\_key"
    * Set the Object type to "Deal"
    * Set the Group to "Deal Information"
    * Click Field Type in the left hand panel
    * Set the Field type to Single-line text
  * Click "Create Property"
    * Click "Edit more options"
    * Set the Property label to "license\_model"
    * Set the Object type to "Deal"
    * Set the Group to "Deal Information"
    * Click Field Type in the left hand panel
    * Set the Field type to "Dropdown select"
    * Set the Label to _none_ and the Internal Value to _0._
    * Click "Add an option"
    * Set the Label to _permanent_ and the Internal Value to _1_.
    * Set the Label to _trial_ and the Internal Value to _2_.
    * Set the Label to _subscription_ and the Internal Value to _3_.
    * Click Next
    * Click Create
  * Finally, we need to add the properties to the View
    * Select any existing Deal
    * In the left hand panel, click "Actions/Customize properties"
    * Click Add Properties
    * Locate the product\_name entry and select it
    * Locate the activation\_key entry and select it
    * Locate the license\_model entry and select it

### Enable Deal Creation

Deal creation can be enabled via QLM's Server Properties.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then go to the Server Properties tab
* Locate the HubSpot section
* Set the following properties
  * createDealFromTrialRegistration = True
