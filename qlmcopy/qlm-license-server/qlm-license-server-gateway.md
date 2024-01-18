# QLM License Server Gateway

QLM Enterprise v11 includes a license server gateway that you can install at your customer site.

The License Server gateway is ideal in scenarios where your customers' workstations are offline. Rather than using offline activation which involves some manual procedures, you can install the QLM License Server Gateway at your customer's site on a system that is connected to the internet. All workstations that are not connected to the internet can then be configured to connect to the local QLM License Server Gateway which will redirect requests to the real QLM License Server hosted in the cloud.

&#x20;

![](https://support.soraco.co/hc/article\_attachments/360001137106/mceclip0.png)

### Requirements

The License Server gateway requires:

* Microsoft Windows Server 2008 R2 or higher
* .NET 4.5+
* IIS

### Installation

Automated

* At your customer site, deploy the file located in the C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\QlmLicenseServerGateway\Setup\QlmGateway.exe&#x20;
* On a system that meets the requirements above, launch the setup and follow the onscreen instructions.

Manual

* At your customer site, deploy all the files in the C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\QlmLicenseServerGateway\Manual folder to the inetpub folder (c:\inetpub\wwwroot\QlmLicenseServerGateway)
* In IIS, create a new Application Pool called Quick License Manager
* In IIS, under the Default Web Site, or a site of your choice, create a new Application
* Set the Alias to: qlmgateway
* Set the Application Pool to: Quick License Manager
* Set the Physical Path to: c:\inetpub\wwwroot\QlmLicenseServerGateway
* Click Ok

### Configuration

* Edit the web.config file located in c:\inetpub\wwwroot\QlmLicenseServerGateway
* Set the QlmLicenseServerGateway\_QlmAspService\_QlmService property to the URL of the License Server Gateway
* Set the targetLicenseServer property to the URL of the remote License Server
* Save the web.config file
* Configure your clients to connect to the local License Server
