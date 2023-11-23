# homelab
Scripts for managing resources in my homelab.

## construct-vm.tf
This is a Terraform script to make an empty VM with type Ubuntu 64-bit and attach the Ubuntu ISO to it.

## power-up-lab.yml
An Ansible script to boot up my homelab.

Powers up ESXi via iLO, powers up the vCenter, powers up VMs relating to the Practical Threat Hunting lab.

Future state might use tags to boot up the components I'm looking to use.

## power-down-lab.yml
An Ansible script to shut down my homelab. Finds all powered on VMs on ESXi and then shuts them down. Once they're all off, shut down ESXi.
