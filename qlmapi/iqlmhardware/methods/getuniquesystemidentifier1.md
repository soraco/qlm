# GetUniqueSystemIdentifier1

### Description

Gets a unique system identifier based on the customer's environment.

GetUniqueSystemIdentifier1() first detects if the process is running on a virtual machine. If it is running on a VM, it returns the System Management BIOS UUID which is a unique ID that identifies a VM.

If the process is running on a physical machine, it tries to get the motherboard serial number. If the motherboard serial number can be retrieved, it validates that the motherboard serial number is reliable. Several motherboard manufacturers return unreliable / non-unique serial numbers. If the motherboard serial number is deemed reliable, it returns it to the caller.

If the motherboard serial number is not reliable, it tries to get the following unique identifiers, in the order listed below, and returns the first value that it can reliably retrieve:

* System Enclosure SN: Manufacturer-allocated number used to identify the physical element.
* BIOS SN: BIOS Serial Number.
* Computer SN: Serial number on software, a die number on a hardware chip.
* Volume SN: OS Volume Serial Number.
* First MAC Address: MAC address of the first detected network card.
* Computer Name: The BIOS name of the computer.

```c#
string GetUniqueSystemIdentifier1()
```

### Return

| Type   | Description                   |
| ------ | ----------------------------- |
| string | returns the unique identifier |
