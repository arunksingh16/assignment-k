## Challenge 1
A 3 tier environment is a common setup. Use a tool of your choosing/familiarity create these resources. Please remember we will not be judged on the outcome but more focusing on the approach, style and reproducibility.


## Assumption

1. 3 tier architecture will be deployed in Azure Cloud using terraform
2. All 3 VMs will be accessed using credential stored in KV generated at runtime
3. All 3 VMs are in different subnet protected by NSG
4. terraform state is stored remotely in Azure Blob container


## Solution

Terraform based deployment to support following Azure Infra components -
- 1 Azure VNet 
- 3 Azure Subnet
- 3 Azure NSG
- 3 Linux VM
- 1 Key Vault

Terraform deployment has following files for specific purpose. 
- main.tf   [ for modules, providers and data-sources to create all resources ]
- var.tf    [ Variables ]
- vnet.tf   [ For VNet/Subnet/NSG deployment ]
- sa.tf     [ For SA deployment ]
- kv.tf     [ For KV deployment ]
- winvm.tf  [ For Linux VM Deployment ]


Terraform `Azurerm` for backend where `tf state` will be stored. I am using Azure Blob container for same. 
So before proceeding for tf setup, I created a SA and Blob container using cli (you can use tf for this task as well) To access the container while tf executes, there are multiple ways. I am using simplest possible way, the Azure CLI or a Service Principal.

### how to deploy 

Step 1: Clone this repository

Step 2: Create SA/Blob container using Azure CLI and update the details in `terraform backend`. Update the information in main.tf file.

Step 3: Login using `az login` on the client machine from where you are going to run terraform scripts

Step 4: Execute the command in sequence.

```
terraform init
terraform plan -out threetier.tfplan
terraform apply threetier.tfplan

```

Step 5: Destroy the environment once poc is over.
```
terraform destroy
```

Step 4: Verify

### how to verify

Use stored credential in Key Vault to log on VMs. Login in Portal to verify the other comps as well.


### output

** omitted output
```
Apply complete! Resources: 20 added, 0 changed, 0 destroyed.

Outputs:

kv_name = "devkv-aathisisunique"
linuxvm-1-name = "dev-linuxvm-1"
linuxvm-2-name = "dev-linuxvm-2"
linuxvm-3-name = "dev-linuxvm-2"
network_name = "dev-network"
nsg-1 = "dev-http-nsg"
nsg-2 = "dev-app-nsg"
nsg-3 = "dev-db-nsg"
subnet-1 = "subnet1"
subnet-2 = "subnet2"
subnet-3 = "subnet3"
```