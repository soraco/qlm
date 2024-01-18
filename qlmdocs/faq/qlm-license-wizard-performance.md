# QLM License Wizard Performance

Depending on the selected settings, the QLM License Wizard performs some tasks at startup. The most common operations that can impact the performance of the QLM License Wizard are described below.

#### Checking for updates

The QlmShowCheckForUpdates property instructs the license wizard to contact the license server and retrieve the latest version of the application that the customer is entitled to. You can turn off this option by setting QlmShowCheckForUpdates  to false from the Protect Your Application tab.

#### Loading the factory settings then loading the xml settings file

If you are using the QLM License Wizard .NET User Control or the QlmLicenseWizard .NET Class, you should set the QlmDelayInitialization property to true in order to instruct the wizard to bypass loading the factory settings. Right after creating the control, you should call LoadSettings and PostInitialize. If you are using the QLM License Wizard executable, this is already taken care of.
