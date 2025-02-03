---
title: Implement Virtual Networking
date: 2025-02-03-15:53
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/azure_virtual_networking.png
---

## Implement Virtual Networking

### scenario

Your global organization plans to implement virtual networks. The immediate goal is to accommodate all the existing resources. However, the organization is in a growth phase and wants to ensure there is additional capacity for the growth.

The CoreServicesVnet virtual network has the largest number of resources. A large amount of growth is anticipated, so a large address space is necessary for this virtual network.

The ManufacturingVnet virtual network contains systems for the operations of the manufacturing facilities. The organization is anticipating a large number of internal connected devices for their systems to retrieve data from.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab04-architecture.png)


### Task 1: Create a virtual network with subnets using the portal

The organization plans a large amount of growth for core services. In this task, you create the virtual network and the associated subnets to accommodate the existing resources and planned growth. In this task, you will use the Azure portal.

1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select Virtual Networks.

3. Select Create on the Virtual networks page.

4. Complete the Basics tab for the CoreServicesVnet.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-1-4.png)

5. Move to the IP Addresses tab.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-1-5.png)

6. Select + Add a subnet. Complete the name and address information for each subnet. Be sure to select Add for each new subnet. Be sure to delete the default subnet - either before or after creating the other subnets.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-1-6(1).png)

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-1-6(2).png)

> Note: Every virtual network must have at least one subnet. Reminder that five IP addresses will always be reserved, so consider that in your planning.

7. To finish creating the CoreServicesVnet and its associated subnets, select Review + create.

8. Verify your configuration passed validation, and then select Create.

9. Wait for the virtual network to deploy and then select Go to resource.

10. Take a minute to verify the Address space and the Subnets. Notice your other choices in the Settings blade.

11. In the Automation section, select Export template, and then wait for the template to be generated.

12. Download the template.

13. Navigate on the local machine to the Downloads folder and Extract all the files in the downloaded zip file.

14. Before proceeding, ensure you have the template.json file. You will use this template to create the ManufacturingVnet in the next task.


### Task 2: Create a virtual network and subnets using a template

In this task, you create the ManufacturingVnet virtual network and associated subnets. The organization anticipates growth for the manufacturing offices so the subnets are sized for the expected growth. For this task, you use a template to create the resources.



1. Locate the template.json file exported in the previous task. It should be in your Downloads folder.

2. Edit the file using the editor of your choice. Many editors have a change all occurrences feature. If you are using Visual Studio Code be sure you are working in a trusted window and not in the restricted mode. Consult the architecture diagram to verify the details.


### Make changes for the ManufacturingVnet virtual network



3. Replace all occurrences of CoreServicesVnet with ManufacturingVnet.

4. Replace all occurrences of 10.20.0.0 with 10.30.0.0.


### Make changes for the ManufacturingVnet subnets



5. Change all occurrences of SharedServicesSubnet to SensorSubnet1.

6. Change all occurrences of 10.20.10.0/24 to 10.30.20.0/24.

7. Change all occurrences of DatabaseSubnet to SensorSubnet2.

8. Change all occurrences of 10.20.20.0/24 to 10.30.21.0/24.

9. Read back through the file and ensure everything looks correct.

10. Be sure to Save your changes.

### Make changes to the parameters file



11. Locate the parameters.json file exported in the previous task. It should be in your Downloads folder.

12. Edit the file using the editor of your choice.

13. Replace the one occurrence of CoreServicesVnet with ManufacturingVnet.

14. Save your changes.


### Deploy the custom template



15. In the portal, search for and select Deploy a custom template.

16. Select Build your own template in the editor and then Load file.

17. Select the templates.json file with your Manufacturing changes, then select Save.

18. Select Review + create and then Create.

19. Wait for the template to deploy, then confirm (in the portal) the Manufacturing virtual network and subnets were created.

### Task 3: Create and configure communication between an Application Security Group and a Network Security Group

In this task, we create an Application Security Group and a Network Security Group. The NSG will have an inbound security rule that allows traffic from the ASG. The NSG will also have an outbound rule that denies access to the internet.

### Create the Application Security Group (ASG)

1. In the Azure portal, search for and select Application security groups.

2. Click Create and provide the basic information.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-3-2.png)

3. Click Review + create and then after the validation click Create.

> Note: At this point, you would associate the ASG with virtual machine(s). These machines will be affected by the inbound NSG rule you create in the next task.

### Create the Network Security Group and associate it with CoreServicesVnet

4. In the Azure portal, search for and select Network security groups.

5. Select + Create and provide information on the Basics tab.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-3-5.png)

6. Click Review + create and then after the validation click Create.

7. After the NSG is deployed, click Go to resource.

8. Under Settings click Subnets and then Associate.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-3-8.png)

9. Click OK to save the association.

### Configure an inbound security rule to allow ASG traffic

10. Continue working with your NSG. In the Settings area, select Inbound security rules.

11. Review the default inbound rules. Notice that only other virtual networks and load balancers are allowed access.

12. Select + Add.

13. On the Add inbound security rule blade, use the following information to add an inbound port rule. This rule allows ASG traffic. When you are finished, select Add.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-3-13.png)

### Configure an outbound NSG rule that denies Internet access

14. After creating your inbound NSG rule, select Outbound security rules.

15. Notice the AllowInternetOutboundRule rule. Also notice the rule cannot be deleted and the priority is 65001.

16. Select + Add and then configure an outbound rule that denies access to the internet. When you are finished, select Add.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-3-16.png)

### Task 4: Configure public and private Azure DNS zones

In this task, you will create and configure public and private DNS zones.

### Configure a public DNS zone

You can configure Azure DNS to resolve host names in your public domain. For example, if you purchased the contoso.xyz domain name from a domain name registrar, you can configure Azure DNS to host the contoso.com domain and resolve www.contoso.xyz to the IP address of your web server or web app.

1. In the portal, search for and select DNS zones.

2. Select + Create.

3. Configure the Basics tab.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-4-3.png)

4. Select Review create and then Create.

5. Wait for the DNS zone to deploy and then select Go to resource.

6. On the Overview blade notice the names of the four Azure DNS name servers assigned to the zone. Copy one of the name server addresses. You will need it in a future step.

7. Select + Record set. You add a virtual network link record for each virtual network that needs private name-resolution support.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-4-7.png)

> Note: In a real-world scenario, you'd enter the public IP address of your web server.

8. Select OK and verify contoso.com has an A record set named www.

9. Open a command prompt, and run the following command:

``` Bash 
nslookup www.contoso.com <name server name>
```
10. Verify the host name www.contoso.com resolves to the IP address you provided. This confirms name resolution is working correctly.

### Configure a private DNS zone

A private DNS zone provides name resolution services within virtual networks. A private DNS zone is only accessible from the virtual networks that it is linked to and can't be accessed from the internet.

11. In the portal, search for and select Private dns zones.

12. Select + Create.

13. On the Basics tab of Create private DNS zone, enter the information as listed in the table below:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-4-13.png)

14. Select Review create and then Create.

15. Wait for the DNS zone to deploy and then select Go to resource.

16. Notice on the Overview blade there are no name server records.

17. Select DNS Management and then select Virtual network links. Configure the link.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-4-17.png)


18. Select Create and wait for the link to create.

19. From the DNS Management blade select + Recordsets. You would now add a record for each virtual machine that needs private name-resolution support.
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab4-4-19.png)
> Note: In a real-world scenario, you'd enter the IP address for a specific manufacturing virtual machine.