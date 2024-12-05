---
title: Azure Multi-Factor Authentication
date: 2024-12-05 04:52
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Azurelogo.png
---

# Enable Multi-Factor Authentication in Azure

> This document and the configurations contained herein are works of fiction created for illustrative and educational purposes only. Any similarities to real persons, institutions, organizations, systems, or scenarios are purely coincidental.

##  Review Azure Multi-Factor Authentication in Azure

* Select Multi-Factor Authentication.
* On the Getting started page, under Configure, select Additional cloud-based MFA settings.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-1.jpg)

### Setup conditional access rules for MFA for Delia Dennis

Set up Conditional Access policy rules that would enforce MFA for guest users accessing specific apps on your network.

*	Switch back to the Azure portal and select Azure Active Directory, then Security, and then Conditional access.
* On the menu, Select + New policy. From the drop down select Create new policy.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-2.jpg)

* Name your policy, for example MFA_for_Delia

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-3.jpg)

Select Users or workload identities under Assignments
   * Select 0 users or workload identities selected
   * On the right side screen, select Select users and groups check box to configure.
   * Check Users and groups (available users will be populated to the right)
   * Choose Delia Dennis from the list of users then choose Select button

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-4.jpg)

Select Cloud apps or actions.
  * In the dropdown, make sure Cloud apps is selected.
  * Under Include, mark All cloud apps and note the warning the pops up about possibly locking yourself out.
  * Now under Include, change your choice to Select apps item.
  * In the newly opened dialog, choose Office 365.
    * Reminder - in a previous lab we gave Delia Dennis an Office 365 license and logged into ensure it worked.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-5.jpg)

Review the Conditions section.
* Select Locations and then configure it for Any location

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-6.jpg)

Under Access Controls select Grant and verify Grant access is selected.

Select the Require multi-factor authentication check box to enforces MFA

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-7.jpg)

Ensure that Require all the slected controls is selected.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-8.jpg)

Set Enable policy to On

Create to create the policy.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-9.jpg)

### Test Delia's Login

* Open a new InPrivate Browsing windows.
* Connect to https://www.office.com.
* Select the sign-in option
* Enter DeliaD@ <<your domain address>>.
* Enter the password = Enter the Global admin password of the tenant 

Note- At this point one of two things will happen. You should get a message that you need to set up Authenticator app and register for MFA. Follow the prompts to complete using your personal phone. There is a chance that you might get a login failure message with several options on how to proceed. Select the Try Again option in this case.

You can see that because of the Conditional Access rule we created for Delia, MFA is required to launch Office 365 home page

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-10.jpg)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-11.jpg)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-12.jpg)
![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-13.jpg)

## Configure MFA to be required for login

### Configure Azure AD Per-User MFA

Configure MFA for user accounts. This is another way to get to the multi-factor auth settings

* Switch back to the Azure Active Directory dashboard in the Azure portal.
* Select Users
* At the top of the Users pane, select Per-user MFA.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-14.jpg)

* A new browser tab/window will open with a multi-factor authentication user settings dialog. (You can enable or disable MFA on a user basis by selecting a user and then using the quick steps on the right side.)
* Select Adele Vance with a check-mark.
* Select the Enable option under quick steps

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-15.jpg)

* Read the notification popup if you get it, then select enable multi-factor auth button.
* Close

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/mfa-16.jpg)

Notice that Adele now has Enabled as her MFA status

You can select service settings to see the MFA setting screen, seen earlier in the lab.

Close the MFA setting tab.

