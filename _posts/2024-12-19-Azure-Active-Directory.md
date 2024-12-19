---
title: Azure Active Directory
date: 2024-12-19-4:17
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/featuredimage-azuread.png
---

## Create a Conditional Access Policy

### Azure Active Directory conditional access is an advanced feature of Azure AD that allows you to specify detailed policies that control who can access your resources. Using Conditional Access, you can protect your applications by limiting users' access based on things like groups, device type, location, and role.

* Open the portal menu and then select Azure Active Directory.
* On the Azure Active Directory page, under Manage, select Security.
* On the Security page, in the left navigation, select Conditional access.
* On the Overview (Preview), click +Create new policy.
* In the Name box, enter Block Yammer for DebraB


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-1.jpg) 

* Under Assignments, select Users or workload identities.
* On the Include tab, select the Users and groups check box.
* In the Select pane, select DebraB account and then click Select.


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-2.jpg)

* Select Cloud apps or actions.
* Verify Cloud apps is selected and then select Select apps.
* In the Select pane, search for Yammer and select Office 365 Yammer and then select Select


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-3.jpg)

* Under Access controls, select Grant.
* In the Grant pane, select Block access and then click Select.

> Note - This policy is being configure for the exercise only and is being used to quickly demonstrate a conditional access policy.


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-4.jpg)

* Under Enable policy, select On, and then select Create.


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-5.jpg)

### Test the Conditional Access Policy

* Verify you are prevented from successfully access Microsoft Yammer.


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-6.jpg)

* Close the tab and return to the Conditional Access page.

* Select the Yammer conditional access policy.


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-7.jpg)

* Under Enable policy, select Off and then select Save.


![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/conditional-8.jpg)












