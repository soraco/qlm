# GetNumberOfRunningInstances

### Description

Get the number of running instances of a Windows application.

```c#
 int GetNumberOfRunningInstances ()
```

### Return

| Data Type | Description                     |
| :-------: | ------------------------------- |
|    int    | the number of running instances |

### Remarks

This method can be used when your application is a standard Windows application such as a desktop application.

When this method is called, it identifies the name of the current process, looks for all running processes with the same name, and returns their count.
