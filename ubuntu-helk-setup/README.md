# Homelab Ubuntu HELK setup
Scripts for setting up HELK on top of ubuntu - starting with a bare VM

## Outline of tasks
### 1-construct-vm.tf
* Ubuntu VM provisioning - makes an empty VM configured for an Ubuntu server, with a filepath pointing to the ISO image

### 2-start-containers.tf (to be written)
* Powers on ubuntu VM, waits for Tools to come up
* Starts containers via command:
>  `cd ~/github/HELK/docker`

> `sudo docker-compose -f helk-kibana-notebook-analysis-alert-basic.yml stop`
