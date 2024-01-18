# PHP Sample to generate a license key

To generate a license key from PHP:

\<html>\
\<head>\
\<title>QLM PHP Test\</title>\
\</head>\
\<body>\
\<?php echo '\<p>Generated Trial License Key:\</p>';\
\
$URL = "[https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)/GetActivationKeyWithExpiryDate?is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_expduration=30";\
$data = file\_get\_contents($URL);\
echo $data\
\
?>\
\</body>\
\</html>
