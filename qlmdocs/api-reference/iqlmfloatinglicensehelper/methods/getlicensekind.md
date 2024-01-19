# GetLicenseKind

### Description

Gets the license kind. The license kind can be one of the following:

* Undetermined
* NodeLocked
* FloatingMaster
* FloatingNode

The first time an application runs, the license kind is undetermined. Once a license is activated, GetLicenseKind determines if the activated is a node locked license or a floating license. If the license is a floating license, GetLicenseKind determines if the current node the master node or a regular node.

```c#
ELicenseKind GetLicenseKind(bool licenseValid, string activationKey);
```

### Parameters

| Parameter     |  Type  | Description                                      |
| ------------- | :----: | ------------------------------------------------ |
| licenseValid  |  bool  | Flag indicating whether the license key is valid |
| activationKey | string | The Activation Key                               |

### Return

| Type                                                                          | Description                      |
| ----------------------------------------------------------------------------- | -------------------------------- |
| [ELicenseKind](https://dash.readme.com/project/soraco/v1.0/refs/elicensekind) | status of the license activation |
