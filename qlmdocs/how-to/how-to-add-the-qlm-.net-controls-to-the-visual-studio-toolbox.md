# How to add the QLM .NET Controls to the Visual Studio Toolbox

When you install QLM, the QLM .NET User Controls should get automatically added to your Visual Studio Toolbox. In some cases, if Visual Studio is open during the QLM installation, the registration of the QLM .NET controls may fail.

In order to add the QLM .NET User Controls to your Visual Studio Toolbox, follow the procedure below.

&#x20;

**Automated Procedure**

* Close all instances of Visual Studio
* Launch the QLM Management Console
* Click the QLM icon in the top left-hand corner and select Options

![](https://support.soraco.co/hc/article\_attachments/115017860426/mceclip0.png)

* On the General tab, click the Repair button and wait a few minutes

![](https://support.soraco.co/hc/article\_attachments/115004870483/mceclip1.png)

&#x20;

**Manual Procedure**

* Launch Visual Studio
* Open a WinForms form
* Open the Visual Studio Toolbox by clicking View / Toolbox
* Right-mouse click the ToolBox and select "Add Tab"
* Enter QLM as the tab name
* Select the QLM tab, then right mouse click and select Choose Items
* Click Browse then select the QlmControls.dll located in C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0 or C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0 depending on whether your application is a .NET 2.0 or .NET 4.0 app.
* Click Ok
* You should see 4 QLM controls in the QLM tab. We recommend that you use the QlmWizardControl or the QLMActivationControl. QlmWebBasicActivationControl is an older version that is kept for backward compatibility. QlmExpressLicenseValidationControl should be used by QLM Express customers

![](https://support.soraco.co/hc/article\_attachments/115004908946/mceclip2.png)
