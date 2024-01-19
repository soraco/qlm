# How do I make my license keys computer bound?

QLM supports 2 types of computer bound keys: Bound to the Computer Name or User defined.\
\
• Bound to Computer Name: Computer Name bound keys are keys that are bound to a specific computer by encrypting the name of the computer in the license key.\
\
• User Defined: User defined keys are computer bound keys. The computer identifier that is used to uniquely identify a computer is user defined. For example, if you want to create a computer bound key that is bound to the volume serial number, you would need to do the following:

* Use the [QlmHardware ](../api-reference/iqlmhardware/)class to extract the Volume Serial Number from the end user system or create your own function to get the volume serial number or any other identifier of your choice.
* To activate key programmatically during Online Activation, you would extract the volume serial number in your code and provide it as argument to any QLM API that requires a ComputerID. The QLM License Server then generates and returns a computer key bound to the volume serial number.
* To validate a key in your code, you extract the volume serial number and provide that value to the ValidateLicenseEx API or to any API that requires the ComputerID.
