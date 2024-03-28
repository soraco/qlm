# Private Key

QLM implements asymmetric encryption to encrypt the license key. Asymmetric enryption is safer because one key encrypts the license, the private key, and another key, the public key, decrypts that information. Therefore, you only need to include the public key in your source code.

This function sets the private key associated with your product. The private key should be set before you create a license, typically right after the call to DefineProduct. If you are creating a license key with a QLM engine version prior to version 5, you do not need to set the private key. It is highly recommended that you do not set the private key in your code.

The private key of your product can be found on the DefineProduct screen under the Keys tab in the QLM Console.
