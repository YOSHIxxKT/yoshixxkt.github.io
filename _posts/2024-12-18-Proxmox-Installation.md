---
title: Proxmox Installation
date: 2024-12-18-9:36
categories: [Proxmox]
tags: [Proxmox] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/proxmox000.png
---

## Install Proxmox

### Install Proxmox as a operating system for Home Server


Make a USB Drive using Balena Etcher or Rufus (I found some problems with Rufus, Balena Etcher is much easier and simpler than Rufus.)

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/BalenaEtcher.png)



> Before install proxmox, I needed to change some BIOS setting such as AMD-V, Boot Option, Disable CSM, Disable Secure Boot and Fast Boot.) 

Follow the set up process, 

* Install Proxmox VE (Graphical)
> There is a problem with the installation process not processing and freezing. To solve this issue, modify boot parameters. 1, At the boot menu (when selecting the Proxmox installer), press "e" to edit boot options. 2, Add the following parameters at the end of the line stating with linux: 
```bash
nomodeset
```
* Accept the License
* Select the Target Hard Disk
* Select the "Country", "Time Zone", "Keyboard Layout"
* Set up your password and email
* Set up your Host Name, IP address, Gateway and DNS Server (I set it up as Static address)
* Check the Summary and Install
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/proxmox-000000.jpg)


Login as "root" and type your password

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Proxmox-14.png)

First of all, enable IOMMU in Proxmox Kernel Parameter

> Input-Output Memory Management Unit (IOMMU) is a hardware component that connects a system's main memory to an I/O bus that supports direct-memory-access. It translates device-visible virtual addresses to physical addresses, which is similar to how a traditional Memory Management Unit (MMU) translates CPU-visible virtual addresses to physical addresses. 
IOMMU is useful in virtualization scenarios because it allows for efficient device assignment. For example, it can be used to allocate a specific device exclusively to a virtual machine. IOMMU also improves the efficiency of handling device interrupts in virtualized environments by supporting features like interrupt remapping

Edit the GRUB configuration

```bash
nano /etc/default/grub
```
Add the IOMMU parameters for AMD CPUs to the GRUB_CMDLINE_LINUX_DEFAULT line

```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet amd_iommu=on iommu=pt"
```

Update GRUB

```bash
update-grub
```

Reboot the system to apply the changes
```bash
reboot
```

Verify that the IOMMU is enable

```bash
dmesg | grep -e DMAR -e IOMMU
```

List IOMMU groups
```bash 
find /sys/karnel/iommu_groups/ -type l
```








