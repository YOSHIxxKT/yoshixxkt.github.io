---
title: Implement Intersite Connectivity
date: 2025-02-04-10:29
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Vnet%20peering.png
---

## Implement Intersite Connectivity

### Scenario

Your organization segments core IT apps and services (such as DNS and security services) from other parts of the business, including your manufacturing department. However, in some scenarios, apps and services in the core area need to communicate with apps and services in the manufacturing area. In this lab, you configure connectivity between the segmented areas. This is a common scenario for separating production from development or separating one subsidiary from another.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab05-architecture.png)

### Task 1: Create a core services virtual machine and virtual network

In this task, you create a core services virtual network with a virtual machine.

1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select Virtual Machines.

3. From the virtual machines page, select Create then select Azure Virtual Machine.

4. On the Basics tab, use the following information to complete the form, and then select Next: Disks >. For any setting not specified, leave the default value.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-1-4(1).png)

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-1-4(2).png)

5. On the Disks tab take the defaults and then select Next: Networking >.

6. On the Networking tab, for Virtual network, select Create new.

7. Use the following information to configure the virtual network, and then select Ok. If necessary, remove or replace the existing information.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-1-7.png)

8. Select the Monitoring tab. For Boot Diagnostics, select Disable.

9. Select Review + Create, and then select Create.

10. You do not need to wait for the resources to be created. Continue on to the next task.

### Task 2: Create a virtual machine in a different virtual network

In this task, you create a manufacturing services virtual network with a virtual machine.

1. From the Azure portal, search for and navigate to Virtual Machines.

2. From the virtual machines page, select Create then select Azure Virtual Machine.

3. On the Basics tab, use the following information to complete the form, and then select Next: Disks >. For any setting not specified, leave the default value.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-2-3(1).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-2-3(2).png)


4. On the Disks tab take the defaults and then select Next: Networking >.

5. On the Networking tab, for Virtual network, select Create new.

6. Use the following information to configure the virtual network, and then select Ok. If necessary, remove or replace the existing address range.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-2-6.png)

7. Select the Monitoring tab. For Boot Diagnostics, select Disable.

8. Select Review + Create, and then select Create.


### Task 3: Use Network Watcher to test the connection between virtual machines

In this task, you verify that resources in peered virtual networks can communicate with each other. Network Watcher will be used to test the connection. Before continuing, ensure both virtual machines have been deployed and are running.

1. From the Azure portal, search for and select Network Watcher.

2. From Network Watcher, in the Network diagnostic tools menu, select Connection troubleshoot.

3. Use the following information to complete the fields on the Connection troubleshoot page.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-3-3.png)

4. Select Run diagnostic tests.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-3-4.png)

> Note: It may take a couple of minutes for the results to be returned. The screen selections will be greyed out while the results are being collected. Notice the Connectivity test shows UnReachable. This makes sense because the virtual machines are in different virtual networks.

### Task 4: Configure virtual network peerings between virtual networks

In this task, you create a virtual network peering to enable communications between resources in the virtual networks.

1. In the Azure portal, select the CoreServicesVnet virtual network.

2. In CoreServicesVnet, under Settings, select Peerings.

3. On CoreServicesVnet | Peerings, select + Add. If not specified, take the default.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-4-3(1).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-4-3(2).png)

4. In CoreServicesVnet | Peerings, verify that the CoreServicesVnet-to-ManufacturingVnet peering is listed. Refresh the page to ensure the Peering status is Connected.

5. Switch to the ManufacturingVnet and verify the ManufacturingVnet-to-CoreServicesVnet peering is listed. Ensure the Peering status is Connected. You may need to Refresh the page.

### Task 5: Use Azure PowerShell to test the connection between virtual machines

In this task, you retest the connection between the virtual machines in different virtual networks.

### Verify the private IP address of the CoreServicesVM

1. From the Azure portal, search for and select the CoreServicesVM virtual machine.

2. On the Overview blade, in the Networking section, record the Private IP address of the machine. You need this information to test the connection.


### Test the connection to the CoreServicesVM from the ManufacturingVM.

> Did you know? There are many ways to check connections. In this task, you use Run command. You could also continue to use Network Watcher. Or you could use a Remote Desktop Connection to the access the virtual machine. Once connected, use test-connection. As you have time, give RDP a try.

3. Switch to the ManufacturingVM virtual machine.

4. In the Operations blade, select the Run command blade.

5. Select RunPowerShellScript and run the Test-NetConnection command. Be sure to use the private IP address of the CoreServicesVM.

``` Bash
Test-NetConnection <CoreServicesVM private IP address> -port 3389
```
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-5-5.png)

6. It may take a couple of minutes for the script to time out. The top of the page shows an informational message Script execution in progress.

7. The test connection should succeed because peering has been configured. Your computer name and remote address in this graphic may be different.

### Task 6: Create a custom route

In this task, you want to control network traffic between the perimeter subnet and the internal core services subnet. A virtual network appliance will be installed in the core services subnet and all traffic should be routed there.

1. Search for select the CoreServicesVnet.

2. Select Subnets and then + Create. Be sure to Save your changes.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-6-2.png)

3. In the Azure portal, search for and select Route tables, and then select Create.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-6-3.png)

4. After the route table deploys, select Go to resource.

5. Select Routes and then + Add. Create a route from the future NVA to the CoreServices virtual network.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-6-5.png)

6. Select + Add when the route is completed. The last thing to do is associate the route with the subnet.

7. Select Subnets and then Associate. Complete the configuration.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab5-6-7.png)

> Note: You have created a user defined route to direct traffic from the DMZ to the new NVA.