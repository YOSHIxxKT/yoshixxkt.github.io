---
title: Implement Traffic Management
date: 2025-02-05-14:08
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Azure-Load-Balancer-1.jpg
---


## Implement Traffic Management

### Scenario

Your organization has a public website. You need to load balance incoming public requests across different virtual machines. You also need to provide images and videos from different virtual machines. You plan on implementing an Azure Load Balancer and an Azure Application Gateway. All resources are in the same region.

### Task 1: Use a template to provision an infrastructure

In this task, you will use a template to deploy one virtual network, one network security group, and two virtual machines.

1. Download the \Allfiles\Lab06 lab files (template and parameters).

2. Sign in to the Azure portal - https://portal.azure.com.

3. Search for and select Deploy a custom template.

4. On the custom deployment page, select Build your own template in the editor.

5. On the edit template page, select Load file.

6. Locate and select the \Allfiles\Lab06\az104-06-vms-template.json file and select Open.

7. Select Save.

8. Select Edit parameters and load the \Allfiles\Lab06\az104-06-vms-parameters.json file.

9. Select Save.

10. Use the following information to complete the fields on the custom deployment page, leaving all other fields with the default value.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-1-10(1).png)

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-1-10(2).png)

> Note: If you receive an error that the VM size is unavailable, select a SKU that is available in your subscription and has at least 2 cores.

11. Select Review + Create and then select Create.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-1-11.png)

> Note: Review the resources being deployed. There will be one virtual network with three subnets. Each subnet will have a virtual machine.

### Task 2: Configure an Azure Load Balancer

In this task, you implement an Azure Load Balancer in front of the two Azure virtual machines in the virtual network. Load Balancers in Azure provide layer 4 connectivity across resources, such as virtual machines. Load Balancer configuration includes a front-end IP address to accept connections, a backend pool, and rules that define how connections should traverse the load balancer.

> Note: Notice the Load Balancer is distributing across two virtual machines in the same virtual network.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab06-lb-architecture(1).png)

1. In the Azure portal, search for and select Load balancers and, on the Load balancers blade, click + Create.

2. Create a load balancer with the following settings (leave others with their default values) then click Next: Frontend IP configuration:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-2.png)

3. On the Frontend IP configuration tab, click Add a frontend IP configuration and use the following settings:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-3.png)

4. On the Add a public IP address popup, use the following settings before clicking OK and then Add. When completed click Next: Backend pools.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-4.png)

> Note: The Standard SKU provides a static IP address. Static IP addresses are assigned with the resource is created and released when the resource is deleted.

5. On the Backend pools tab, click Add a backend pool with the following settings (leave others with their default values). Click + Add (twice) and then click Next: Inbound rules.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-5.png)

6. As you have time, review the other tabs, then click Review + create. Ensure there are no validation errors, then click Create.

7. Wait for the load balancer to deploy then click Go to resource.


### Add a rule to determine how incoming traffic is distributed

8. In the Settings blade, select Load balancing rules.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-8(1).png)

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-8(2).png)

9. Select + Add. Add a load balancing rule with the following settings (leave others with their default values). As you configure the rule use the informational icons to learn about each setting. When finished click Save.

10. Select Frontend IP configuration from the Load Balancer page. Copy the public IP address.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-10.png)

11. Open another browser tab and navigate to the IP address. Verify that the browser window displays the message Hello World from az104-06-vm0 or Hello World from az104-06-vm1.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-2-11.png)

12. Refresh the window to verify the message changes to the other virtual machine. This demonstrates the load balancer rotating through the virtual machines.


### Task 3: Configure an Azure Application Gateway

> Note: This Application Gateway is working in the same virtual network as the Load Balancer. This may not be typical in a production environment.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab06-gw-architecture(2).png)

1. In the Azure portal, search and select Virtual networks.

2. On the Virtual networks blade, in the list of virtual networks, click az104-06-vnet1.

3. On the az104-06-vnet1 virtual network blade, in the Settings section, click Subnets, and then click + Subnet.

4. Add a subnet with the following settings (leave others with their default values).

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-4.png)

5. Click Save

> Note: This subnet will be used by the Azure Application Gateway. The Application Gateway requires a dedicated subnet of /27 or larger size.

6. In the Azure portal, search and select Application gateways and, on the Application Gateways blade, click + Create.

7. On the Basics tab, specify the following settings (leave others with their default values):

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-7.png)

8. Click Next: Frontends > and specify the following settings (leave others with their default values). When complete, click OK.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-8.png)

> Note: The Application Gateway can have both a public and private IP address.

9. Click Next : Backends > and then Add a backend pool. Specify the following settings (leave others with their default values). When completed click Add.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-9.png)

10. Click Add a backend pool. This is the backend pool for images. Specify the following settings (leave others with their default values). When completed click Add.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-10.png)

11. Click Add a backend pool. This is the backend pool for video. Specify the following settings (leave others with their default values). When completed click Add.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-11.png)

12. Select Next : Configuration > and then Add a routing rule. Complete the information.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-12.png)

13. Move to the Backend targets tab. Select Add after completing the basic information.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-13.png)

14. In the Path-based routing section, select Add multiple targets to create a path-based rule. You will create two rules. Click Add after the first rule and then Add after the second rule.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-14(1).png)

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-14(2).png)

15. Be sure to Save and check your changes, then select Next : Tags >. No changes are needed.

16. Select Next : Review + create > and then click Create.

17. After the application gateway deploys, search for and select az104-appgw.

18. In the Application Gateway resource, in the Monitoring section, select Backend health.

19. Ensure both servers in the backend pool display Healthy.

20. On the Overview blade, copy the value of the Frontend public IP address.

21. Start another browser window and test this URL - http://<frontend ip address>/image/.

22. Verify you are directed to the image server (vm1).

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-22.png)

23. Start another browser window and test this URL - http://<frontend ip address>/video/.

24. Verify you are directed to the video server (vm2).

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab6-3-24.png)

