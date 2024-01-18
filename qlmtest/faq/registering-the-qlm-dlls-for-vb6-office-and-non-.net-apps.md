# Registering the QLM Dlls for VB6, Office and non .NET apps

If you are not using .NET, you need to register the QLM DLLs so that your application can call the QLM API.

The instructions below refer to the VB6 sample we provide but the same approach can be used for any non .NET application.

Note that as of QLM 11, you no longer need to register the QLM DLLs if you use the new VB6 QLM LicenseValidator class.

Before running your program, you need to execute the provided register.bat batch file as an administrator.

\
To do so:

* In Windows, go to Start / All Programs / Accessories.
* Right mouse click on the "Command Prompt" menu item and select "Run As Administrator".
* When the command prompt is displayed, go to the samples folder as follows:
* cd C:\Users\Public\Documents\Quick License Manager\Samples\qlmpro\Windows\VB6
* Run the register.bat" batch file
* If you notice any errors (it might scroll fast), re-run the command as follows: register.bat > register.log
* This will create a log file that you can review or send us in case of errors.
* If everything is successful, you should now be able to successfully run the VB6 sample.
