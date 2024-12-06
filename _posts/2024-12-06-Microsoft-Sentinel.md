---
title: Microsoft Sentinel
date: 2024-12-06 4:49
categories: [Microsoft Azure]
tags: [Microsoft Azure] # TAG names should always be lowercase
image: https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/microsenti.png
---

# Microsoft Sentinel Kusto Queries for Azure AD data sources

> This document and the configurations contained herein are works of fiction created for illustrative and educational purposes only. Any similarities to real persons, institutions, organizations, systems, or scenarios are purely coincidental.

### Microsoft Sentinel
Microsoft Sentinel is a scalable, cloud-native security information and event management (SIEM) that delivers an intelligent and comprehensive solution for SIEM and security orchestration, automation, and response (SOAR). Microsoft Sentinel provides cyberthreat detection, investigation, response, and proactive hunting, with a bird's-eye view across your enterprise.

Microsoft Sentinel also natively incorporates proven Azure services, like Log Analytics and Logic Apps, and enriches your investigation and detection with AI. It uses both Microsoft's threat intelligence stream and also enables you to bring your own threat intelligence.

Kusto Query Language (KQL)

Kusto Query Language (KQL) is a powerful tool to explore your data and discover patterns, identify anomalies and outliers, create statistical modeling, and more. KQL is a simple yet powerful language to query structured, semi-structured, and unstructured data. The language is expressive, easy to read and understand the query intent, and optimized for authoring experiences. Kusto Query Language is optimal for querying telemetry, metrics, and logs with deep support for text search and parsing, time-series operators and functions, analytics and aggregation, geospatial, vector similarity searches, and many other language constructs that provide the most optimal language for data analysis. The query uses schema entities that are organized in a hierarchy similar to SQLs: databases, tables, and columns.


## Configure Microsoft Sentinel for Kusto Queries
#### Create a Microsoft Sentinel workspace

* Search for and then select Microsoft Sentinel.
* Select Create Microsoft Sentinel

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-1.jpg)

* In the Add Microsoft Sentinel to a workspace tile, select Create a new workspace

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-2.jpg)

* In Resource group, select Create new and enter Sentinel-RG.
* Name the workspace. Example - SentinelLogAnalytics.
* Select a Region close to you.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-3.jpg)

* Select Review + Create and then Create.

* After the Log Analytics workspace deployment completes, choose the Refresh button. Then select your workspace and select Add. This will add the workspace to Microsoft Sentinel and open Microsoft Sentinel.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-4.jpg)

#### Add Azure AD as a Data source

* In Microsoft Sentinel, navigate to the menu to Configuration and select Data connectors.
* In the list of Data connectors, locate Azure Active Directory and select.
* On the right, a preview tile will open. Select the Open Connector page.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-5.jpg)

* On the connector page, the instructions and next steps will be provided for the data connector. Verify that a checkmark is next to each of the Prerequisites to continue with the Configuration.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-6.jpg)

* Under Configuration, check the boxes for Sign-in logs and Audit logs. Additional log sources are available.
* Select Apply Changes

* Notification will be provided that the changes were applied successfully. Navigate to the Microsoft Sentinel workspace by selecting the X on the top right of the connector page.
* Select Refresh on the Microsoft Sentinel | Data connectors tile and the number 1 will show in the Connected count.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-7.png)

### Run Kusto query on User activity

* In Microsoft Sentinel, navigate to Logs under the General menu heading.
* A window will open with sample queries, select Audit, and scroll to find User IDs.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-8.jpg)

* Select Run
* This will provide a list of User IDs on Azure AD. Since we have just created the workspace, you may not see results. Note the format of the query.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-9.jpg)

* Under Threat management in the menu, select Hunting.
* Scroll down to find the query Anomalous sign-in location by user account and authenticating application. This query over Azure Active Directory sign-in considers all user sign-ins for each Azure Active Directory application and picks out the most anomalous change in location profile for a user within an individual application. The intent is to hunt for user account compromise, possibly via a specific application vector.

![img-description](https://raw.githubusercontent.com/YOSHIxxKT/WareHouse/refs/heads/main/images/images/sentinel-10.jpg)

* Select View query results to run the query.
* This may not provide results with the new workspace, but you now have seen how queries can be run to gather information or for hunting potential threats.