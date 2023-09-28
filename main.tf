terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "e76056e0-70de-4da8-b02e-61263a150b1f"
  tenant_id         = "92b796c5-5839-40a6-8dd9-c1fad320c69b"
  client_id         = "7f477fa3-1a1f-4877-ba80-f39bb563f1b5"
  client_secret     = "Ly0U51rkN64rl51NFi~_~i~-dvsoT~_7s2"
}

resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}
