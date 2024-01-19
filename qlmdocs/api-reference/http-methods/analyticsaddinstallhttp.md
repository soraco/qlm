# AnalyticsAddInstallHttp

### Description

Registers an installation with the server. You should call this function once when your application is installed. You should store the returned installID in your application's settings and reuse it on subsequent calls to the QlmAnalytics API.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/AnalyticsAddInstallHttp?is_swversion=1.0&is_osversion=Windows 7&...
```
{% endcode %}

### Arguments

| Parameter          | Description                               |
| ------------------ | ----------------------------------------- |
| is\_swversion      | version of your software                  |
| is\_osversion      | version of the operating system           |
| is\_computer\_name | name of the computer.                     |
| is\_computerID     | unique computer identifier                |
| is\_avkey          | activation key on the system              |
| is\_pckey          | computer key associated with the system   |
| is\_trial          | flag indicating if the license is a trial |
| is\_productname    | name of your product                      |
| is\_majorversion   | major version of your product             |
| is\_minorversion   | minor version of your product             |
| is\_customdata1    | your own custom data                      |
| is\_customdata2    | your own custom data                      |
| is\_customdata3    | your own custom data                      |
