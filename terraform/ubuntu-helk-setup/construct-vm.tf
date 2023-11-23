provider "vsphere" {
    vsphere_server = "vcsa.homelab"
    user = "administrator@vsphere.local"
    password = "${var.vsphere_password}"
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "Homelab"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore7"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "vSwitch1-vlan0"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "ubuntu01"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 4
  memory           = 12288
  guest_id         = "ubuntu64Guest"
  wait_for_guest_net_timeout = 0
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = 50
    thin_provisioned = true
    unit_number = 0
  }
  disk {
    label = "disk1"
    size  = 200
    thin_provisioned = true
    unit_number = 1
  }

  cdrom {
    datastore_id = "datastore-2001"
    path = "[synology01] ISO/ubuntu/ubuntu-23.10-live-server-amd64.iso"
  }
}
