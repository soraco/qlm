# UniqueSystemIdentifierExceptions

When [QlmLicense.LicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) is set to QlmUniqueSystemIdentifier1, the computer identifier is extracted using a series of steps that will try to determine the best identifier possible given the customer's environment.

When a customer is running your application on a physical machine, QLM will first try to extract the motherboard's serial number and use it if it is available. Unfortunately, some motherboard manufacturers do not set the serial number to a reliable, unique value. Whilst QLM includes some built-in exceptions that will discard unreliable values, our exceptions may not cover all possible cases.

The QlmLicense.UniqueSystemIdentifierExceptions property allows you to specify a list of exceptions that the QlmUniqueSystemIdentifier1 algorithm will discard as unreliable.

You can set UniqueSystemIdentifierExceptions to a comma-separated list of values, each value being a [regular expression](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference) that will be used to discard the matching identifier.

**Example:**

In the example below, we will discard any unique identifier that contains the strings "123456789" or the characters "abcdef:

license.UniqueSystemIdentifierExceptions  = ".\*123456789.\*, .\*abcdef.\*";

**Note 1:**

If you are using the QLM License Wizard, you must set this property in the Protect Your Application tab.

**Note 2:**

If you set this property, it might adversely affect existing customers whose computer ID will be discarded by the new setting. These customers will need to deactivate their license and reactivate it.

&#x20;
