provider "azurerm" {
    version = "2.5.0"
    features {}
}

terraform {
    backend "azurerm" {
        resource_group_name = "tf_rg"
        storage_account_name = "tfstoragesridhar"
        container_name = "tfstate"
        key = "terraform.tfstate"
        subscription_id = "c88267eb-7f60-4620-bdac-44c5da10f56e"
     #  client_id       = "REDACTED"
    #   client_secret   = "REDACTED"
        tenant_id       = "6a8de571-d16e-4a63-b23d-5710aee607ef"
    
    }
}   
resource "azurerm_resource_group" "tf_test" {
    name = "tfmainrg"
    location = "East US"
  
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "binarythistlewa"
    os_type = "linux"
    container {
        name = "weatherapi"
        image = "sridharthangella1/weatherapi"
        cpu = "1"
        memory = "1"

        ports {
            port = 80
            protocol = "TCP"
          
        }
      
    }

  
}
#init
#plan
#apply
#destroy 

