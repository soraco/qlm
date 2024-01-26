# Create License Keys

The Create button creates an activation key. Activation keys can also be created via the QLM API and more typically via QLM's integration with eCommerce providers. For more information about how to automatically create activation keys during the purchasing process, read the eCommerce Providers section in the QLM Professional help.\


* **Product**: The product associated with the license key.
* **Number of keys**: The number of license keys to generate.
* **Number of activations per key**: The number of activations that this key will allow. QLM manages the number of activated licenses and prevents the user from activating more than the number of purchased licenses. For example, if a customer purchases 5 copies of your software, rather than sending the customer 5 license keys, you create a single license key that can be activated on 5 different computers.
* **Floating seats**: To implement Floating Licenses (requires QLM Enterprise), specify the number of floating seats associated with this activation key.
* You can alternatively use this field to control the number of instances of your application that can run in a Terminal Server session. An instance is uniquely identified by a Terminal Server session for a specific user. To enable this feature, set the LimitTerminalServerInstances property of the QlmLicense object to True in your code.
* **Customer E-mail**: Associate the key to a customer.
* **Features**: Check any feature to enable this license key (if you have not defined any features for your product, this field will be empty).
* **Affiliate**: Select from this dropdown list the affiliate that sold the license, if applicable.
* **Generic License**: When this option is checked, the license key to be generated upon activation will be generic – not bound to any particular computer.
* **Maintenance Plan**: When selected, license keys become version-agnostic. A customer running an older version of your product will be able to activate his license key with the latest version of your product. Use this option if you have offered your customers free upgrades to all future versions or if the customer has purchased a maintenance plan. For more details, read the Maintenance Plan section in the QLM Professional help.
* **Expiry Criteria**: If you would like the license to be time-limited, check this box to enable its subordinate controls.
* **Engine Version**: If you have customers using an older version of QLM, select the appropriate version of the QLM engine from this dropdown list on the Advanced tab. It is highly recommended to use QLM Engine version 5.0 or higher.
* **User data**: Use this text area on the Advanced tab to record any notes or text-encoded data to associate with this license.
* **Comments**: Use this text area on the Comments tab to record any notes or text-encoded data to associate with this license.

Finally, the Save Defaults button allows you to store default values for all the fields above. Subsequently launching the Create dialog will automatically load the saved default values.
