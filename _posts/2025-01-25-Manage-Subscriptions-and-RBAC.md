---
title: Manage Subscriptions and RBAC
date: 2025-01-25-9:15
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/RBAC.png
---

## Manage Subscriptions and RBAC

### Scenario

To simplify management of Azure resources in your organization, you have been tasked with implementing the following functionality:

    Creating a management group that includes all your Azure subscriptions.

    Granting permissions to submit support requests for all subscriptions in the management group. The permissions should be limited only to:
        Create and manage virtual machines
        Create support request tickets (do not include adding Azure providers)

       
 ![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab02a-architecture.png)

### Task 1: Implement Management Groups

In this task, you will create and configure management groups. Management groups are used to logically organize and segment subscriptions. They allow for RBAC and Azure Policy to be assigned and inherited to other management groups and subscriptions. For example, if your organization has a dedicated support team for Europe, you can organize European subscriptions into a management group to provide the support staff access to those subscriptions (without providing individual access to all subscriptions). In our scenario everyone at the Help Desk will need to create a support request across all subscriptions.



1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select Microsoft Entra ID.

3. In the Manage blade, select Properties.

4. Review the Access management for Azure resources area. Ensure you can manage access to all Azure subscriptions and management groups in the tenant.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task1-4.png)

5. Search for and select Management groups.

6. On the Management groups blade, click + Create.

7. Create a management group with the following settings. Select Submit when you are done.

| Setting          | Value|
|----------|----------|
| Management Group ID     | az104-mg1   |
| Management group display name     | az104-mg1    |

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task1-7.png)


8. Refresh the management group page to ensure your new management group displays. This may take a minute.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task1-8.png)

> Note: Did you notice the root management group? The root management group is built into the hierarchy to have all management groups and subscriptions fold up to it. This root management group allows for global policies and Azure role assignments to be applied at the directory level. After creating a management group, you would add any subscriptions that should be included in the group.

### Task 2: Review and assign a built-in Azure role

In this task, you will review the built-in roles and assign the VM Contributor role to a member of the Help Desk. Azure provides a large number of built-in roles.



1. Select the az104-mg1 management group.

2. Select the Access control (IAM) blade, and then the Roles tab.

3. Scroll through the built-in role definitions that are available. View a role to get detailed information about the Permissions, JSON, and Assignments. You will often use owner, contributor, and reader.

4. Select + Add, from the drop-down menu, select Add role assignment.

5. On the Add role assignment blade, search for and select the Virtual Machine Contributor. The Virtual machine contributor role lets you manage virtual machines, but not access their operating system or manage the virtual network and storage account they are connected to. This is a good role for the Help Desk. Select Next.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task2-5.png)

> Azure originally provided only the Classic deployment model. This has been replaced by the Azure Resource Manager deployment model. As a best practice, do not use classic resources.

6. On the Members tab, Select Members.

> Note: The next step assigns the role to the helpdesk group. If you do not have a Help Desk group, take a minute to create it.

7. Search for and select the helpdesk group. Click Select.

8. Click Review + assign twice to create the role assignment.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task2-8.png)

9. Continue on the Access control (IAM) blade. On the Role assignments tab, confirm the helpdesk group has the Virtual Machine Contributor role.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task2-9.png)

> Note: As a best practice always assign roles to groups not individuals. 

> This assignment might not actually grant you any additional privileges. If you already have the Owner role, that role includes all permissions associated with the VM Contributor role.

### Task 3: Create a custom RBAC role

In this task, you will create a custom RBAC role. Custom roles are a core part of implementing the principle of least privilege for an environment. Built-in roles might have too many permissions for your scenario. We will also create a new role and remove permissions that are not necessary. Do you have a plan for managing overlapping permissions?



1. Continue working on your management group. Navigate to the Access control (IAM) blade.

2. Select + Add, from the drop-down menu, select Add custom role.

3. On the Basics tab complete the configuration.

| Setting | Value |
|---------|-------|
| Custom role name | Custom Support Request |
| Description | A custom contributor role for support requests.| 


4. For Baseline permissions, select Clone a role. In the Role to clone drop-down menu, select Support Request Contributor.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task3-4.png)

5. Select Next to move to the Permissions tab, and then select + Exclude permissions.

6. In the resource provider search field, enter .Support and select Microsoft.Support.

7. In the list of permissions, place a checkbox next to Other: Registers Support Resource Provider and then select Add. The role should be updated to include this permission as a NotAction.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task3-7.png) 

> Note: An Azure resource provider is a set of REST operations that enable functionality for a specific Azure service. We do not want the Help Desk to be able to have this capability, so it is being removed from the cloned role.

8. On the Assignable scopes tab, ensure your management group is listed, then click Next.

9. Review the JSON for the Actions, NotActions, and AssignableScopes that are customized in the role.

10. Select Review + Create, and then select Create.

> Note: At this point, you have created a custom role and assigned it to the management group.

### Task4: Monitor role assignments with the Activity Log

In this task, you view the activity log to determine if anyone has created a new role.

1. In the portal locate the az104-mg1 resource and select Activity log. The activity log provides insight into subscription-level events.

2. Review the activites for role assignments. The activity log can be filtered for specific operations.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/task4.png)


