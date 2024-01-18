# Configure a redirect to another QLM License server using a PHP script

The following PHP script can be used to setup a redirect from your server to another QLM License Server.

In the script below, replace qlm2.net/customer with the corresponding value on your target server.

```
<?php
$target_url = "https://qlm2.net/customer"; // qlmlicenseserver/qlmservice.asmx
$self_location = str_replace($_SERVER['DOCUMENT_ROOT'], "", __FILE__);
$new_uri = str_replace($self_location, $target_url, $_SERVER['REQUEST_URI']);
header("Location: " . $new_uri, true, 302);
?>
```

* [license\_server.php](https://support.soraco.co/hc/en-us/article\_attachments/4409172613780)285 Bytes [Download](https://support.soraco.co/hc/en-us/article\_attachments/4409172613780)
