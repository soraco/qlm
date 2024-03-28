# PublicKey

QLM implements asymmetric encryption to encrypt the license key. Asymmetric enryption is safer because one key encrypts the license, the private key, and another key, the public key, decrypts that information. Therefore, you only need to include the public key in your source code.

This function sets the public key associated with your product. The public key should be set before you validate a license, typically right after the call to DefineProduct. If you are validating a license key with a QLM engine version prior to version 5, you do not need to set the public key.

The public key of your product can be found on the DefineProduct screen under the Keys tab in the QLM Console.
