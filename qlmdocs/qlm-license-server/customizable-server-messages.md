# Customizable Server Messages

When License server APIs are called, they return error messages that are not customizable.&#x20;

For convenience, a small set of these messages can be customized in the License Server's web.config file.

| Setting in web.config                           | Description                                                                                                   | Default Message                                                                  | Place Holders                                                                             |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| customMessage\_Res\_LicenseKeyReleased          | Used when deactivating a license                                                                              | Activation Key {0} has been released from computer {1}.                          | <p>{0}: Activation Key<br>{1}: Computer Name</p>                                          |
|                                                 |                                                                                                               |                                                                                  |                                                                                           |
| customMessage\_Res\_AllKeysActivated            | Used when a user tries to activate a license that has multiple activations and no more licenses are available | All the available licenses have already been activated.                          | None                                                                                      |
| customMessage\_Res\_LicenseKeyAlreadyActivated4 | Used when a user tries to activate a license that has a single activation and no more licenses are available  | The license {0} has already been activated on a system called {1} on {2} \[{3}]. | <p>{0}: Activation Key<br>{1}: Computer Name<br>{2}: Current Date<br>{3}: Computer ID</p> |

When customizing the message value, QLM will replace the {x} place holders with the proper value as described in the table above. Extreme caution must be exercised when constructing your message. A badly formatted message might cause an exception in the server.

Example:

{% code overflow="wrap" %}
```xml
<QlmWebService.Properties.Settings>
  <setting name="customMessage_Res_LicenseKeyReleased" serializeAs="String">
    <value>Custom Message: Activation Key {0} has been released from computer {1}.</value>
  </setting>
  
  <setting name="customMessage_Res_AllKeysActivated" serializeAs="String">
    <value>Custom Message: All the available licenses have already been activated.</value>
  </setting>
  
  <setting name="customMessage_Res_LicenseKeyAlreadyActivated4" serializeAs="String">
    <value>Custom Message: The license {0} has already been activated on a system called {1} on {2} [{3}].</value>
  </setting>
```
{% endcode %}
