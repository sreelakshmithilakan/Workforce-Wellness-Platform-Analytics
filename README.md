# Workforce Wellness Platform Analytics

## Overview

Workforce Wellness Platform Analytics is an end-to-end Business Intelligence project that simulates how organizations can monitor employee well-being, engagement, burnout risk, participation behavior, and wellness program effectiveness through data-driven decision-making.

Built using MySQL, SQL, Power BI, DAX, and data modeling techniques, the project transforms workforce wellness data into actionable insights for HR teams, managers, and leadership stakeholders. The solution enables organizations to identify wellness risks, evaluate wellness initiatives, improve employee engagement, and support long-term workforce well-being.

---

# Business Problem

Organizations invest heavily in employee wellness initiatives, engagement programs, rewards systems, and wellness campaigns. However, leadership teams often struggle to understand whether these initiatives are improving employee well-being and reducing burnout.

This project addresses key business questions:

* Which employees are at risk of burnout?
* Are wellness programs improving employee engagement?
* Which departments require intervention?
* Does work mode influence employee well-being?
* Do rewards motivate participation?
* Which wellness activities generate the strongest engagement?
* How does leadership influence wellness culture?

---

# Project Objectives

* Monitor workforce wellness health
* Identify high-risk employees and departments
* Analyze employee engagement patterns
* Evaluate wellness program effectiveness
* Measure reward and motivation impact
* Understand participation behavior
* Analyze leadership and team culture influence
* Support strategic workforce wellness decisions

---

# Tools & Technologies

## Database

* MySQL

## Data Analysis

* SQL
* Joins
* Aggregations
* Views

## Business Intelligence

* Power BI
* Data Modeling
* DAX Measures
* Interactive Dashboards

## Data Validation

* Microsoft Excel

---

# Database Design

The project was designed using a relational database structure representing a workforce wellness platform.

## Core Tables

### Employees

Stores employee demographic and organizational information.

Key attributes include:

* Employee ID
* Department
* Team
* Manager
* Work Mode
* Gender
* Age Group
* Job Level

### Daily Wellness Activities

Stores employee participation in wellness activities.

Key attributes include:

* Activity Name
* Wellness Dimension
* Participation Status
* Effort Level
* Wellness Engagement Score
* Burnout Risk
* Reward Points
* Streak Days

### Wellness Events

Stores wellness campaigns, participation details, and event effectiveness metrics.

---

# Wellness Scoring Framework

| Metric                    | Description                                  | Formula                                         |
| ------------------------- | -------------------------------------------- | ----------------------------------------------- |
| Participation Rate (P)    | Measures participation consistency           | (Completed Activities ÷ Total Activities) × 100 |
| Streak Score (S)          | Measures consistency of wellness habits      | (Current Streak ÷ 25) × 100                     |
| Individual Score (I)      | Measures participation quality and effort    | Wellness Dimension Score × Effort Multiplier    |
| Wellness Engagement Score | Overall employee engagement score            | (0.4 × P) + (0.3 × S) + (0.3 × I)               |
| Burnout Risk              | Employee burnout probability indicator       | 100 − Wellness Engagement Score                 |
| Reward Points             | Rewards consistency and participation effort | Individual Score + (2 × Streak Days)            |

---

# Power BI Data Modeling

A relational data model was developed in Power BI to support reporting and interactive analysis.

## Data Modeling Activities

* Imported SQL tables and analytical views
* Created table relationships using Employee ID and business keys
* Configured one-to-many relationships
* Enabled cross-table filtering and aggregation
* Built a centralized reporting model for workforce analytics

## Benefits

The data model enables:

* Employee-level analysis
* Department-level reporting
* Burnout segmentation
* Participation analysis
* Leadership and culture analysis
* Workforce wellness trend reporting

---

# SQL Analysis Framework

The project was structured around key business questions and organizational wellness objectives.

## 1. Workforce Wellness Segmentation

**Objective:** Understand overall workforce wellness behavior.

**KPIs**

* Wellness Engagement Score
* Burnout Risk
* Participation Status
* Streak Days

---

## 2. High-Risk Employee Detection

**Objective:** Identify employees requiring wellness intervention.

**KPIs**

* Burnout Risk
* Engagement Score
* Participation Status
* Streak Days

---

## 3. Work Mode Analysis

**Objective:** Evaluate how remote, hybrid, and onsite work environments influence employee wellness.

**KPIs**

* Work Mode
* Engagement Score
* Burnout Risk
* Participation

---

## 4. Wellness Program Effectiveness

**Objective:** Measure wellness initiative performance.

**KPIs**

* Activity Participation
* Engagement Score
* Wellness Dimension
* Event Type

---

## 5. Leadership & Team Culture Analysis

**Objective:** Understand leadership influence on wellness culture.

**KPIs**

* Manager
* Team
* Engagement Score
* Burnout Risk

---

## 6. Reward Effectiveness & Employee Motivation

**Objective:** Analyze the relationship between rewards and employee engagement.

**KPIs**

* Reward Points
* Engagement Score
* Participation

---

## 7. Event Participation Analysis

**Objective:** Measure wellness event effectiveness.

**KPIs**

* Event Type
* Participant Count
* Engagement Metrics

---

## 8. Inclusion & Participation Analysis

**Objective:** Evaluate participation equity across departments and teams.

**KPIs**

* Department
* Team
* Participation Status

---

## 9. Organizational Wellness Trends

**Objective:** Track workforce wellness performance over time.

**KPIs**

* Engagement Score
* Burnout Risk
* Participation Metrics

---

# SQL Concepts Used

## Joins

* INNER JOIN
* LEFT JOIN

## Aggregations

* AVG()
* SUM()
* COUNT()
* GROUP BY

## Subqueries

Example:

* Employees above company average engagement

## Common Table Expressions (CTEs)

Example:

* Department wellness rankings

## Window Functions

Examples:

* ROW_NUMBER()
* RANK()
* DENSE_RANK()

## Views

Business-specific analytical views were created to support reporting and dashboard development.

---

# Power BI Dashboard

The project includes a four-page executive dashboard.

## Page 1 – Executive Workforce Wellness Overview

Features:

* KPI Summary Cards
* Engagement Distribution
* Burnout Distribution
* Participation Distribution
* Department Wellness Analysis
* Wellness Dimension Analysis

---

## Page 2 – Risk & Workforce Behaviour Analysis

Features:

* Burnout Risk Analysis
* Work Mode Analysis
* Participation Behaviour Analysis
* Workforce Risk Insights

---

## Page 3 – Program Effectiveness & Culture Analysis

Features:

* Wellness Activity Effectiveness
* Reward Effectiveness
* Event Participation Analysis
* Leadership & Team Culture Analysis

---

## Page 4 – Executive Insights & Recommendations

Features:

* Key Findings
* Strategic Recommendations
* Wellness Impact Conclusions
* Actionable Business Insights


---

# Key Business Outcomes

The platform enables organizations to:

* Monitor workforce wellness health
* Detect burnout risks early
* Improve employee engagement
* Evaluate wellness program effectiveness
* Strengthen participation culture
* Support leadership decision-making
* Improve long-term employee well-being

---

# Future Enhancements

## Data Improvements

* More realistic workforce behavior simulation
* Enhanced department-level variation
* Improved burnout and engagement modeling
* Expanded trend analysis

## FastAPI Analytics Application

Future versions will extend the project into a workforce wellness analytics application.

### Planned Features

#### REST API Endpoints

* Employee Wellness API
* Burnout Risk API
* Participation Analytics API
* Department Analytics API

#### Interactive Analytics Application

Built using:

* FastAPI
* Python
* MySQL

Capabilities:

* Real-time analytics retrieval
* Employee wellness profiles
* Department wellness lookup
* Burnout risk monitoring
* Dashboard API endpoints


---

# Dashboard Preview


### Executive Workforce Wellness Overview

<img width="1292" height="722" alt="image" src="https://github.com/user-attachments/assets/9c2fcb77-0462-44f0-a8b6-edf125e106a6" />




---

# Project Status

## Completed

✅ Database Design, SQL Analysis Framework, SQL Views, Power BI Data Modeling, DAX Measures, Dashboard Development

## In Progress

🔄 Dashboard Refinement


## Planned

🚀 FastAPI Analytics Application

---

# Author

**Sreelakshmi V T**

Data Analytics | Business Intelligence

Focused on building data-driven solutions using SQL, Power BI, data modeling, and business analytics to support strategic decision-making.
