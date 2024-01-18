# GetUSBSerialNumber

### Description

Gets the serial number of a USB key on the specified path. If the path does not point to a USB, an empty string is returned.

```c#
string GetUSBSerialNumber (string path)
```

### Parameters

| Parameter |  Type  | Description                             |
| --------- | :----: | --------------------------------------- |
| path      | string | path of a file or folder on the USB key |

### Return

| Type   | Description                           |
| ------ | ------------------------------------- |
| string | return the serial number of a USB key |
