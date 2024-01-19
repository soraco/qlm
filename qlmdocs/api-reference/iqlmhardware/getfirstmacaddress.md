# GetFirstMACAddress

### Description

Gets the MAC address of the first network card found on the system. Note that some computer systems have several network cards. This function returns the MAC address of the first card only. To get a list of all MAC addresses on a system, use the GetMACAddresses method.

```csharp
string GetFirstMACAddress ()
```

### Return

| Type   | Description                                                           |
| ------ | --------------------------------------------------------------------- |
| string | returns the MAC address of the first network card found on the system |
