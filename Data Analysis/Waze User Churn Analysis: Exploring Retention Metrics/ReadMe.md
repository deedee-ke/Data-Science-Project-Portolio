
# Waze User Churn Analysis

## Overview

Welcome to the Waze User Churn Analysis project! This analysis delves into user data obtained from Waze to understand user behaviors, engagement metrics, and factors influencing user retention or churn within the application. The analysis has been conducted using both SQL and Python to gain a comprehensive understanding.

## SQL Analysis

### Data Exploration

The SQL analysis involved querying the user data in the Waze database to explore missing values in the `label` column and assess their impact on the dataset.

### Summary Statistics

Queries were performed to extract summary statistics such as average kilometers driven, average number of drives, and average driving days per user.

### User Behavior Analysis

The SQL queries investigated median kilometers per drive, median kilometers per driving day, and median drives per driving day for churned and retained users. Additionally, churn rates were explored based on device types to understand correlations between device usage and churn.

## Python Analysis

### Data Preparation

In Python using Pandas library, the Waze user data was loaded and prepared for analysis, including handling missing values and extracting summary information about the dataset.

### Exploratory Data Analysis (EDA)

Python notebooks were used to conduct EDA, analyzing key variables, calculating summary statistics, and visualizing user behavior patterns related to churn rates.

### Conclusion and Recommendations

Both SQL and Python analyses provided valuable insights into user behavior within the Waze app. The findings suggest potential enhancements to improve user experience and strategies for reducing churn rates.

## Key Insights

- **User Behavior Patterns:** Users who churned tended to drive longer distances in fewer days compared to retained users. They also exhibited differences in app usage frequency.
- **Device Impact:** Churn rates did not significantly differ between Android and iPhone users, indicating device type might not directly influence churn.

## How to Explore the Analysis

1. **SQL Analysis:** The SQL queries used in the analysis are documented in the provided SQL file. You can run these queries against your database to replicate the analysis.

2. **Python Analysis:** Python Jupyter Notebooks containing the Python analysis is available for exploration. Execute the notebook to delve deeper into the analysis conducted using Python.
