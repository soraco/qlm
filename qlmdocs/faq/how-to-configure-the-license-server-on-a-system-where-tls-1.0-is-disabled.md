# How to configure the License Server on a system where TLS 1.0 is disabled

1\. Install the latest [Microsoft® OLE DB Driver 18 for SQL Server](https://www.microsoft.com/en-us/download/details.aspx?id=56730)&#x20;

2\. Update the connection string in the web.config by setting the Provider value to **msoledbsql** as shown below (change the values as needed):

```
<connectionStrings>
<add name="QlmWebService.Properties.Settings.qlmConnectionString" connectionString="Provider=msoledbsql;Server=localhost;Database=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"/>
<add name="QlmSvcLib.Properties.Settings.qlmConnectionString" connectionString="Provider=msoledbsql;Server=localhost;Database=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"/>
<add name="aspConnectionString" connectionString="Data Source=localhost;Initial Catalog=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"providerName="System.Data.SqlClient" />
</connectionStrings>
```
