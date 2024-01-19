# ValidateLicenseHttp

### Description

Validates a license key over HTTP. This API validates and activates a license.

The first time you call ValidateLicenseHttp, you provide the activation key (is\_avkey) and the computer identifier (is\_pcid). The server does the following:

* Validates the license
* Verifies if the license has not been previously activated
* Activates the license
* Returns the computer key and the set of features that are enabled.

On subsequent calls to ValidateLicenseHttp, in addition to the previous arguments, you should set the computer key argument using the value returned from the first call. In this instance, the server does the following:

* Validates the license
* Verifies if the license has not been revoked
* Returns the status of the license and the set of features that are enabled.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/ValidateLicenseHttp?is_avkey=<activationKey> &is_pckey=<computer key> &is_pcid=<computer ID> &is_computer_name=<computer name> &is_qlmversion=<QLM Engine version> &is_email=<email of the customer associated to the key> &is_userdata1=<user data to associate with the key> &is_affiliateid=<affiliate to associate to the key>&is_activate=true|false
```

### Arguments

| Parameter           | Description                                                                                                                                                                                                                                                                   |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_activate        | By default, ValidateLicenseHttp validates the license and activates it if needed. If you just want to validate the license and return information about the license, set the is\_activate argument to false. If is\_activate is not specified, the default value is true.     |
| is\_affiliateid     | Affiliate to associate with the license key .This argument is optional and is set only if the license is activated when calling ValidateLicenseHttp.                                                                                                                          |
| is\_alog\_userdata1 | For multiple activation licenses, user data to associate with the specific computer ID being activated (only available as of QLM 12.0.19144.1). This argument is optional and is set only if the license is activated when calling ValidateLicenseHttp.                       |
| is\_avkey           | The current activation key.                                                                                                                                                                                                                                                   |
| is\_computer\_name  | This argument is not required. It is used to easily identify a computer, in case the computer ID is a serial number such as the hard disk serial number.                                                                                                                      |
| is\_email           | Email address of the customer associated with the license key. This argument is optional and is set only if the license is activated when calling ValidateLicenseHttp.                                                                                                        |
| is\_pcid            | If the license has never been validated, you need to specify a computer identifier so that the returned computer key can be bound to this specific computer. A computer ID can be the name of the computer or any other unique identifier of your choice.                     |
| is\_pckey           | If the key has been previously activated, the ValidateLicense method returns a computer key. This computer key should then be used in subsequent calls to ValidateLicense in the is\_pckey argument.                                                                          |
| is\_qlmversion      | QLM engine version.                                                                                                                                                                                                                                                           |
| is\_userdata1       | User data to associate with the license key. This argument is optional and is set only if the license is activated when calling ValidateLicenseHttp.                                                                                                                          |
| is\_writebom        | Determines whether the byte-order-mark (BOM) is written in the returned xml fragment. The possible values are: true\|false. If no argument is specified, the default value is taken from the License Server's web.config file "writeBOM" setting. The default value is false. |

### Optional Arguments

These arguments are optional but recommended.

| Parameter        | Description                  |
| ---------------- | ---------------------------- |
| is\_productid    | ID of the product            |
| is\_majorversion | major version of the product |
| is\_minorversion | minor version of the product |

### Example Output

```xml
<QuickLicenseManager>
<creationDateUtc>2023-10-29 13:14:26</creationDateUtc>
<pckey>JNR9020800G7HJKM8P9Q211E4WAYSITSNYDGB5X</pckey>
<computerName>PC-638266749553925187</computerName>
<computerID>PC-638266749553925187</computerID>
<userCompany>Company-638266749553925187</userCompany>
<userFullName>Tom Spencer-638266749553925187</userFullName>
<userEmail>Tom-638266749553925187@soraco.co</userEmail>
<productID>2</productID>
<productName>Demo Enterprise</productName>
<majorVersion>1</majorVersion>
<minorVersion>0</minorVersion>
<licenseModel>subscription</licenseModel>
<maintenanceRenewalDate>2024-09-02 23:59:59</maintenanceRenewalDate>
<result>Your license is valid and entitles you to install 1 copy of Demo Enterprise. Your license expires on 9/2/2024. Your maintenance plan expires on 9/2/2024.</result>
<status>4</status>
<features>0:7;</features>
<duration>-1</duration>
<floatingSeats>1</floatingSeats>
<numActivationsAllowed>1</numActivationsAllowed>
<availableLicenses>0</availableLicenses>
<expiryDate>2024-09-02 23:59</expiryDate>
<activationKey>FNR9020700G7HJKM8P9Q211JSEUB6ZKJAPHBQEP</activationKey>
<userData/>
<productProperties><?xml version="1.0" encoding="utf-8"?><ProductProperties><Property ID="{8ff1b8b6-1a9a-4205-bdbc-1182d94a8d61}" name="asset1" category="category1" value="123" type="int" help="help text for category 1, property 2" lastDefinitionUpdate="2023-10-19 16:47:50" lastValueUpdate="2023-10-29 13:13:55" expiryDate="0001-01-01 00:00:00" operation="None"></Property><Property ID="{d0d05fd7-91b8-4037-88e3-5a7a82cdfac4}" name="compressors" category="championx" defaultValue="0" value="5" type="int" help="help text for category 2, property 3" lastDefinitionUpdate="2023-10-19 16:45:25" lastValueUpdate="2023-10-29 13:14:01" expiryDate="2023-10-27 00:00:00" operation="None"></Property><Property ID="{22a8d53a-2b51-4502-9f85-193b5f743b3b}" name="asset2" category="category1" value="456" type="int" help="help text for category 1, property 1" lastDefinitionUpdate="2023-10-19 16:47:59" lastValueUpdate="2023-10-29 13:13:57" expiryDate="0001-01-01 00:00:00" operation="None"></Property><Property ID="{352cdecb-3a4d-4a86-bfc7-64ff156da5a3}" name="maxDaysOffline" category="category" defaultValue="-1" value="7" type="int" help="" lastDefinitionUpdate="2023-10-03 16:16:44" lastValueUpdate="2023-10-29 13:14:06" expiryDate="0001-01-01 00:00:00" operation="None"></Property><Property ID="{ac561506-0e76-4998-a282-9575706458f1}" name="property_1" category="category" defaultValue="" value="abc" type="string" help="" lastDefinitionUpdate="0001-01-01 00:00:00" lastValueUpdate="2023-10-29 13:14:10" expiryDate="0001-01-01 00:00:00" operation="None"></Property><Property ID="{f0da08fc-a8e6-4771-8c97-1b19cb2663b2}" name="property_2" category="category" defaultValue="" value="def" type="string" help="" lastDefinitionUpdate="0001-01-01 00:00:00" lastValueUpdate="2023-10-29 13:14:15" expiryDate="0001-01-01 00:00:00" operation="None"></Property><Property ID="{fee3dd57-2423-4e91-a40a-24c7cd4c2cbf}" name="property_3" category="category" defaultValue="" value="hij" type="string" help="" lastDefinitionUpdate="0001-01-01 00:00:00" lastValueUpdate="2023-10-29 13:14:19" expiryDate="0001-01-01 00:00:00" operation="None"></Property></ProductProperties></productProperties>
<activationDate>2023-10-29 13:00</activationDate>
<serverDate>2023-10-29 13:14</serverDate>
<computerType>PC</computerType>
<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
<SignedInfo>
<CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
<SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
<Reference URI="">
<Transforms>
<Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
</Transforms>
<DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
<DigestValue>ivruflfoKnKY20cbJLBTNp3caRc=</DigestValue>
</Reference>
</SignedInfo>
<SignatureValue>wYCZ/lLlrdwF6ptx4b1TR+yQO/Q2RWRXL4SKuP8KE2ZI0buimBTofRGvEY3Ncjt1vj4lL1d5EHqVJm4x3TYJnYxklaxVGORGcmHagDt/et9jTxuhGc50AnvsUOUNfz0MwKkilNX0VypkVOOvLZDRIym/C5R0j+ZO2OT9FBJwJl4=</SignatureValue>
</Signature>
</QuickLicenseManager>
```
