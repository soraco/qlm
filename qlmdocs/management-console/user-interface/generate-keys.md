# Generate Keys

_For QLM Express only_

The Generate Keys tab of the QLM Management Console lets you configure and create a license key – or a list of license keys – for any of your products. Note that license keys generated from this tab are not stored in the QLM database. To create license keys that can be used for online activation, refer to the Create option under the Manage Keys tab. Select your product on the Product Name dropdown, then continue with the other controls in the Options box as follows:

Number of embedded licenses: Enter here the number of licenses to embed in each generated key. For example, if you enter “2” the user holding one of these keys will be permitted to activate it on two different computers.

Number of license keys to generate: Enter the number of license keys to generate when you click the Generate license keys button. This option is designed for working with online payment systems that issue the next available key from a prepared list when your software is purchased. Note that licenses distributed in this way do not benefit from QLM’s database integration.

Engine version: Specify the version of the QLM Engine to use. If your application has shipped with an earlier version of QLM, select the version of the QLM Engine that your application is using. Note that the latest version of the QLM Engine is 6.0.00.

Permanent License: Check this option if you want the generated license keys to remain in effect permanently once issued.

Expiry Criteria: Check this option for trial or subscription-based licenses that should expire within a certain number of days of installation, or upon a predetermined date.

Features: Check the boxes next to the features that you want this license to enable. The list of available features can be configured in the Define Products tab.

License Type: This dropdown selects which of the four available QLM license types will be generated. The “Bound to Computer Name” and “User Defined” types both request additional information in the Computer Identifier field.

When you have completed your license settings, click the Generate license keys button in the ribbon strip. The key, or set of keys, you have requested appears in the License Keys box. Click the copy button to the right of the box to transfer the information to the Windows Clipboard. The final destination – a customer email, a configuration page online, or elsewhere – is up to you.
