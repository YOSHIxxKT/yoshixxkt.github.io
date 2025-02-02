---
title: Implement Web Apps
date: 2025-02-02-3:54
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/1_LPsV4yody2YbNDFZjz6mmg.png
---

## Implement Web Apps

### scenario

Your organization is interested in Azure Web apps for hosting your company websites. The websites are currently hosted in an on-premises data center. The websites are running on Windows servers using the PHP runtime stack. The hardware is nearing end-of-life and will soon need to be replaced. Your organization wants to avoid new hardware costs by using Azure to host the websites.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/az104-lab09a-architecture.png)

### Task 1: Create and configure an Azure web app

In this task, you create an Azure web app. Azure App Services is a Platform As a Service (PAAS) solution for web, mobile, and other web-based applications. Azure web apps is part Azure App Services hosting most runtime environments, such as PHP, Java, and .NET. The app service plan that you select determines the web app compute, storage, and features.

1. Sign in to the Azure portal - https://portal.azure.com.

2. Search for and select App services.

3. Select + Create, from drop-down menu, Web App. Notice the other choices.

4. On the Basics tab of the Create Web App blade, specify the following settings (leave others with their default values):

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab9a-1-4.png)

5. Click Review + create, and then Create.

6. After the deployment, select Go to resource.

### Task 2: Create and configure a deployment slot

In this task, you will create a staging deployment slot. Deployment slots enable you to perform testing prior to making your app available to the public (or your end users). After you have performed testing, you can swap the slot from development or staging to production. Many organizations use slots to perform pre-production testing. Additionally, many organizations run multiple slots for every application (for example, development, QA, test, and production).

1. On the blade of the newly deployed Web App, click the Default domain link to display the default web page in a new browser tab.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab9a-2-1.png)

2. Close the new browser tab and, back in the Azure portal, in the Deployment section of the Web App blade, click Deployment slots.

> Note: The Web App, at this point, has a single deployment slot labeled PRODUCTION.

3. Click Add slot, and add a new slot with the following settings:

4. Select Add.

5. Back on the Deployment slots blade of the Web App, click the entry representing the newly created staging slot.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab9a-2-5.png)

> Note: This will open the blade displaying the properties of the staging slot.

6. Review the staging slot blade and note that its URL differs from the one assigned to the production slot.

### Task 3: Configure Web App deployment settings

In this task, you will configure Web App deployment settings. Deployment settings allow for continuous deployment. This ensures that the app service has the latest version of the application.

1. In the staging slot, select Deployment Center and then select Settings.
> Note: Make sure you are on the staging slot blade (instead than the production slot).

2. In the Source drop-down list, select External Git. Notice the other choices.

3. In the repository field, enter https://github.com/Azure-Samples/php-docs-hello-world

4. In the branch field, enter master.

5. Select Save.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab9a-3-5.png)

6. From the staging slot, select Overview.

7. Select the Default domain link, and open the URL in a new tab.

8. Verify that the staging slot displays Hello World.


### Task 4: Swap deployment slots

In this task, you will swap the staging slot with the production slot. Swapping a slot allows you to use the code that you have tested in your staging slot, and move it to production. The Azure portal will also prompt you if you need to move other application settings that you have customized for the slot. Swapping slots is a common task for application teams and application support teams, especially those deploying routine app updates and bug fixes.

1. Navigate back to the Deployment slots blade, and then select Swap.

2. Review the default settings and click Start Swap.

3. On the Overview blade of the Web App select the Default domain link to display the website home page.

4. Verify the production web page displays the Hello World! page.

### Task 5: Configure and test autoscaling of the Azure Web App

In this task, you will configure autoscaling of Azure Web App. Autoscaling enables you to maintain optimal performance for your web app when traffic to the web app increases. To determine when the app should scale you can monitor metrics like CPU usage, memory, or bandwidth.

1. In the Settings section, select Scale out (App Service plan).
> Note: Ensure you are working on the production slot not the staging slot.

2. From the Scaling section, select Automatic. Notice the Rules Based option. Rules based scaling can be configured for different app metrics.

3. In the Maximum burst field, select 2.

4. Select Save.

5. Select Diagnose and solve problems (left pane).

6. In the Load Test your App box, select Create Load Test.

* Select + Create and give your load test a name. The name must be unique.
* Select Review + create and then Create.

7. Wait for the load test to create, and then select Go to resource.

8. From the Overview | Add HTTP requests, select Create.

9. On the Test plan tab, click Add request. In the URL field, paste in your Default domain URL. Ensure this is properly formatted and begins with https://.

10. Select Review + create and Create.
> Note: It may take a couple of minutes to create the test.

11. Review the test results including Virtual users, Response time, and Requests/sec.

12. Select Stop to complete the test run. You don't need to wait for the test to complete.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/Lab9a-3-12.png)
