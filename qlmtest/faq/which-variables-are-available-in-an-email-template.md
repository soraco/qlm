# Which variables are available in an email template?

#### Supported Variables

When creating an email template in QLM, you can use the following variables:

* ActivationKey
* ComputerKey
* ComputerID
* ProductName
* MajorVersion
* MinorVersion
* OrderID
* OrderDate
* Comment
* MaintenanceRenewalDate
* GenericLicense
* NumLicenses
* AvailableLicenses
* Disabled
* UserData1
* ReceiptID (this is the SubscriptionID)
* SubscriptionExpiryDate
* SubscriptionDuration
* FloatingSeats
* FloatingLicenseLocation
* LicenseModel
* EnabledFeatures
* ComputerType
* BundleID
* LegacyKey
* AffiliateName
* FullName
* Email
* Company
* OrganizationName
* OrganizationNotes
* Phone
* Fax
* Mobile
* Address1
* Address2
* State
* Country
* Zip
* City
* Notes
* AuthorizationCode (when using activation by autorization code)

&#x20;

Variables should be enclosed with a % sign. For example:

_Hi %FullName%,_

_Thank you for your Plug and Browse purchase._\
_Your %ProductName% activation key is: %ActivationKey%_

_Regards_

_Soraco Technologies_

&#x20;

#### Advanced Variables

The following advanced variables are also available:

%LicenseFile%: Add the xml license file as an attachment to the email. This variable can be placed anywhere in the body of the email.

%Properties%: Add the product properties xml file as an attachment to the email. This variable can be placed anywhere in the body of the email.

As of QLM v11.1, you can also display individual **Product Properties** in an email template.

The syntax for displaying the value of a product property is: %Properties.category.name%

#### Troubleshooting

If a variable is not getting replaced as expected, the most common reason is that HTML formatting tags are interfering with the variable name. When parsing an email template to replace variables, QLM looks for variables enclosed with the % delimiter. HTML formatting tags might inadvertently be inserted in the variable name so that a variable such as %ActivationKey% may actually appear in the HTML document as %\<strong>ActivationKey\</strong>%.

To determine if this is the issue, you can view the raw html by opening the email template directly with a text editor. Email Templates are stored in %appdata%\Soraco\Quick License Manager\EmailTemplates.\<SiteName>. If you detect that the variable has been clobbered with html tags, simply fix the variable directly in the text editor and save the file.
