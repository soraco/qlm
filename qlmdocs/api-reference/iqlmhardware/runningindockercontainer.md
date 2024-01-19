# RunningInDockerContainer

### Description

Determines if the app is running in a Docker Container based on the environment variable QLM\_RUNNING\_IN\_DOCKER\_CONTAINER which should be set during image creation to True.

```csharp
bool RunningInDockerContainer   ()
```

### Return

| Type | Description                                                          |
| ---- | -------------------------------------------------------------------- |
| bool | returns true if the current process is running in a docker container |
