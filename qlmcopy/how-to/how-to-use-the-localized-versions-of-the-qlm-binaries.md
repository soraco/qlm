# How to use the localized versions of the QLM binaries

To use the localized versions of QlmLicenseLib.dll or the localized versions of the QLM .NET controls or the QLM License Wizard standalone executable, you need to deploy alongside the QLM binaries the corresponding localization files as described in the tables below.

&#x20;Notes:

* The "Redistrib" folder is located in C:\Program Files\Soraco\QuickLicenseMgr
* The \<TargetDir> is the target directory of your installation
* Replace xx below with the languages that you'd like to support.

&#x20;

**.NET 4.0**

| **Source File**                                                    | **Destination file**                           |
| ------------------------------------------------------------------ | ---------------------------------------------- |
| Redistrib\\.net 4.0\QlmLicenseLib.dll                              | \<TargetDir>\QlmLicenseLib.dll                 |
| Redistrib\\.net 4.0\QlmControls.dll                                | \<TargetDir>QlmControls.dll                    |
| Redistrib\\.net 4.0\Localization\xx\QlmLicenseLib.resources.dll    | \<TargetDir>\xx\QlmLicenseLib.resources.dll    |
| Redistrib\\.net 4.0\Localization\xx\QlmControls.resources.dll      | \<TargetDir>\xx\QlmControls.resources.dll      |
| Redistrib\\.net 4.0\Localization\xx\QlmLicenseWizard.resources.dll | \<TargetDir>\xx\QlmLicenseWizard.resources.dll |

&#x20;

**.NET 2.0**

| **Source File**                                                    | **Destination file**                           |
| ------------------------------------------------------------------ | ---------------------------------------------- |
| Redistrib\\.net 2.0\QlmLicenseLib.dll                              | \<TargetDir>\QlmLicenseLib.dll                 |
| Redistrib\\.net 2.0\QlmControls.dll                                | \<TargetDir>QlmControls.dll                    |
| Redistrib\\.net 2.0\Localization\xx\QlmLicenseLib.resources.dll    | \<TargetDir>\xx\QlmLicenseLib.resources.dll    |
| Redistrib\\.net 2.0\Localization\xx\QlmControls.resources.dll      | \<TargetDir>\xx\QlmControls.resources.dll      |
| Redistrib\\.net 2.0\Localization\xx\QlmLicenseWizard.resources.dll | \<TargetDir>\xx\QlmLicenseWizard.resources.dll |

&#x20;

**Important:**&#x20;

Customizable properties are not localized and you will need to localize them yourself. For example, properties such as QlmActivationMethodCaption, QlmActivationMethodTitle, QlmBuyNowCaption, etc. are not localized.

&#x20;

**How to localize the customizable properties of the QLM .NET Controls**

In your own application, create localized versions of all the customizable text. After the QLM .NET Control is created, in your code, dynamically set each customizable property to its localized version.

**How to localize the customizable properties of QLM License Wizard**

To localize the QLM License Wizard, please refer to this [article](https://support.soraco.co/hc/en-us/articles/360024474812-QLM-License-Wizard-localization).

Note that if you manually modify an xml file, you must digitally sign the xml file after modifications with the [QlmSignFile.exe](https://support.soraco.co/hc/en-us/articles/360021354692) utility.

&#x20;

**How to localize the QLM License Server**

Messages returned by the QLM License Server are localized in several languages (de, es, fr, it, ja, pt, sv). When you deploy the License Server, you must deploy the localization folder of each language that you would like to support.

To enable the License Server to return messages based on the locale of the client system, you must set the EnableClientLanguageDetection property to true.

The property must be set on the QlmLicense object as well as on the QLM License Wizard (v10).
