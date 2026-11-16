# Customization and localization

### Customize the Customer Site pages

#### Logo customization&#x20;

QLM v12+: Set the server property **customerSiteLogo** to a valid URL pointing to an image of your logo.&#x20;

QLM v11-: Simply replace the logo.png file located in QlmCustomerSite/images.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360088475311/mceclip0.png)

&#x20;

#### Title Customization

QLM v12+: Set the server property customerSiteTitle.

QLM v11-: Edit the relevant aspx.

#### Privacy Policy Customization

To configure the privacy policy URL, set the customerSite/privacyPolicyUrl value to a URL that points to your Privacy Policy.

To hide the privacy policy checkbox, clear the privacyPolicyUrl server property.&#x20;

#### &#x20;Subscribe to Mail List Customization

To hide the Subscribe To Mail List checkbox, edit the QlmCustomerSite web.config file and set showSubscribeToMailListCheckbox setting to False.

#### Exclude product from Offline Activation Page

To exclude a product from the product list displayed on the Offline Activation Page:

* Launch the QLM Management Console
* Go to the Define Products tab
* Select the required product
* Go to the Advanced tab
* Uncheck the "Include On Customer Site" option

#### Register button action

To modify the destination URL of the register button after registration is completed, set the server property: customerSite/registerButtonDoneUrl .

### &#x20;Advanced Pages customization

To customize the pages, you can edit the aspx pages located in QlmCustomerSite. Here are some basic rules to follow:

* Before editing these files, you should always create a backup.&#x20;
* Never modify the ID of a field.
* Never remove a field

Note that if we are hosting your License Server, you can edit the files located in "%Public%\Documents\Quick License Manager\DeployToServer\QlmCustomerSite". Once you have to tested your changes, you must contact our support team and send us the files to upload to your server. Note that if you make any changes to the aspx files, you will need to reapply these changes every time your server is upgraded.

### Localize the Customer Site Pages

In QLM v11+, the QlmCustomerSite pages are localized in different languages.&#x20;

If you are upgrading from an earlier version of QLM, the URL to access the localized pages has changed from:

https://\<yourserver>/qlmcustomersite/index.html

to:

https://\<yourserver>/qlmcustomersite/default.aspx.

If you elect to use the localized pages, you can no longer customize the text of each page as the localized text is retrieved dynamically from resource DLLs.

If you need to customize the text of these pages, you will need to turn off localization and create your own pages with customized text.&#x20;

#### Single Language Customization

If you only want to support a single language, you can simply turn off the localization feature and customize the content of each page.&#x20;

To turn off localization, set the customerSiteUseLocalizedCustomPages server property to false (QLM 12).

For QLM 11, edit the applicationSettings / QlmCustomerSite.Properties.Settings of the QlmCustomerSite web.config file as follows:

```xml
<setting name="useLocalizedCaptions" serializeAs="String">
   <value>False</value>
 </setting>
```

#### Multilingual Customization

If you want to customize the text of the QlmCustomerSite pages and would like to support multiple languages, you can do so by following the procedure below.

#### Configuration Changes

Set the server property customerSiteUseLocalizedCustomPages to true (QLM v12).

For QLM v11, edit the applicationSettings / QlmCustomerSite.Properties.Settings of the QlmCustomerSite web.config file as follows:

```xml
<setting name="useLocalizedCaptions" serializeAs="String">
<value>False</value>
</setting>
<setting name="useLocalizedCustomPages" serializeAs="String">
<value>True</value>
</setting>
```

#### Page Localization

For each aspx page, you must create a language-specific page and then customize its content.

For example, to support French and English:

* Copy default.aspx to default\_en.aspx&#x20;
* Copy default.aspx to default\_fr.aspx
* Copy QlmWebActivation.aspx to QlmWebActivation\_en.aspx&#x20;
* Copy QlmWebActivation.aspx to QlmWebActivation\_fr.aspx
* Edit the content of the \*\_fr.aspx pages and translate the text as desired.
* Repeat the steps above for each language and each page.
* Note that for each page you customize, you must retain the original page and create a language-specific page, even for English, which is the default language.

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

&#x20;You can also set the initial language of the page by adding the is\_language parameter. Example:

https://\<yourserver>/qlmcustomersite/default.aspx?is\_language=fr
