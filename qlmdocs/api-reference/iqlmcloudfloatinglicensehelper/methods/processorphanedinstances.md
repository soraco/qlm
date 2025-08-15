# ProcessOrphanedInstances

### Description

Synchronize the activation count on the server v/s the number of running instances on the client. The Activation Count can become out of sync when an application crashes or when an application exits while offline.

```csharp
void ProcessOrphanedInstances(int numRunningInstances);
```

### Parameters

| Parameter           | Type | Description                                                            |
| ------------------- | :--: | ---------------------------------------------------------------------- |
| numRunningInstances |  int | Number of running instances of your application on the client computer |

### Remarks

The number of running instances can be calculated by calling QlmLicense.[GetNumberOfRunningInstances](../../qlmlicense/client-side-methods/getnumberofrunninginstances.md) which counts the number of processes currently running on the system with the same process name.

ProcessOrphanedInstances only processes orphans associated with the current system.
