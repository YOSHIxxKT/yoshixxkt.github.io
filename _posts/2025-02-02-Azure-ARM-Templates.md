---
title: Azure Arm Templates
date: 2025-02-02-9:48
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/arm-banner-1024X700.jpg
---

## Manage Azure resources by using Azure Resource Manager Templates

Your team wants to look at ways to automate and simplify resource deployments. Your organization is looking for ways to reduce administrative overhead, reduce human error and increase consistency.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab03-architecture.png)

### Task 1: Create an Azure Resource Manager template

In this task, we will create a managed disk in the Azure portal. Managed disks are storage designed to be used with virtual machines. Once the disk is deployed you will export a template that you can use in other deployments.


1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select Disks.

3. On the Disks page, select Create.

4. On the Create a managed disk page, configure the disk and then select Ok.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-1-4.png)

> Note: We are creating a simple managed disk so you can practice with templates. Azure managed disks are block-level storage volumes that are managed by Azure.

5. Click Review + Create then select Create.

6. Monitor the notifications (upper right) and after the deployment select Go to resource.

7. In the Automation blade, select Export template.

8. Take a minute to review the Template and Parameters files.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-1-8.png)

9. Click Download and save the templates to the local drive. This creates a compressed zipped file.

10. Use File Explorer to extract the content of the downloaded file into the Downloads folder on your computer. Notice there are two JSON files (template and parameters).

>  You can export an entire resource group or just specific resources within that resource group.


### Task 2: Edit an Azure Resource Manager template and then redeploy the template

In this task, you use the downloaded template to deploy a new managed disk. This task outlines how to quicky and easily repeat deployments.


1. In the Azure portal, search for and select Deploy a custom template.

2. On the Custom deployment blade, notice there is the ability to use a Quickstart template. There are many built-in templates as shown in the drop-down menu.

3. Instead of using a Quickstart, select Build your own template in the editor.

4. On the Edit template blade, click Load file and upload the template.json file you downloaded to the local disk.

5. Within the editor pane, make these changes.

* Change disks_az104_disk1_name to disk_name (two places to change)
* Change az104-disk1 to az104-disk2 (one place to change)

6. Notice this is a Standard disk. The location is eastus. The disk size is 32GB.

7. Save your changes.

8. Don't forget the parameters file. Select Edit parameters, click Load file and upload the parameters.json.

9. Make this change so it matches the template file.

   Change disks_az104_disk1_name to disk_name (one place to change)

10. Save your changes.

11. Complete the custom deployment settings:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-2-11.png)

12. Select Review + Create and then select Create.

13. Select Go to resource. Verify az104-disk2 was created.

14. On the Overview blade, select the resource group, az104-rg3. You should now have two disks.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-2-14.png)

15. In the Settings section, click Deployments.

> Note: All deployments details are documented in the resource group. It is a good practice to review the first few template-based deployments to ensure success prior to using the templates for large-scale operations.

16. Select a deployment and review the content of the Input and Template blades.


### Task 3: Configure the Cloud Shell and deploy a template with PowerShell

In this task, you work with the Azure Cloud Shell and Azure PowerShell. Azure Cloud Shell is an interactive, authenticated, browser-accessible terminal for managing Azure resources. It provides the flexibility of choosing the shell experience that best suits the way you work, either Bash or PowerShell. In this task, you use PowerShell to deploy a template.

1. Select the Cloud Shell icon in the top right of the Azure Portal. Alternately, you can navigate directly to https://shell.azure.com.

2. When prompted to select either Bash or PowerShell, select PowerShell.

> If you mostly work with Linux systems, Bash (CLI) feels more familiar. If you mostly work with Windows systems, Azure PowerShell feels more familiar.

3. On the Getting started screen select Mount storage account, select your Storage account subscription, and then select Apply.

4. Select I want to create a storage account and then Next. Complete the Create storage account information.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-3-4.png)

5. When completed select Create.

6. Select Settings (top bar) and then Go to classic version.

7. Select the Upload/Download files icon (top bar) and then select Upload.

8. Upload both the template and parameters files from the Downloads directory.

9. Select the Editor (curly brackets) icon and navigate to the template JSON file on the left in the navigation pane.

10. Make a change. For example, change the disk name to az104-disk3. Use Ctrl +S to save your changes.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-3-10.png)

> Note: You can target your template deployment to a resource group, subscription, management group, or tenant. Depending on the scope of the deployment, you use different commands.

11. To deploy to a resource group, use New-AzResourceGroupDeployment.

``` Power Shell
New-AzResourceGroupDeployment -ResourceGroupName az104-rg3 -TemplateFile template.json -TemplateParameterFile parameters.json
```

12. Ensure the command completes and the ProvisioningState is Succeeded.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-3-12.png)

13. Confirm the disk was created.

``` Power Shell
Get-AzDisk
```

### Task 4: Deploy a template with the CLI

1. Continue in the Cloud Shell select Bash. Confirm your choice.

2. Verify your files are available in the Cloud Shell storage. If you completed the previous task your template files should be available.

``` Bash
ls
```

3. Select the Editor (curly brackets) icon and navigate to the template JSON file.

4. Make a change. For example, change the disk name to az104-disk4. Use Ctrl +S to save your changes.

> Note: You can target your template deployment to a resource group, subscription, management group, or tenant. Depending on the scope of the deployment, you use different commands.

5. To deploy to a resource group, use az deployment group create.

``` Bash 
az deployment group create --resource-group az104-rg3 --template-file template.json --parameters parameters.json
```
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-4-5.png)

6. Ensure the command completes and the ProvisioningState is Succeeded.

7. Confirm the disk was created.

``` Bash
az disk list --output table
```

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab3-4-7.png)