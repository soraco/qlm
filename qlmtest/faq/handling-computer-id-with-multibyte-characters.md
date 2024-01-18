# Handling computer ID with multibyte characters

To support multibyte characters in the computer ID field, you need to do the following:

* After you instantiate the QlmLicense class, you need to set the EnableMultiByte property to true.
* If you are using the QLM .NET Controls or the QLM License Wizard, you need to set the QlmEnableMultiByte property to true.
* In the web.config of the QLM web service, add the following setting in the \<QlmWebService.Properties.Settings> section:
* \<setting name="enableMultiByte" serializeAs="String">\
  \<value>True\</value>\
  \</setting>

Once you enable this feature, any license activated with a character that is beyond ASCII code 128 will need to be released and reactivated. For example, a computerID that have accented characters will need to be released and reactivated.
