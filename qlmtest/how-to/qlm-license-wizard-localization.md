# QLM License Wizard localization

With QLM v12, the QLM License Wizard can be localized into multiple languages.

To localize the License Wizard:

* Launch the QLM Management Console
* Go to the Protect your application wizard
* Navigate to the "Customize Look & Feel" page.
* Set the QlmLanguageCode property to the language that you wish to customize, for example, set the property to fr for French
* Translate all the caption properties to French
* Click Next and save your settings
* For each language that you customized, a language specific xml file will be created.
* Deploy all the generated xml files with your product.

When you click the "Test License Wizard" button in the Protect Your Application wizard, the QLM License Wizard is launched in the locale of the current QlmLanguageCode value.

When the QLM License Wizard is launched, it will by default automatically detect the language of the system and load the corresponding language file.

To force the QLM License Wizard to launch in a specific locale, add the /locale argument as follows:

QlmLicenseWizard.exe /settings "your product.lw.xml" /locale fr

Note that you must also copy the QLM resource files for the languages that you must support to their corresponding language folder.

For example, assuming you installed your application in a folder called MyAppDir and that you deployed the QlmLicenseWizard.exe, QlmLicenseLib.dll and other QLM related files to MyAppDir, you would need to copy:

&#x20;C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\\\<language\_code>\\\*.\*

to

\<MyAppDir>\\\<language\_code>\\\*.\*
