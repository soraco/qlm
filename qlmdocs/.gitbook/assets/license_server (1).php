<?php
$target_url = "https://qlm2.net/customer"; // qlmlicenseserver/qlmservice.asmx
$self_location = str_replace($_SERVER['DOCUMENT_ROOT'], "", __FILE__);
$new_uri = str_replace($self_location, $target_url, $_SERVER['REQUEST_URI']);
header("Location: " . $new_uri, true, 302);
?>