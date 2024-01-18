# How to bind a license to a Docker Container?

Applies to: QLM Enterprise

Version: 16.0.22152.2

***

### Overview

If you run your application within a docker container, QLM can bind the license to the hostname of the docker container.

### Configuration

There are two ways you can configure QLM to bind the license to a Docker Container:

* By setting the ELicenseBinding to QlmUniqueSystemIdentifier2
* By setting the ELicenseBinding to DockerContainer

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/6702318402708/mceclip0.png)

### Detection

To detect that your application is running in a Docker Container, QLM relies on the following environment variable: QLM\_RUNNING\_IN\_DOCKER\_CONTAINER

Therefore, when you create your Docker container image, you must set the QLM\_RUNNING\_IN\_DOCKER\_CONTAINER environment variable to True.

Example of a Dockerfile used to create an image:

<pre><code>FROM mcr.microsoft.com/dotnet/framework/runtime
WORKDIR /app
<strong>ENV QLM_RUNNING_IN_DOCKER_CONTAINER=true
</strong>COPY ./publish .
ENTRYPOINT ["/app/QlmCSharpConsoleAppSample.exe"]
</code></pre>

The following API is also available to detect if your application is running in a Docker Container (requires that your image sets the QLM\_RUNNING\_IN\_DOCKER\_CONTAINER environment variable): QlmHardware.RunningInDockerContainer()

Example:

```
QlmHardware hw = new QlmHardware();
bool isRunningInDockerContainer = hw.RunningInDockerContainer ();
```
