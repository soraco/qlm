# GetUniqueSystemIdentifier2

### Description

Gets a unique system identifier based on the customer's environment.

GetUniqueSystemIdentifier2 builds on GetUniqueSystemIdentifier1 by adding exceptions that were not covered by GetUniqueSystemIdentifier1.

Unfortunately, some hardware manufacturers do not use reliable serial numbers for their hardware. QLM tries to handle these cases based on field experience and customer feedback. As these unreliable serial numbers are identified, we add exceptions to ignore them and fall back onto other identifiers.

If you are implementing licensing for a new application, you should always use the latest version, i.e. GetUniqueSystemIdentifier2.

If you are currently using GetUniqueSystemIdentifier1 and would like to upgrade to GetUniqueSystemIdentifier2, you should expect the following behavior:

* If the hardware identifier detected by GetUniqueSystemIdentifier2 is reliable and also deemed reliable by GetUniqueSystemIdentifier1, the same value will be extracted by GettUniqueSystemIdentifier2. The previously generated ComputerKey will therefore continue working as expected.
* If the hardware identifier detected by GetUniqueSystemIdentifier1 is deemed unreliable by GetUniqueSystemIdentifier2, GetUniqueSystemIdentifier2 will fall back onto another identifier thus invalidating the Computer Key that was previously generated. A customer that encounters this issue will need to reactivate his/her license.

```csharp
string GetUniqueSystemIdentifier2()
```

### Return

| Type   | Description                   |
| ------ | ----------------------------- |
| string | returns the unique identifier |
