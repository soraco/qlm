# How to invoke a QLM HTTP Method that requires strict authentication

Some QLM HTTP APIs require strict authentication in order to be invoked from a client. To invoke these APIs, follow the steps below:

#### Configure Authentication Settings <a href="#h_01he1frdn4av3gjgxjtrr3e8qk" id="h_01he1frdn4av3gjgxjtrr3e8qk"></a>

There are 2 levels of authentication required to support QLM strict authentication:

* You must configure a user/pwd
* You must configure an API key used to compute a hash that will be verified on the server

To configure these settings:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd party extensions
* Select a 3rd party extension&#x20;
  * Set a user and password
  * Set an API Key (like a password, specify a string of characters)
  * Click Ok

In your application, you must dynamically computer the hash and add it to the header of the request as per the instructions below:

* Compute a SHA256 hash of the URL you are invoking, including all arguments, the timestamp value., and the authentication version. Example: http://localhost:55555/qlmservice.asmx/RetrieveActivationKeyHttp?is\_orderid=1234\&is\_userdata1=99999\&is\_user=ralph\&is\_pwd=123456\&is\_format=json\&X-Qlm-Timestamp:2023-10-30 23:59:00\&X-Qlm-Authentication-Version=2
* Add the value of the hash in a custom header called X-Qlm-Authentication
* Add another custom header, X-Qlm-Timestamp, that contains the current UTC date/time in the following format: yyyy-MM-dd HH:mm:ss. The request will only be honored if it reaches the destination within a specified timeframe from the provided time stamp. The value of the allowed time difference (in seconds) can be configured via the server property security/strictAuthenticationTimestampTolerance.
* Add another custom header, X-Qlm-Authentication-Version, to specify the version of the authentication algorithm. The latest version is 2. You can specify the minimum version allowed by setting the server property security/strictAuthenticationMinimumVersion.
* You can optionally add additional headers that can be used in the evaluation of the hash. The additional headers must start with the "X-Qlm" prefix. These headers are appended to the URL and separated with colons. For example, if you create a header called X-QlmData with the value "my\_data", the hash is computed based on the value of: URL (including arguments) + "\&X-QlmData:my\_data"

#### C# Example of computing the hash in your application <a href="#h_01he1frdn5dms4bye3fqpv3c0v" id="h_01he1frdn5dms4bye3fqpv3c0v"></a>

{% code overflow="wrap" %}
```csharp
string url = "";

string apiKey = "123456";
int authenticationVersion = 2;

string timestamp = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss");
string data = url;
data += "&X-Qlm-Timestamp:" + timestamp;
data += "&X-Qlm-Authentication-Version:" + authenticationVersion;
string hashValue = CalcHMACSHA256Hash(data, apiKey);

HttpWebRequest webReq = (HttpWebRequest)WebRequest.Create(url);
IWebProxy iwp = WebRequest.DefaultWebProxy;
webReq.Credentials = CredentialCache.DefaultCredentials;
webReq.Headers.Add("X-Qlm-Authentication-Token", hashValue);
webReq.Headers.Add("X-Qlm-Timestamp", timestamp);
webReq.Headers.Add("X-Qlm-Authentication-Version", "2");

HttpWebResponse webResponse = (HttpWebResponse)webReq.GetResponse();
if (webResponse != null)
{
    StreamReader sr = new StreamReader(webResponse.GetResponseStream(), Encoding.UTF8);
    //Convert the stream to a string
    response = sr.ReadToEnd();
    sr.Close();
}

// Helper Functions
public static string CalcHMACSHA256Hash(string message, string sharedKey)
{
 var hmac = new HMACSHA256(Encoding.ASCII.GetBytes(sharedKey));
 byte[] hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(message));
 return string.Join("", hash.ToList().Select(b => b.ToString("x2")).ToArray());
 }
```
{% endcode %}

#### Example using Curl to invoke an HTTP method <a href="#h_01he1frdn5xacmvj8m084xdmm3" id="h_01he1frdn5xacmvj8m084xdmm3"></a>

You can use curl to test the authentication of the HTTP method. In the example below, we will use curl to invoke the RetrieveActivationKeyHttp method.

{% code overflow="wrap" %}
```
Curl -H"Qlm-Authentication-Token:1c72d8e817623b87d9f804b0d6c28ee4e26d1a55fed564a9fa5c8099c40fbeb2" -H"Qlm-Timestamp:2020-07-16 13:15:00" "
http://localhost:55555/qlmservice.asmx/RetrieveActivationKeyHttp?is_orderid=1234&is_userdata1=99999&is_user=ralph&is_pwd=123456&is_format=json
"
```
{% endcode %}

#### **Testing your hash value**

There are many online tools that you can use an online tool to test your hash value.

For example, you can use this [tool](https://www.freeformatter.com/hmac-generator.html) as shown below:

* Copy/paste your URL in the tool: [http://localhost:55555/qlmservice.asmx/RetrieveActivationKeyHttp?is\_orderid=1234\&is\_userdata1=99999\&is\_user=ralph\&is\_pwd=123456\&is\_format=json](http://localhost:55555/qlmservice.asmx/RetrieveActivationKeyHttp?is\_orderid=1234\&is\_userdata1=99999\&is\_user=ralph\&is\_pwd=123456\&is\_format=json)
* Enter the API key (from Manage Keys / 3rd party extensions) in the Secret Key field
* Select SHA 256
* Click Computer HMAC

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360062256891)
