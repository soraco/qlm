# QlmCustomerSite v20+

### Customize the Customer Site pages

#### Logo customization&#x20;

To customize the Logo on the QlmCustomerSite edit the following server properties:

* **customerSiteLogo** to a valid URL pointing to an image of your logo.&#x20;
* **customerSiteAlignment** to one of the following: Left, Center, Right.
* **customerSiteHeight** to the wanted pixel size Height of the logo.
* **customerSiteWidth** to wanted  the pixel size Width of the logo.

<figure><img src="../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

#### Title Customization

To customize the Title on the QlmCustomerSite edit the following server properties:

* **customerSiteTitle**.
* **customerSiteAlignment** to one of the following: Left, Center, Right.

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

#### Theme Customization

To customize the theme of the QlmCustomerSite set the server property **customerSiteTheme** to one of the dropdown values.

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

#### Page Customization

To hide any of the pages Activate a License, Deactivate a License, Get License Information and/or Email License Keys, set the following server properties: **showActivateLink, showDeactivateLink, showEmailLicenseKeysLink, showGetLicenseInformationLink.**

<figure><img src="../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

#### Privacy Policy Customization

To configure the privacy policy URL, set the server property **privacyPolicyUrl** value to a URL that points to your Privacy Policy.

To hide the privacy policy checkbox, clear the **privacyPolicyUrl** server property.&#x20;

#### Subscribe to Mail List Customization

To hide the Subscribe To Mail List checkbox, set the server property **registrationPage\_showSubscribeToMailList**.&#x20;

To set the default state of the Subscribe To Mail List checkbox, set the server property **registrationPage\_subscribeToMailListDefaultState**.

#### Exclude product from Offline Activation Page

To exclude a product from the product list displayed on the Offline Activation Page:

* Launch the QLM Management Console
* Go to the Define Products tab
* Select the required product
* Go to the Advanced tab
* Uncheck the "Include On Customer Site" option

#### Register button action

To modify the destination URL of the register button after registration is completed, set the server property: **registerButtonDoneUrl**.

### Advanced Pages customization

To customize the pages, you can edit the cshtml pages located in QlmCustomerSiteNetCore\Pages. Here are some basic rules to follow:

* Before editing these files, you should always create a backup.&#x20;
* Never modify the ID of a field.
* Never remove a field

Note that if we are hosting your License Server, you can edit the files located in "%Public%\Documents\Quick License Manager\DeployToServer\QlmCustomerSiteNetCore\Pages". Once you have to tested your changes, you must contact our support team and send us the files to upload to your server. Note that if you make any changes to the cshtml files, you will need to reapply these changes every time your server is upgraded.

### Localize the Customer Site Pages

In QlmCustomerSiteNetCore the pages are localized in different languages.&#x20;

If you are upgrading from an earlier version of QLM, the URL to access the localized pages has changed from:

https://\<yourserver>/qlmcustomersite/index.html

to:

https://\<yourserver>/qlmcustomersitenetcore/Default

If you elect to use the localized pages, you can no longer customize the text of each page as the localized text is retrieved dynamically from resource DLLs.

If you need to customize the text of these pages, you will need to turn off localization and create your own pages with customized text.&#x20;

#### Single Language Customization

If you only want to support a single language, you can simply turn off the localization feature and customize the content of each page.&#x20;

To turn off localization, set the **customerSiteUseLocalizedCustomPages** server property to false.

#### Multilingual Customization

If you want to customize the text of the QlmCustomerSiteNetCore pages and would like to support multiple languages, you can do so by following the procedure below.

#### Configuration Changes

Set the server property **customerSiteUseLocalizedCustomPages** to true.

#### Page Localization

For each cshtml page, you must create a language-specific page and then customize its content. Note: Keep the original pages as fallbacks.

For example, to support French and English:

* Duplicate Default.cshtml to Default\_en.cshtml&#x20;
* Duplicate Default.cshtml to Default\_fr.cshtml&#x20;
* Duplicate QlmWebActivation.cshtml to QlmWebActivation\_en.cshtml&#x20;
* Duplicate QlmWebActivation.cshtml to QlmWebActivation\_fr.cshtml&#x20;
* Edit the content of the \*\_fr.cshtml pages and translate the text as desired.
* Repeat the steps above for each language and each page.
* Note that for each page you customize, you must retain the original page and create a language-specific page, even for English, which is the default language.
* Also note you must create a new file for all languages you choose to keep in the dropdown. If there is a language you kept in the dropdown that you did not create a file for it will resort to the fallback original file.

&#x20;The language codes to suffix each page name are:

| **Language** | **Code** |
| ------------ | -------- |
| English      | en       |
| French       | fr       |
| German       | de       |
| Italian      | it       |
| Japanese     | ja       |
| Portuguese   | pt       |
| Spanish      | es       |
| Swedish      | sv       |

&#x20;

You can also set the initial language of the page by adding the is\_language parameter. Example:

https://\<yourserver>/qlmcustomersitenetcore/Default?is\_language=fr
