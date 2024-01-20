# License Server Performance Tips

The performance of the License Server is dependent on several factors:

* The hardware configuration of the server:
  * CPU
  * Memory
  * Disk drive speed
  * Network bandwidth and speed
* The memory configuration of SQL Server
* The configuration of the IIS Application Pool

Additionally, the following operations have a direct impact on the required server configuration:

* Number of client requests for activation
* Number of client requests for validation
* Number of client requests for information
* Number of vendor requests from QLM Management Console
* Number of vendor requests from the QLM Portal
* Number of backup requests and frequency
* Number of Scheduled Tasks and Frequency

Since there are too many factors at play, this article gives general recommendations in terms of the system's configuration to improve the response time from the server.

### Hardware configuration

* Minimum of 2 Cores
* Minimum of 16 GB of RAM
* SSD drive

#### SQL Server Configuration

* Allocate a minimum of 4 GB to SQL Server.
* Increase this limit if needed.

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/360090294912/mceclip2.png)

#### IIS Application Pool

All QLM applications are typically associated with a single application pool called Quick License Manager. The first time a request is received, the Application Pool is loaded in memory and remains in memory until it is recycled. The process of loading the Application Pool into memory can add a few seconds to the initial request. By default, the Application Pool recycles every 1740 minutes (29 hours).&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360090266811/mceclip0.png)
