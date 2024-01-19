# Properties

| Name            |          Type          | Description                                                                                                                                              |
| --------------- | :--------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| FloatingLicense | IQlmFloatingLicenseMgr | Gets the underlying QlmFloatingLicenseMgr object. The QlmFloatingLicenseMgr is created during the call to QlmFloatingLicenseHelper.Init (...).           |
| DbType          |           int          | Gets the database type in use. The options are: XML, MS-Access and SQL Server. The DB type should be set when calling QlmFloatingLicenseHelper.Init().   |
| NodeName        |         string         | Gets the name of the current node. The node name is set when calling QlmFloatingLicenseHelper.Init(...).                                                 |
| QlmDbPath       |         string         | Gets the floating license database path. The path should be set when initially activating the license. This is typically done by the QLM License Wizard. |
