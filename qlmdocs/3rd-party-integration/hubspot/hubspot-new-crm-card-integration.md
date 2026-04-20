# HubSpot New CRM Card Integration

This guide explains how to create, configure, and enable the **QLM CRM Card** in HubSpot using a HubSpot Project and the HubSpot CLI.

Once configured, the QLM CRM Card displays license information directly in the CRM record sidebar (for example, on Contact records).\
After the initial setup, users can reuse the project by copying the provided card implementation.

### Prerequisites

Before starting, ensure all the following requirements are met. Each prerequisite is required for the steps that follow. Skip to Step 3 if you already have Node.js and HubSpot CLI installed.

#### 1. Install Node.js

The HubSpot CLI requires **Node.js** to be installed on your machine.

1. Go to the official Node.js website:\
   https://nodejs.org
2. Download and install the **LTS (Long Term Support)** version.
3. After installation, open a terminal and verify that Node.js is installed:

```bash
node --version
```

If the command outputs a version number, Node.js is installed correctly.

***

#### 2. Install the HubSpot CLI

The HubSpot CLI is used to create, upload, and run HubSpot projects locally.

Install it globally using npm:

```bash
npm install -g @hubspot/cli
```

After the installation completes, verify that the CLI is available:

```bash
hs --version
```

If the command is recognized and outputs a version number, the CLI is installed correctly.

***

#### 3. Authenticate the HubSpot CLI

The CLI must be authenticated with the HubSpot account where the project will be created.

Run the following command:

```bash
hs account auth
```

You will be prompted to authenticate using a **Personal Access Key**.

Follow the on-screen steps to:

1. Open HubSpot in your browser
2. Generate a Personal Access Key
3. Copy and paste the key into the terminal

Once authenticated, you can list available accounts using:

```bash
hs account list
```

***

#### 4. Access to a HubSpot Developer Account

Running HubSpot projects locally requires access to a **HubSpot Developer Account** and at least one **developer test account**.

* Developer test accounts are used to safely preview and test apps
* You will select or create a test account during development

If you do not already have a developer account, you must create one before continuing.

***

#### 5. QLM License Server

You must have access to a License Server and know:

* The base URL of your license server
* The URLs used for license queries, activation, deactivation, and portal access

These URLs will be configured later in the CRM card code.

***

### Step 1 – Create the HubSpot Project

In a terminal, navigate to the directory where you want the project created, then run:

```bash
hs project create
```

***

#### Project Name and Location

When prompted:

* Enter a project name (example: `QLM_CRM_Card`)
* Choose a destination directory (you may accept the default)

***

#### Choose What to Include in the Project

You will be prompted with:

```bash
? [--project-base] Choose what to include in your project:
❯ App
  Empty Project
```

Select **App**.

***

#### Choose How to Distribute the App

```bash
? [--distribution] Choose how to distribute your app:
  On the HubSpot marketplace
❯ Privately
```

Select **Privately**.

***

#### Choose Authentication Type

```bash
? [--auth] Choose your authentication type:
❯ Static Auth
  OAuth
```

Select **Static Auth**.

***

#### Choose App Features

```bash
? [--features] Choose which features to add:
❯◉ Card [card]
 ◯ App Function (endpoint)
 ◯ App Function (private)
 ◯ Settings
 ◯ Webhook
 ◯ Custom Workflow Action
 ◯ SCIM Integration
 ◯ Pages
```

Select **Card**.

The project will now be created locally.

***

### Step 2 – Upload the Project to HubSpot

Change into the project directory:

```bash
cd QLM_CRM_Card
```

Upload the project:

```bash
hs project upload
```

If this is the first upload, you will be prompted to create the project in HubSpot.\
Confirm by entering `Y`.

***

#### Verify the Project in HubSpot

In HubSpot, navigate to:

**Development → Projects**

The project should now be visible.

***

### Step 3 – Run the Project in Development Mode

Start the development server:

```bash
hs project dev
```

***

#### Choose Testing Environment

Select:

```bash
Test on a developer test account (recommended)
```

#### Select or Create a Test Account

Choose an existing developer test account or create a new one if needed.

***

#### Install the App

If prompted to install the app in the test account, confirm by entering `Y`.

The project will now be running locally.

To stop the development server at any time, press: q

***

### Step 4 – Configure Project Metadata

#### 4.1 Allow Your License Server URL

Open:

```
<project-root>/src/app/app-hsmeta.json
```

Add your license server URL to the `permittedUrls` list:

```json
"permittedUrls": {
      "fetch": [
        "https://api.hubapi.com",
        "https://your-license-server-domain.com"
      ],
      "iframe": [],
      "img": []
    },
```

This allows the CRM card to communicate with your backend services.

***

#### 4.2 Configure the CRM Card Metadata

Open:

```
<project-root>/src/app/card/card-hsmeta.json
```

Update:

* `name` to `QLM CRM Card`
* `location` to `crm.record.sidebar`

Such that it looks like:

```json
{
  "uid": "QLM_CRM_Card_card",
  "type": "card",
  "config": {
    "name": "QLM CRM Card",
    "location": "crm.record.sidebar",
    "entrypoint": "/app/cards/NewCard.tsx",
    "objectTypes": [
      "contacts"
    ]
  }
}
```

This controls how the card appears in HubSpot and where it is displayed.

***

### Step 5 – Replace the CRM Card Implementation

Open:

```
<project-root>/src/app/card/NewCard.tsx
```

Completely replace the file contents with the provided **QLM CRM Card implementation found in your QLM installation folder**.

***

### Important – Update License Server Configuration Values

After pasting the CRM card code into `NewCard.tsx`, you **must update the configuration values** so the card points to **your own QLM environment**.

#### Required Configuration Changes

Locate the configuration section in the file and replace the following values:

**1. Base URLs**

Update these variables to match your environment:

* `licenseServerBaseUrl`\
  Base URL of your QLM License Server API
* `customerSiteBaseUrl`\
  Base URL of your QLM Customer Site
* `portalBaseUrl`\
  Base URL of your QLM Portal

These values are used to build all license, activation, deactivation, and portal links displayed in the HubSpot CRM card.

***

**2. API Credentials**

Update the credentials used to authenticate requests to your license server.

Locate the `apiCredentials` object:

```tsx
apiCredentials: {
  vendor: "hubspot",
  user: "qlmdemo",
  pwd: "Qlmweb30!"
}
```

Replace the values with **your own credentials**:

* `vendor`\
  Your vendor identifier (for example, `hubspot`)
* `user`\
  The API user configured in your QLM environment
* `pwd`\
  The corresponding password for that API user

***

#### Important Notes

When updating these values, ensure that:

* All URLs point to the correct environment (test or production)
* The base URLs are reachable from HubSpot
* All base URLs are included in `app-hsmeta.json` under `permittedUrls`
* Credentials match those configured in your QLM License Server

If these values are not updated correctly, the CRM card may load but will not display license data or actions correctly.

***

### Step 6 – Re‑upload After Configuration Changes

If the project is running, stop it: `q`

Upload the updated project:

```bash
hs project upload
```

Then run it again:

```bash
hs project dev
```

Select:

* A developer test account
* The same test account used previously

***

### Step 7 – Enable the CRM Card in HubSpot

In HubSpot:

1. Go to **Settings** (in the top toolbar)
2. Navigate to **Data Management → Objects**
3. Select **Contacts**
4. Open the **Record Customization** tab
5. Open the layout you use (Default view or a custom view)

On the right sidebar:

1. Click **Add (+)**
2. Open the **Card Library** tab
3. Locate **QLM CRM Card**
4. Click **Add card**
5. Click **Save** and **Exit**

***

### Step 8 – Configure the HubSpot Shared Key in QLM

The final configuration step is to link HubSpot and QLM using the **client secret** generated by the HubSpot app.

This shared secret allows QLM to authenticate requests coming from the HubSpot CRM Card.

***

#### 8.1 Retrieve the Client Secret from HubSpot

1. Log in to your **HubSpot Developer Account**
2. Navigate to **Development → Projects**
3. Open the project you created earlier
4. Select the **QLM\_CRM\_Card\_app** tab (or the **`<your_project_name>_app`** tab if you used a different project name)
5. Open the **Auth** tab
6. Locate the **Client Secret**

Copy the **Client Secret** value. You will need it in the next step.

***

#### 8.2 Configure the Shared Key in QLM

1. Open the **QLM Management Console**
2. Go to the **Manage Keys** tab
3. Navigate to **3rd Party Extensions**
4. Locate the **HubSpot** extension
5. Paste the copied **Client Secret** into the **Shared Key** field
6. Save your changes

This completes the secure linkage between HubSpot and QLM.

***

### Step 9 – Verify the Integration

Now go to your test account and open any Contact record.

The **QLM CRM Card** should now appear in the right sidebar and display license information associated with the contact’s email address.

If necessary, adjust the card’s position in the layout editor so it appears higher in the sidebar.

***

### Final Result

You now have:

* A HubSpot project hosting a CRM card
* A configured QLM CRM Card displayed in the sidebar
* Live QLM license data shown directly on CRM records
* A reusable setup that users can enable by copying the card implementation
