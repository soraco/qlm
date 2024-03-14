# How to configure the QLM License Wizard to allow Offline Activation only

To allow customers to only activate offline with a Computer Key that you would pre-generate for the customer, you can configure the QLM License Wizard to only show pages and fields that are required for offline activation.

To configure the QLM License Wizard to only allow Offline Activation, set the following properties in the Protect Your Application wizard and generate the XML Settings file.

<table><thead><tr><th width="301">Property Name</th><th width="102">Value</th><th>Description</th></tr></thead><tbody><tr><td>QlmShowActivationMethodPage</td><td>False</td><td>Hides the Activate online button</td></tr><tr><td>QlmShowDeactivationPage</td><td>False</td><td>Hides the Deactivate button</td></tr><tr><td>QlmShowOfflineActivationKey</td><td>False</td><td>Hides the Activation Key field</td></tr><tr><td>QlmShowOnlineActivationPage</td><td>False</td><td>Hides the Online Activation Page</td></tr></tbody></table>
