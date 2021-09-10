## Challenge 2
We need to write code that will query the meta data of an instance within aws and provide a json formatted output. The choice of language and implementation is up to you.
Bonus Points
The code allows for a particular data key to be retrieved individually
Hints
- Aws Documentation
- Azure Documentation
- Google Documentation

## Assumption 
We are using Azure Cloud to demonstrate this. Azure Cloud provides an instance metadata service which can be utilised. For more details visit -
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service?tabs=windows


## Solution

Solution is a python script which uses `json` and `requests` library for accessing data from API.


#### script

This API is not exposed externally so you need to execute this inside any Azure Public cloud Server. The API call must contain the header `Metadata: true` 

Script Execution will print the complete JSON response received from the api call. After that It will ask for passing a key to be retrieved individually. 


#### output


** full response omitted
```
# python3 metadata_fetch.py

 "subscriptionId": "xxxxx-xxxx-xxxx-xxxx-xxxxx",
 "tags": "",
 "tagsList": [],
 "userData": "",
 "version": "20.04.202107200",
 "vmId": "xxxx-xxx-xxx-xx-xxxx",
 "vmScaleSetName": "",
 "vmSize": "Standard_D2s_v3",
 "zone": ""
}
Enter a key value: 
osDisk
{'caching': 'ReadWrite', 'createOption': 'FromImage', 'diffDiskSettings': {'option': ''}, 'diskSizeGB': '30', 'encryptionSettings': {'enabled': 'false'}, 'image': {'uri': ''}, 'managedDisk': {'id': '/subscriptions/0259fbe9-35b0-42dc-b35b-faae1754d42d/resourceGroups/RG-VSTUDIO/providers/Microsoft.Compute/disks/master_OsDisk_1_cb1388f4d9124c75a48066494237cd68', 'storageAccountType': 'StandardSSD_LRS'}, 'name': 'master_OsDisk_1_cb1388f4d9124c75a48066494237cd68', 'osType': 'Linux', 'vhd': {'uri': ''}, 'writeAcceleratorEnabled': 'false'}

# anothe key example
Enter a key value: 
azEnvironment

AzurePublicCloud

```
