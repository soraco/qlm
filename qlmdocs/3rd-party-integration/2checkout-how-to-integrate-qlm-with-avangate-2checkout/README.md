# 2Checkout - How to integrate QLM with Avangate / 2checkout

### Overview

If you are using Avangate / 2checkout as an eCommerce provider, QLM integrates seamlessly with the 2Checkout ordering system. After completing the steps below, when a customer purchases your product from 2checkout, 2checkout will automatically get a license key from the QLM License Server and then update the QLM database with the license and customer information.&#x20;

2Checkout offers several methods to integrate with 3rd party tools like QLM.

The first method allows you to create a 2checkout Dynamic Code list and specify a URL that 2checkout connects to when a purchase is made. This approach works with regular products but  does not support subscription products.

The second method uses 2checkout IPN (Instant Payment Notification) to connect to the License Server when a transaction is completed and transfer a payload that contains details about the transactions. The second method is only supported as of QLM 19.1.25310.1

The following sections describe how to use each method.
