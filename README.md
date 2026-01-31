# ✈️ Operational Risk Analytics – Airline Flight Delays

## 1. 📌 Overview

This project applies data analytics and basic machine learning to analyze operational risk patterns in airline operations, with a focus on flight delays and cancellations.
The objective is not to build a highly predictive model, but to identify risk hotspots across time and geography to support proactive operational decision-making.

## 2. 🎯 Business Context

Flight delays and cancellations do not occur randomly. They are influenced by temporal and geographic factors, and these patterns are often hidden when performance is evaluated only through aggregated KPIs such as overall on-time rates.
This project demonstrates how data analytics can be used to surface localized operational risks and provide insights that are actionable for operations and management teams.

## 3. 🧩 Data Layers

The data pipeline is organized into three logical layers:
| Layer              | Description                            |
| ------------------ | -------------------------------------- |
| **A – Raw**        | Original CSV data loaded into SQL      |
| **A’ – ETL**       | Cleaned and enriched data for analysis |
| **A’’ – Insights** | Analytical outputs and model results   |

## 4. 🔄 Analytics Workflow

### 4.1. Data Ingestion (SQL – Raw Layer)

- Raw CSV data is loaded into a SQL table

- No transformation is applied at this stage

- Purpose: data traceability and auditability

### 4.2. Data Transformation (SQL – ETL Layer)

- Creation of structured analytical tables

- Basic enrichment (date attributes, derived fields)

- Output: analysis-ready dataset

### 4.3. Exploratory Data Analysis (Python)

- The Python notebook performs:

- Data quality checks

- Distribution and trend analysis

- Identification of delay patterns by time and region

Key EDA findings show that delay risk is not evenly distributed across continents and months.

### 4.4. Modeling Approach

Several classification models were evaluated:

- Logistic Regression

- Random Forest

- Gradient Boosting

Logistic Regression was selected as the baseline due to:

- Better recall for delay identification

- Clear interpretability

- No meaningful performance gain from more complex models

The model is used as a risk screening tool, not a deterministic predictor.

### 4.5. Insight Delivery (Power BI)

- Model outputs and aggregated insights are visualized in Power BI

- Dashboards highlight:

   - Risk hotspots by time and geography

   - Operational performance trends

- Power BI is used for visualization only; logic remains upstream

## 5. 📊 Key Insights

- Operational risk is unevenly distributed across regions and time periods

- Aggregated KPIs mask localized delay risk

- Analytics is more effective as a decision-support tool than a pure prediction engine in this context

## 6. 💼 Business Value

- Early identification of operational risk hotspots

- More focused allocation of monitoring and operational resources

- Improved situational awareness for operational planning