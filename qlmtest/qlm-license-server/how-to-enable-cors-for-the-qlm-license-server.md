# How to enable CORS for the QLM License Server

To enable CORS for the QLM License Server, edit the web.config file of the License Server and add the following fragments in the system.webServer section:

```
<httpProtocol>
   <customHeaders>
      <add name="Access-Control-Allow-Headers" value="accept, content-type" />
      <add name="Access-Control-Allow-Origin" value="*" />
      <add name="Access-Control-Allow-Methods" value="POST, GET, OPTIONS" />
   </customHeaders>
</httpProtocol>
```

Example:

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360078545012/mceclip0.png)
