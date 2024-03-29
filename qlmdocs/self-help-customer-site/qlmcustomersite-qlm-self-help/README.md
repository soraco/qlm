# Configuration

The QlmCustomerSite portal (QLM Self Help) offers several web pages that you may want to expose to your customers:

* [QlmWebActivation.aspx](offline-activation-page.md)
* [QlmReleaseLicense.aspx](deactivate-license-page.md)
* [QlmRegistrationForm.aspx](trial-registration-page.md)
* [QlmRegistration.asmx](trial-registration-method.md)
* [QlmLicenseInfo.aspx](license-information-page.md)
* [QlmEmailLicense.aspx](email-licenses-page.md)

***

### How to install QlmCustomerSite <a href="#h_01hdm5wzxw7wr70b6bgfe1m27d" id="h_01hdm5wzxw7wr70b6bgfe1m27d"></a>

In order to configure QlmCustomerSite, you need to deploy the QlmCustomerSitefiles to the same server where the QLM License Server is installed.

If you have installed the QLM License Server by using our setup program, you have already installed the QlmCustomerSitefiles.

If you have deployed the QLM License Server manually, copy the QlmCustomerSite folder from C:\Users\Public\Documents\Quick License Manager\DeployToServer\QlmCustomerSite to your server and configure the QlmCustomerSite folder as an IIS Application that uses the same Application Pool as the QLM License Server.

Once deployed, you must update a few settings in the web.config file of QlmCustomerSite, namely:

\<!-- Update these settings with your own values -->

\<connectionStrings>

\<add name="QlmSvcLib.Properties.Settings.qlmConnectionString"\
connectionString="Provider=sqloledb;Data Source=localhost;Initial Catalog=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
providerName="System.Data.OleDb" />

\<add name="QlmCustomerSite.Properties.Settings.qlmConnectionString"\
connectionString="Provider=sqloledb;Data Source=localhost;Initial Catalog=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
providerName="System.Data.OleDb" />

\
\</connectionStrings>



<-- Update the application settings below with your own values -->

\<setting name="sqlSyntax" serializeAs="String">\<value>sql\</value> \</setting>

\<setting name="webServiceUrl" serializeAs="String">\<value>https://qlm3.net/qlmdemo/QlmLicenseServer/qlmservice.asmx\</value> \</setting>

\<setting name="communicationEncryptionKey" serializeAs="String">\<value>{B6163D99-F46A-4580-BB42-BF276A507A14}\</value> \</setting>

\<setting name="adminEncryptionKey" serializeAs="String"> \<value>{C6163D99-F46A-4580-BB42-BF276A507A14}\</value>\</setting>
