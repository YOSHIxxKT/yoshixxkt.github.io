---
title: Manage Azure Storage
date: 2025-01-31-10:20
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Azure_storage_image.jpg
---

## Manage Azure Storage

### Lab scenario
Your organization is currently storing data in on-premises data stores. Most of these files are not accessed frequently. You would like to minimize the cost of storage by placing infrequently accessed files in lower-priced storage tiers. You also plan to explore different protection mechanisms that Azure Storage offers, including network access, authentication, authorization, and replication. Finally, you want to determine to what extent Azure Files is suitable for hosting your on-premises file shares.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab07-architecture.png)

### Task 1: Create and configure a storage account.

In this task, you will create and configure a storage account. The storage account will use geo-redundant storage and will not have public access.



1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select Storage accounts, and then click + Create.

3. On the Basics tab of the Create a storage account blade, specify the following settings (leave others with their default values):

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-1-3.png)

>  You should use the Standard performance tier for most applications. Use the Premium performance tier for enterprise or high-performance applications.



4. On the Advanced tab, use the informational icons to learn more about the choices. Take the defaults.

5. On the Networking tab, review the available options, select Disable public access and use private access.

6. Review the Data protection tab. Notice 7 days is the default soft delete retention policy. Note you can enable blob versioning. Accept the defaults.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-1-6.png)

7. Review the Encryption tab. Notice the additional security options. Accept the defaults.

8. Select Review, wait for the validation process to complete, and then click Create.

9. Once the storage account is deployed, select Go to resource.

10. Review the Overview blade and the additional configurations that can be changed. These are global settings for the storage account. Notice the storage account can be used for Blob containers, File shares, Queues, and Tables.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-1-10.png)

11. In the Security + networking section, select Networking. Notice public network access is disabled.
* Change the public access level to Enabled from selected virtual networks and IP addresses.
* In the Firewall section, check the box for Add your client IP address.
* Be sure to Save your changes.

12. In the Data management section, view the Redundancy blade. Notice the information about your primary and secondary data center locations.

13. In the Data management section, select Lifecycle management, and then select Add a rule.

* Name the rule Movetocool. Notice your options for limiting the scope of the rule.

* On the Base blobs tab, if based blobs were last modified more than 30 days ago then move to cool storage. Notice your other choices.
* Notice you can configure other conditions. Select Add when you are done exploring.

### Task 2: Create and configure secure blob storage

In this task, you will create a blob container and upload an image. Blob containers are directory-like structures that store unstructured data.

### Create a blob container and a time-based retention policy

1. Continue in the Azure portal, working with your storage account.

2. In the Data storage section, click Containers.

3. Click + Container and Create a container with the following settings:

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-2-3.png)

4. On your container, scroll to the ellipsis (...) on the far right, select Access Policy.

5. In the Immutable blob storage area, select Add policy.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-2-5.png)

6. Select Save.

### Manage blob uploads

7. Return to the containers page, select your data container and then click Upload.

8. On the Upload blob blade, expand the Advanced section.

> Note: Locate a file to upload. This can be any type of file, but a small file is best. A sample file can be downloaded from the AllFiles directory.



9. Click Upload.

10. Confirm you have a new folder, and your file was uploaded.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-2-10.png)

11. Select your upload file and review the options including Download, Delete, Change tier, and Acquire lease.

12. Copy the file URL and paste into a new Inprivate browsing window.

13. You should be presented with an XML-formatted message stating ResourceNotFound or PublicAccessNotPermitted.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-2-13.png)

> Note: This is expected, since the container you created has the public access level set to Private (no anonymous access).

### Configure limited access to the blob storage

14. Select your uploaded file and then on the Generate SAS tab. You can also use the ellipsis (...) to the far right. Specify the following settings (leave others with their default values):

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-2-14.png)

15. Click Generate SAS token and URL.

16. Copy the Blob SAS URL entry to the clipboard.

17. Open another InPrivate browser window and navigate to the Blob SAS URL you copied in the previous step.

> Note: You should be able to view the content of the file.

### Task 3: Create and configure an Azure File storage

In this task, you will create and configure Azure File shares. You will use Storage Browser to manage the file share.

### Create the file share and upload a file



1. In the Azure portal, navigate back to your storage account, in the Data storage section, click File shares.

2. Click + File share and on the Basics tab give the file share a name, share1.

3. Notice the Access tier options. Keep the default Transaction optimized.

4. Move to the Backup tab and ensure Enable backup is not checked. We are disabling backup to simplify the lab configuration.

5. Click Review + create, and then Create. Wait for the file share to deploy.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-3-5.png)

### Explore Storage Browser and upload a file


6. Return to your storage account and select Storage browser. The Azure Storage Browser is a portal tool that lets you quickly view all the storage services under your account.

7. Select File shares and verify your share1 directory is present.

8. Select your share1 directory and notice you can + Add directory. This lets you create a folder structure.

9. Select Upload. Browse to a file of your choice, and then click Upload.

> Note: You can view file shares and manage those shares in the Storage Browser. There are currently no restrictions.

### Restrict network access to the storage account


10. In the portal, search for and select Virtual networks.



11. Select + Create. Select your resource group. and give the virtual network a name, vnet1.

12. Take the defaults for other parameters, select Review + create, and then Create.

13. Wait for the virtual network to deploy, and then select Go to resource.

14. In the Settings section, select the Service endpoints blade.

* Select Add.
* In the Services drop-down select Microsoft.Storage.
* In the Subnets drop-down check the Default subnet.
* Click Add to save your changes.

15. Return to your storage account.

16. In the Security + networking section, select the Networking blade.

17. Select add existing virtual network and select vnet1 and default subnet, select Add.

18. In the Firewall section, Delete your machine IP address. Allowed traffic should only come from the virtual network.

19. Be sure to Save your changes.

> Note: The storage account should now only be accessed from the virtual network you just created.

20. Select the Storage browser and Refresh the page. Navigate to your file share or blob content.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab7-3-10.png)

> Note: You should receive a message not authorized to perform this operation. You are not connecting from the virtual network. It may take a couple of minutes for this to take effect.

