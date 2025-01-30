# How to load an existing XML Settings file in the Protect Your App wizard

If you have an existing XML settings file for a given product and you would like to edit it using the QLM Management Console / Protect Your Application wizard, follow the procedure below:

* Launch the QLM Management Console
* Go to the Protect Your Application Wizard
* Select the product that corresponds to the XML Settings file that you would like to use
* In the **Settings File Location** field, take note of the file path used to load the XML settings file. This path typically looks like: %AppData%\Roaming\Soraco\Quick License Manager\LicenseWizard\432b55c9-54b3-12cb-564c-12b937d24c8a\Product\_x\_y.lw.xml
* In Windows Explorer, go to the folder specified above
* Rename the Product\_x\_y.lw.xml to any other name of your choice
* Copy your existing XML Settings file to that folder and rename it to Product\_x\_y.lw.xml (replace x and y to match the original filename)
* Continue to the next step in the Protect Your Application wizard

Note that you can also manually edit an XML Settings file and re-digitally sign it as described in this [article](https://docs.soraco.co/docs/faq/re-signing-the-xml-settings-file-after-modification).

<figure><img src="../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

