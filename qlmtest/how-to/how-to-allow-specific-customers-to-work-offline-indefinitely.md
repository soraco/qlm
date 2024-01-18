# How to allow specific customers to work offline indefinitely

### Overview

The [MaxDaysOffline](https://support.soraco.co/hc/en-us/articles/360046068832) property allows you to configure how many days a customer can work offline and what action to take when the offline period is exceeded.

In some cases, you may want to allow specific customers to work offline indefinitely while restricting other customers to work offline for the period specified in MaxDaysOffline.

This requirement can be addressed by defining a QLM feature that you would enable for specific customers. At the application level, you would first check if that feature is enabled and update the value of MaxDaysOffline accordingly.

### Implementation

#### Create a feature

* Launch the QLM Management Console
* Go to the Define Products tab and select your product
* In the Product Information tab, next to the Features section, click Add
* Add a new feature and note the Feature Set and the Feature ID.
* Save your changes and upload the new product definition to the server

#### Application level changes

At the application level, instead of calling ValidateLicenseAtStartup which will perform the license server validation based on MaxDaysOffline, you will need to first check if the specified feature is enabled and perform the proper validation accordingly.

The code below replaces the standard code which calls ValidateLicenseAtStartup.

```

// Add this code to your application's startup code
if (ValidateLicense () == false)
{
    DisplayLicenseForm();

    if (ValidateLicense() == false)
    {
        Environment.Exit(0);
    }
}

////////////////////////////////////////////////////
// New function to perform license validation instead 
// of the typical ValidateLicenseAtStartup
////////////////////////////////////////////////////
private bool ValidateLicense()
{
    bool ret = false;
    bool validateOnServer = lv.QlmLicenseObject.ValidateOnServer;

    // Disable server-side validation
    lv.QlmLicenseObject.ValidateOnServer = false;

    // Update the license binding as needed
    bool needsActivation = false;
    string errorMsg = string.Empty;

    // Perform a local license validation to check if a specific feature is enabled.
    if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, 
                                    ref errorMsg) == true)
    {
        // assuming that you created a feature to allow a customer to always 
        // run offline with feature Set = 0 and Feature ID = 4.
        bool offlineFeature = lv.QlmLicenseObject.IsFeatureEnabledEx(0, 4);
        if (offlineFeature == true) 
        {
            lv.QlmLicenseObject.MaxDaysOffline = -1;
            lv.QlmLicenseObject.OfflinePeriodExceededAction = 
                                   EOfflinePeriodExceededAction.DoNothing; 
            ret = true;
        }
        else if (validateOnServer == true)
        {
            lv.QlmLicenseObject.ValidateOnServer = validateOnServer;
            ret = lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, 
                                                              ref errorMsg);
        }
    }
    else
    {
        // restore the original setting
        lv.QlmLicenseObject.ValidateOnServer = validateOnServer;
    }
    return ret;
}
```
