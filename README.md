# r-fishing-catch-analysis
Exploratory data analaysis of fishing catch using R


# Fishing Catch Efficiency Analysis

This project analyzes fishing catch efficiency during the year 2020 in Lithuania by colculating and examining  the CPUE (Catch Per Unit Effort).
CPUE was calculated busing this formula:
  * CPUE = caught quantity/fishing effort (hour) *
This analysis includes data cleaning, analysis (using function, and looking for important aspects), data visualization.

---
## Tools
RStudio

---
## Data source
Data source: https://data.gov.lt/datasets/2877/?resource_version=472#info
(from official Lithuanian open data portal)

---
## Data Cleaning
The following steps was performed:
* removed unnecessary columns
* converted date-time/logical columns
* extracted year, month from fishing start time
* calculated CPUE

---
## Analysis steps
* CPUE calculation
* 2020 year focus. This dataset was filtered to analyze fishing activity during 2020 in Lithuania.
* Fishing trips were categorized into time of day: night(00-04), morning(04-12), afternoon(12-18), evening(18-24).

---
## Data visualization
The following graphs were visualized:
* Log CPUE distribution
* Log distribution of fish catch
* Number of trips by time of day
* Log CPUE by Time of day
Logarithmization is necessary because There are a lot of small values ​​and a few large values.
All plots are saved in 'figures' folder
---
## Key Insights
* The CPUE distribution is asymmetric, right-skewed.
* Logarithmization helps better interpretate plots
* The most fishing trips occur during morning and less afternoon
* The highest CPUE appears at night.
* Most fishing trips result in average catches, while very large catches are quite rare.
* 
The analysis highlights how efficiency indicators can provide deeper insights than raw catch volumes alone.
