# LaunchProcess

### Description

Launches an external process.

```c#
int LaunchProcess(string exeFilename, string args, bool bWait, 
                  bool elevatedPrivileges)
```

### Arguments

| Name               | Data Type | Description                                                                                                                                                                                                                                                                |
| ------------------ | :-------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| exeFilename        |   string  | the full path of the executable to launch                                                                                                                                                                                                                                  |
| args               |   string  | arguments to provide to the executable                                                                                                                                                                                                                                     |
| bWait              |    bool   | flag that indicates whether to wait for the process to exit before proceeding                                                                                                                                                                                              |
| elevatedPrivileges |    bool   | flag that indicates whether the process should request elevated privileges. When using this API to launch the QLM License Wizard, it is recommended to launch the process with elevated privileges to allow the License Wizard to store license keys at the MACHINE level. |

### Return

| Data Type | Description              |
| :-------: | ------------------------ |
|    int    | exit code of the process |
