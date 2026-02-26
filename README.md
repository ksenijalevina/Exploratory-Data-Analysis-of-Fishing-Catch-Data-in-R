# r-fishing-catch-analysis
Exploratory Data Analysis of Fishing Catch using R


# Fishing Catch Efficiency Analysis

This project analyzes fishing catch efficiency during the year 2020 in Lithuania by calculating and examining the CPUE (Catch Per Unit Effort) - is a standardized measure of fishing effectiveness.
CPUE was calculated using this formula:
  * CPUE = caught quantity / fishing effort (hour) *
This analysis includes data cleaning, analysis (using functions and looking for important aspects), data visualization.

---
## Tools
RStudio

---
## Data Source
Data source: https://data.gov.lt/datasets/2877/?resource_version=472#info
(from the official Lithuanian open data portal)

---
## Data Cleaning
The following steps were performed:
* removed unnecessary columns
* converted date-time and logical columns
* extracted year, month from fishing start time
* calculated CPUE

---
## Analysis Steps
* CPUE calculation
* 2020 year focus. This dataset was filtered to analyze fishing activity during 2020 in Lithuania.
* Fishing trips were categorized into time of day: night (00-04), morning (04-12), afternoon (12-18), evening (18-24).

---
## Data Visualization
The following graphs were visualized:
* Log CPUE distribution
* Log distribution of fish catch
* Number of trips by time of day
* Log CPUE by Time of day

Logarithmization is necessary because there are a lot of small values ​​and a few large values.
All plots are saved in 'figures' folder
---
## Key Insights
* The CPUE distribution is asymmetric, right-skewed.
* Logarithmization helps better interpret the  plots.
* The highest number of fishing trips is observed in the morning, fewer occur in the afternoon.
* The highest CPUE appears at night.
* Most fishing trips result in average catches, while very large catches are quite rare.

The analysis highlights how efficiency indicators can provide deeper insights than raw catch volumes alone.
