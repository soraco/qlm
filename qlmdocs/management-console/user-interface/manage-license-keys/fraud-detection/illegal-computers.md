# Illegal Computers

QLM can track illegal computers that connect to the License Server and logs information about these computers in the database. An illegal computer is defined as a computer that has a valid license key but whose license key is (a) not in the database or (b) in the database but registered for another computer. This situation can occur if a user with a valid license key requests that his license be released from computer A claiming to have uninstalled your program from computer A. If the user subsequently attempts to connect to the License Server via computer A, QLM detects this computer as an illegal computer and logs it into the database.

The QLM API includes a method called IsIllegalComputer to detect illegal computers. This method should ideally be called every time your application is launched.

If you are using the [LicenseValidator ](../../../../api-reference/.net-api/licensevalidator/)class, and you enable [server-side license ](../../../../faq/server-side-license-validation.md)validation, the IsIllegalComputer API is automatically called so there's no need to explicitly call it.

To view illegal computers, click on the Manage Keys tab then select the Illegal Computers button.

Note that QLM does not prevent users from running your application if an illegal computer is detected.
