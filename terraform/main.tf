
variable "MNEMONICS" {
  type        = string
  description = "The mnemonic phrase used to generate the seed for the node."
}

variable "NETWORK" {
  type        = string
  default     = "main"
  description = "The network to connect the node to."
}

variable "SSH_KEY" {
  type = string
}

variable "ISPCONFIG_NODES" {
  type = string 
}

variable "PANEL_NODE" {
  type = string 
}

variable "WEB_NODE" {
  type = string 
}

variable "DB_NODE" {
  type = string 
}

variable "MAIL1_NODE" {
  type = string 
}

variable "MAIL2_NODE" {
  type = string 
}

variable "NS1_NODE" {
  type = string 
}

variable "NS2_NODE" {
  type = string 
}


terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

provider "grid" {
    mnemonics = "${var.MNEMONICS}"
    network   = "${var.NETWORK}"  
}
resource "grid_network" "net1" {
    nodes = ["${var.ISPCONFIG_NODES}"]
    ip_range = "10.0.0.0/16"
    name = "Net1"
    description = "servicesnetwork"
    add_wg_access = "true"
}
resource "grid_deployment" "D1" { 
  node = "${var.PANEL_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
    vms { 
    name = "panel" 
    description = "panel server" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "2" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "2048" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 
resource "grid_deployment" "D2" { 
  node = "${var.WEB_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
  disks { 
	 name = "Disk2" 
	 size = "250" 
  } 
    vms { 
    name = "web" 
    description = "web server" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "4" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "8192" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	mounts { 
	 disk_name = "Disk2" 
	 mount_point = "/data2" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 
resource "grid_deployment" "D3" { 
  node = "${var.DB_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
  disks { 
	 name = "storage" 
	 size = "250" 
  } 
    vms { 
    name = "db" 
    description = "database server" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "4" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "8192" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	mounts { 
	 disk_name = "storage" 
	 mount_point = "/data2" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 
resource "grid_deployment" "D4" { 
  node = "${var.MAIL1_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
  disks { 
	 name = "storage" 
	 size = "250" 
  } 
    vms { 
    name = "mail1" 
    description = "primary mail" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "2" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "4096" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	mounts { 
	 disk_name = "storage" 
	 mount_point = "/data2" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 
resource "grid_deployment" "D5" { 
  node = "${var.MAIL2_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
  disks { 
	 name = "storage" 
	 size = "250" 
  } 
    vms { 
    name = "mail2" 
    description = "secondary mail" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "2" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "4096" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	mounts { 
	 disk_name = "storage" 
	 mount_point = "/data2" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 
resource "grid_deployment" "D6" { 
  node = "${var.NS1_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
    vms { 
    name = "ns1" 
    description = "dns1" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "2" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "2048" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 
resource "grid_deployment" "D7" { 
  node = "${var.NS2_NODE}" 
  network_name = grid_network.net1.name 
  disks { 
	 name = "root" 
	 size = "25" 
  } 
    vms { 
    name = "ns2" 
    description = "dns2" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "2" 
    publicip = "true" 
    publicip6 = "true" 
    memory = "2048" 
    mounts { 
	 disk_name = "root" 
	 mount_point = "/data1" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 

output "wg_config1" { 
  value = grid_network.net1.access_wg_config 
} 
output "public_ip1" {
 value = grid_deployment.D1.vms[0].computedip 
} 
output "public_ip61" { 
  value = grid_deployment.D1.vms[0].computedip6 
} 
output "public_ip2" {
 value = grid_deployment.D2.vms[0].computedip 
} 
output "public_ip62" { 
  value = grid_deployment.D2.vms[0].computedip6 
} 
output "ygg_ip2" { 
   value = grid_deployment.D2.vms[0].ygg_ip 
} 
output "public_ip3" {
 value = grid_deployment.D3.vms[0].computedip 
} 
output "public_ip63" { 
  value = grid_deployment.D3.vms[0].computedip6 
} 
output "ygg_ip3" { 
   value = grid_deployment.D3.vms[0].ygg_ip 
} 
output "public_ip4" {
 value = grid_deployment.D4.vms[0].computedip 
} 
output "public_ip64" { 
  value = grid_deployment.D4.vms[0].computedip6 
} 
output "ygg_ip4" { 
   value = grid_deployment.D4.vms[0].ygg_ip 
} 
output "public_ip5" {
 value = grid_deployment.D5.vms[0].computedip 
} 
output "public_ip65" { 
  value = grid_deployment.D5.vms[0].computedip6 
} 
output "ygg_ip5" { 
   value = grid_deployment.D5.vms[0].ygg_ip 
} 
output "public_ip6" {
 value = grid_deployment.D6.vms[0].computedip 
} 
output "public_ip66" { 
  value = grid_deployment.D6.vms[0].computedip6 
} 
output "ygg_ip6" { 
   value = grid_deployment.D6.vms[0].ygg_ip 
} 
output "public_ip7" {
 value = grid_deployment.D7.vms[0].computedip 
} 
output "public_ip67" { 
  value = grid_deployment.D7.vms[0].computedip6 
} 
output "ygg_ip7" { 
   value = grid_deployment.D7.vms[0].ygg_ip 
}
