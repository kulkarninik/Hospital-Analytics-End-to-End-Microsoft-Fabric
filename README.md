# Hospital-Analytics-End-to-End-Microsoft-Fabric

## Overview

An end-to-end analytics project built using Microsoft Fabric
demonstrating Medallion Architecture (Bronze, Silver, Gold), Semantic
Model, and Power BI dashboards.

## Technology Stack

-   SQL Server
-   Microsoft Fabric
-   Fabric Pipelines
-   Lakehouse
-   PySpark Notebooks
-   Delta Tables
-   Semantic Model
-   Power BI
-   DAX

## Architecture

``` text
SQL Server
    │
    ▼
Fabric Pipeline
    │
    ▼
Bronze Layer
    │
    ▼
Bronze → Silver Notebook
    │
    ▼
Silver Layer
    │
    ▼
Silver → Gold Notebook
    │
    ▼
Gold Layer
    │
    ▼
Semantic Model
    │
    ▼
Power BI Report
```

## Dashboards

-   Executive Dashboard
-   Doctor Analytics
-   Department Analytics

## Future Enhancements

-   Incremental refresh
-   Fabric Data Agent (supported capacity)
-   Real-time streaming
-   Predictive analytics
