---
title: Launching a Virtual Machine on Proxmox
date: 2025-02-05-14:08
categories: [Home Server]
tags: [Home Server] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%20000.jpg
---
 
 ## Launching a Virtual Machine


 ### Create a Virtual Machine

We are going to launch Ubuntu on proxmox so that it downloads the ubuntu server and installs it onto the local network.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%201.png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%202.png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%203.png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%204.png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%205.png)



 Configured settings and install Ubuntu Server Instance

 ### Connect to web server instance via ssh

 ``` bash
 ssh username@19x.2x.xx.xx
 ```

 ### Verify it is runnung in proxmox

 ``` bash
 cat /proc/cpuinfo
 ```

 ### Update every instance of ubuntu server is updated

 ``` bash
 sudo apt update && sudo apt dist-upgrade
 ```

 ### Install qemu guest agent for my distribution

 ``` bash
 sudo apt install qemu-guest-agent
 ```
 ### Check the status of that particular service and see if it's running

 ``` bash
 systemctl status qemu-guest-agent.service
 ```

 ### If it has error, go back to option settings and enable QEMU guest agent. Poweroff VM and start again.

 ![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%206.png)

 ### Install apache

 ``` bash
 sudo apt install apache2
 ```

 ### Access the IP address on web browser

 ![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/prox-vm%207.png)

 We see the default sample web page for apache, so not only is the VM working but also able to access an application running inside the VM as well.

 