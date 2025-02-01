---
title: Manage Virtual Machines
date: 2025-02-01-9:19
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/azureVirtualMachine.png
---

### Manage Virtual Machines

### Scenario

Your organization wants to explore deploying and configuring Azure virtual machines. First, you implement an Azure virtual machine with manual scaling. Next, you implement a Virtual Machine Scale Set and explore autoscaling.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab08-vm-architecture.png)

### Task 1: Deploy zone-resilient Azure virtual machines by using the Azure portal

In this task, you will deploy two Azure virtual machines into different availability zones by using the Azure portal. Availability zones offer the highest level of uptime SLA for virtual machines at 99.99%. To achieve this SLA, you must deploy at least two virtual machines across different availability zones.

1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select Virtual machines, on the Virtual machines blade, click + Create, and then select in the drop-down Azure virtual machine. Notice your other choices.

3. On the Basics tab, in the Availability zone drop down menu, place a checkmark next to Zone 2. This should select both Zone 1 and Zone 2.

> Note: This will deploy two virtual machines in the selected region, one in each zone. You achieve the 99.99% uptime SLA because you have at least two VMs distributed across at least two zones. In the scenario where you might only need one VM, it is a best practice to still deploy the VM to another zone

4. On the Basics tab, continue completing the configuration:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_1_4_(1).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_1_4_(2).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_1_4_(3).png)

5. Click Next : Disks > , specify the following settings (leave others with their default values):

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_1_5.png)

6. Click Next : Networking > take the defaults but do not provide a load balancer.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_1_6.png)

7. Click Next : Management > and specify the following settings (leave others with their default values):

8. Click Next : Monitoring > and specify the following settings (leave others with their default values):

9. Click Next : Advanced >, take the defaults, then click Review + Create.

10. After the validation, click Create.

> Note: Notice as the virtual machine deploys the NIC, disk, and public IP address (if configured) are independently created and managed resources.

11. Wait for the deployment to complete, then select Go to resource.

> Note: Monitor the Notification messages.

## Task 2: Manage compute and storage scaling for virtual machines

In this task, you will scale a virtual machine by adjusting its size to a different SKU. Azure provides flexibility in VM size selection so that you can adjust a VM for periods of time if it needs more (or less) compute and memory allocated. This concept is extended to disks, where you can modify the performance of the disk, or increase the allocated capacity.

1. On the az104-vm1 virtual machine, in the Availability + scale blade, select Size.

2. Set the virtual machine size to DS1_v2 and click Resize. When prompted, confirm the change.
> Note: Choose another size if Standard DS1_v2 is not available. Resizing is also known as vertical scaling, up or down.

3. In the Settings area, select Disks.

4. Under Data disks select + Create and attach a new disk. Configure the settings (leave other settings at their default values).

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_2_4.png)

5. Click Apply.

6. After the disk has been created, click Detach (if necessary, scroll to the right to view the detach icon), and then click Apply.
> Note: Detaching removes the disk from the VM but keeps it in storage for later use.

7. Search for and select Disks. From the list of disks, select the vm1-disk1 object.
> Note: The Overview blade also provides performance and usage information for the disk.

8. In the Settings blade, select Size + performance.

9. Set the storage type to Standard SSD, and then click Save.

10. Navigate back to the az104-vm1 virtual machine and select Disks.

11. In the Data disk section, select Attach existing disks.

12. In the Disk name drop-down, select VM1-DISK1.

13. Verify the disk is now Standard SSD.

14. Select Apply to save your changes.
> Note: You have now created a virtual machine, scaled the SKU and the data disk size. In the next task we use Virtual Machine Scale Sets to automate the scaling process.

### Azure Virtual Machine Scale Sets Architecture Diagram

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab08-vmss-architecture.png)

## Task 3: Create and configure Azure Virtual Machine Scale Sets

In this task, you will deploy an Azure virtual machine scale set across availability zones. VM Scale Sets reduce the administrative overhead of automation by enabling you to configure metrics or conditions that allow the scale set to horizontally scale, scale in or scale out.

1. In the Azure portal, search for and select Virtual machine scale sets and, on the Virtual machine scale sets blade, click + Create.

2. On the Basics tab of the Create a virtual machine scale set blade, specify the following settings (leave others with their default values) and click Next : Spot >:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_3_2(1).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_3_2(2).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_3_2(3).png)


3. On the Spot tab, accept the defaults and select Next : Disks >.

4. On the Disks tab, accept the default values and click Next : Networking >.

5. On the Networking page, click the Create virtual network link below the Virtual network textbox and create a new virtual network with the following settings (leave others with their default values). When finished, select OK.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_3_5.png)

6. In the Networking tab, click the Edit network interface icon to the right of the network interface entry.

7. For NIC network security group section, select Advanced and then click Create new under the Configure network security group drop-down list.

8. On the Create network security group blade, specify the following settings (leave others with their default values):

9. Click Add an inbound rule and add an inbound security rule with the following settings (leave others with their default values):

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_3_9.png)

10. Click Add and, back on the Create network security group blade, click OK.

11. In the Edit network interface blade, in the Public IP address section, click Enabled and click OK.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_3_11.png)

12. In the Networking tab, under the Load balancing section, specify the following (leave others with their default values).

13. On the Create a load balancer page, specify the load balancer name and take the defaults. Click Create when you are done then Next : Management >.

> Note: Pause for a minute and review what you done. At this point, you have configured the virtual machine scale set with disks and networking. In the network configuration you have created a network security group and allowed HTTP. You have also created a load balancer with a public IP address.

14. On the Management tab, specify the following settings (leave others with their default values):

15. Click Next : Health >.

16. On the Health tab, review the default settings without making any changes and click Next : Advanced >.

17. On the Advanced tab, click Review + create.

18. On the Review + create tab, ensure that the validation passed and click Create.

## Task 4: Scale Azure Virtual Machine Scale Sets

In this task, you scale the virtual machine scale set using a custom scale rule.

1. Select Go to resource or search for and select the vmss1 scale set.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_4_1.png)

2. Choose Availability + Scale from the left side menu, then choose Scaling.

> You can Manual scale or Custom autoscale. In scale sets with a small number of VM instances, increasing or decreasing the instance count (Manual scale) may be best. In scale sets with a large number of VM instances, scaling based on metrics (Custom autoscale) may be more appropriate.

### Scale out rule



3. Select Custom autoscale. Then change the Scale mode to Scale based on metric. And then select Add a rule.

4. Let's create a rule that automatically increases the number of VM instances. This rule scales out when the average CPU load is greater than 70% over a 10-minute period. When the rule triggers, the number of VM instances is increased by 20%.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_4_4(1).png)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_4_4(2).png)

5. Be sure to Save your changes.

### Scale in rule

6. During evenings or weekends, demand may decrease so it is important to create a scale in rule.

7. Let's create a rule that decreases the number of VM instances in a scale set. The number of instances should decrease when the average CPU load drops below 30% over a 10-minute period. When the rule triggers, the number of VM instances is decreased by 20%.

8. Select Add a rule, adjust the settings, then select Add.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_4_8.png)

9. Be sure to Save your changes.

### Set the instance limits

10. When your autoscale rules are applied, instance limits make sure that you do not scale out beyond the maximum number of instances or scale in beyond the minimum number of instances.

11. Instance limits are shown on the Scaling page after the rules.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab8_4_11.png)

12. Be sure to Save your changes

13. On the vmss1 page, select Instances. This is where you would monitor the number of virtual machine instances.

## Task 5: Create a virtual machine using Azure PowerShell


1. Use the icon (top right) to launch a Cloud Shell session. Alternately, navigate directly to https://shell.azure.com.

2. Be sure to select PowerShell. If necessary, configure the shell storage.

3. Run the following command to create a virtual machine. When prompted, provide a username and password for the VM. While you wait check out the New-AzVM command reference for all the parameters associated with creating a virtual machine.

``` power shell
New-AzVm `
-ResourceGroupName 'az104-rg8' `
-Name 'myPSVM' `
-Location 'East US' `
-Image 'Win2019Datacenter' `
-Zone '1' `
-Size 'Standard_D2s_v3' `
-Credential (Get-Credential)
```

4. Once the command completes, use Get-AzVM to list the virtual machines in your resource group.

``` power shell
Get-AzVM `
-ResourceGroupName 'az104-rg8' `
-Status
```

5. Verify your new virtual machine is listed and the Status is Running.

6. Use Stop-AzVM to deallocate your virtual machine. Type Yes to confirm.

``` power shell 
Stop-AzVM `
-ResourceGroupName 'az104-rg8' `
-Name 'myPSVM' 
```
7. Use Get-AzVM with the -Status parameter to verify the machine is deallocated.

> When you use Azure to stop your virtual machine, the status is deallocated. This means that any non-static public IPs are released, and you stop paying for the VM’s compute costs.