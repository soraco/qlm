# HubSpot New CRM Card - Marketplace (Available Soon)

_The QLM HubSpot App is an add-on that must be purchased separately._&#x20;

The QLM HubSpot App allows you to view license information associated with a customer directly from within HubSpot as a CRM Card.

<figure><img src="../../.gitbook/assets/image (108).png" alt=""><figcaption></figcaption></figure>

## Installing the App

### Step 1: Install the QLM CRM Card from Marketplace

1. Login and click on the store icon on the top header of HubSpot. Select HubSpot Marketplace

<figure><img src="../../.gitbook/assets/image (99).png" alt=""><figcaption></figcaption></figure>

2. Search for "QLM CRM Card" in the search bar and select the option that pops up

<figure><img src="../../.gitbook/assets/image (100).png" alt=""><figcaption></figcaption></figure>

3. Select the app that appears and click the install button

<figure><img src="../../.gitbook/assets/image (102).png" alt=""><figcaption></figcaption></figure>

4. You will then be prompted to connect to the app and accept the requesting access from the CRM Card.&#x20;

<figure><img src="../../.gitbook/assets/image (84).png" alt=""><figcaption></figcaption></figure>

5. Once connected you should see the following:

<figure><img src="../../.gitbook/assets/image (86).png" alt=""><figcaption></figcaption></figure>

6. You can click on either "explore app overview" or "Customize app cards", go to the settings tab  and click Manage locations

<figure><img src="../../.gitbook/assets/image (106).png" alt=""><figcaption></figcaption></figure>

7. Once you click Manage locations, a right sidebar will appear where you can either click customize and follow the instructions in [Step 2](hubspot-new-crm-card-marketplace-available-soon.md#step-2-add-the-qlm-crm-card-to-your-contact-layout). Or you can select the QLM CRM Card checkbox an click save which will do the same (note it will add the CRM card to the bottom of you contacts right sidebar). If you clicked customize, skip to [Step 2.6](hubspot-new-crm-card-marketplace-available-soon.md#step-2-add-the-qlm-crm-card-to-your-contact-layout). If you clicked the checkbox and saved you can skip to [Step 3](hubspot-new-crm-card-marketplace-available-soon.md#step-3-verify-the-card-is-visible).

<figure><img src="../../.gitbook/assets/image (107).png" alt=""><figcaption></figcaption></figure>

***

### Step 2: Add the QLM CRM Card to Your Contact Layout

1. Log in to your HubSpot account as an administrator.
2. Click **Settings** (gear icon) in the top navigation bar.

<figure><img src="../../.gitbook/assets/image (88).png" alt=""><figcaption></figcaption></figure>

3. Navigate to: **Data Management → Objects → Record Customization →  And click Default view** (or edit the view you want your users to see)

<figure><img src="../../.gitbook/assets/image (91).png" alt=""><figcaption></figcaption></figure>

4. In the layout editor, locate the **right sidebar** section.  Click the **+ Add** button.

<figure><img src="../../.gitbook/assets/image (94).png" alt=""><figcaption></figcaption></figure>

5. Select **Card Library**. In the search box, type: **QLM CRM Card.** Add the **QLM CRM Card** from the search results.

<figure><img src="../../.gitbook/assets/image (95).png" alt=""><figcaption></figcaption></figure>

6. Click **Save and Exit** to update the layout.

The QLM CRM Card is now available on all Contact records that use this layout.

***

### Step 3: Verify the Card Is Visible

1. Navigate to **Contacts** in HubSpot.

<figure><img src="../../.gitbook/assets/image (96).png" alt=""><figcaption></figcaption></figure>

1. Open any contact record.
2. Look at the right-hand sidebar.

You should see the **QLM CRM Card** displayed alongside the other CRM cards configured for the Contact record.

<figure><img src="../../.gitbook/assets/image (97).png" alt=""><figcaption></figcaption></figure>

If the card appears but no licensing information is displayed, complete the activation step below.

***

### Activating the QLM CRM Card

For security and data isolation purposes, the QLM CRM Card will not display license data until your HubSpot account has been registered in the QLM system. It should look like the following before properly registered:

<figure><img src="../../.gitbook/assets/image (98).png" alt=""><figcaption></figcaption></figure>

#### Contact QLM Support

Email our support team at support@soraco.co and provide the following information:

* Your **HubSpot Portal ID**
* Your **License Server URL**

Example:

Plain TextHubSpot Portal ID: 12345678\
License Server URL: https://licenses.yourcompany.com

Once this information has been received, our team will add your organization to the QLM database and enable communication between HubSpot and your QLM License Server.

***

### Confirming Activation

After QLM support has completed the setup:

1. Open a Contact record in HubSpot.
2. Locate the **QLM CRM Card** in the right sidebar.
3. Verify that license information is displayed.

The card will show licensing information associated with the contact, allowing your sales, customer success, and support teams to view licensing details directly from within HubSpot.

***

### Troubleshooting

#### The QLM CRM Card Does Not Appear

Verify that:

* The app has been successfully installed.
* The card was added through **Settings → Data Management → Objects → Record Customization → Default View**
* The updated layout was saved.
* You are viewing a Contact record that uses the modified layout.

#### The Card Appears but No Data Is Displayed

Verify that:

* Your organization has contacted QLM Support.
* The correct **HubSpot Portal ID** was provided.
* The correct **License Server URL** was provided.
* QLM Support has confirmed that your organization has been activated.
* There are licenses associated with the contact you're viewing
