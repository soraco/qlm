# ProcessOrphanedInstances

### Description

Synchronize the activation count on the server v/s the number of running instances on the client. The Activation Count can become out of sync when an application crashes or when an application exits while offline.

```c#
void ProcessOrphanedInstances(int numRunningInstances);
```

### Parameters

| Parameter           | Type | Description                                                            |
| ------------------- | :--: | ---------------------------------------------------------------------- |
| numRunningInstances |  int | Number of running instances of your application on the client computer |
