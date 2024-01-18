# Computer Identifier (ComputerID) requirements

The ComputerID is a unique identifier used to bind the license to a specific device.

The QlmLicenseBinding property (configurable from the Protect Your application wizard or programmatically) allows you to select from a list of supported system identifiers such as a Computer Name, MAC address, etc.

You can also define your own ComputerID by setting the QlmLicenseBinding property to User Defined.

If you elect to use your own identifier, you need to adhere to the following requirements:&#x20;

* The maximum length of the Computer ID is 255 characters.
* The minimum length of the Computer ID is 1 character.
* No spaces are allowed in the Computer ID.

For more information about binding a license using your own unique identifier, [read this article](https://support.soraco.co/hc/en-us/articles/360018676892-How-to-bind-a-license-to-your-own-unique-identifier).
