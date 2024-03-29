# Offline Activation Page

### QlmWebActivation.aspx <a href="#h_01hdm5wzxvf2md75hcefx65wp3" id="h_01hdm5wzxvf2md75hcefx65wp3"></a>

**QlmWebActivation.aspx** is a web page that allows a user to enter an activation key and a computer ID for the purpose of generating a Computer Key. This is useful when a customer's system does not have an internet connection and they would like to perform an offline activation. The customer would:

* Go to a computer that has internet access
* Enter the Activation Key and ComputerID
* Receive a Computer Key
* Go to the computer that does not have internet access
* Paste the Computer Key in the "Manual Activation" / Computer Key field
* Click Activate

| **Argument** | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| is\_avkey    | Activation Key of the end-user                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| is\_pcid     | Computer ID of the end-user. This argument is optional if the license is a single activation license key.                                                                                                                                                                                                                                                                                                                                                        |
| is\_pp       | <p>Set is_pp to 1 to have this page generate a digitally signed Product Properties file. When generating a Product Properties file, you can customize the following settings in the web.config file of QlmCustomerSite:</p><ul><li>productPropertiesFileName: the name of the generated Product Properties file.</li></ul><p>Note: this option is available as of QLM 11.0.18147.1</p>                                                                           |
| is\_file     | <p>Set is_file to 1 to have this page generate a digitally signed license file (for QLM Enterprise users building cross-platform apps). When generating a license file, you can customize the following settings in the web.config file of QlmCustomerSite:</p><ul><li>offlineActivationSuccessMessage: the message that is displayed upon successful generation of the license file.</li><li>licenseFileName: the name of the generated license file.</li></ul> |

&#x20;

Example of generating a computer key:

https://qlm3.net/qlmdemo/qlmcustomersite/QlmWebActivation.aspx?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123

Example of generating a digitally signed Product Properties file:

https://qlm3.net/qlmdemo/qlmcustomersite/QlmWebActivation.aspx?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123\&is\_pp=1

Example of generating a digitally signed license file (cross-platform apps):

https://qlm3.net/qlmdemo/qlmcustomersite/QlmWebActivation.aspx?is\_avkey=AXK80-60R00-GHJ3S-I862Y-1I1UR-AQDV2\&is\_pcid=123\&is\_file=1
