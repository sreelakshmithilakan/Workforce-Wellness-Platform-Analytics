# Workforce Wellness Analytics using SQL

## Employee Engagement, Burnout Risk & Workforce Insights

A SQL-based workforce analytics project that explores employee engagement, burnout risk, participation behavior, and wellness program effectiveness using a relational MySQL database.

The project demonstrates how SQL can transform operational workforce data into meaningful business insights through relational database design, reusable analytical views, and business-focused queries.

---

# Business Problem

Organizations invest in employee wellness initiatives to improve engagement and reduce burnout, but understanding the effectiveness of these programs requires structured analysis.

This project simulates a workforce wellness platform and answers key HR analytics questions using SQL, helping identify workforce trends, participation patterns, and potential wellness risks.

---

# Business Questions

This project explores the following questions:

- What is the overall wellness profile of the workforce?
- Which employees are at the highest risk of burnout?
- Which departments require wellness interventions?
- How does employee participation vary across departments?
- How does work mode influence employee engagement?
- How do wellness activities compare in terms of participation and engagement?
- How are rewards associated with employee engagement?
- How does workforce wellness change over time?

---

# Database Schema

```text
Employees
──────────────────────────────────
PK  employee_id
    department
    team_name
    manager_id
    work_mode
    gender
    age_group
    job_level
          │
          │ employee_id
          ▼
Daily Wellness Activities
──────────────────────────────────
PK  activity_id
FK  employee_id
    activity_name
    wellness_dimension
    participation_status
    wellness_engagement_score
    burnout_risk
    reward_points
    streak_days
    activity_date
          │
          │ employee_id
          ▼
Wellness Events
──────────────────────────────────
PK  event_id
FK  employee_id
    campaign_name
    event_type
    participation_status
    engagement_score
    final_reward_score
```

The relational database connects employee information with daily wellness activities and wellness event participation through **employee_id**, enabling employee-level, department-level, and organizational analysis.

---

# Analytical Views

Reusable SQL views were created to simplify reporting and support consistent business analysis.

- `vw_engagement_segmentation`
- `vw_burnout_segmentation`
- `vw_participation_segmentation`
- `vw_streak_segmentation`
- `vw_high_risk_employee_detection`

---

# SQL Analysis

The project is organized around key workforce analytics themes.

### Workforce Overview

- Engagement segmentation
- Burnout segmentation
- Participation segmentation
- Wellness consistency segmentation

### High-Risk Analysis

- Workforce risk distribution
- Department-level risk segmentation
- High-risk employee identification

### Work Mode Analysis

- Engagement comparison across Remote, Hybrid, and Onsite employees

### Wellness Program Effectiveness

- Wellness activity performance
- Wellness dimension analysis

### Leadership Analysis

- Manager-wise engagement distribution

### Reward Analysis

- Relationship between engagement and reward points

### Event Participation

- Participation across wellness event types

### Organizational Trends

- Monthly engagement and burnout monitoring

---

# Key Insights

### Workforce Risk Distribution

The workforce was segmented into three burnout risk categories:

- **37.9%** Low Risk
- **32.7%** Moderate Risk
- **29.3%** High Risk

This demonstrates how SQL-based segmentation can help identify employees who may benefit from proactive wellness initiatives.

---

### Department-Level Risk Analysis

Department-level segmentation highlighted differences in employee risk distribution, with **Tech**, **Sales**, and **Operations** containing the largest High Risk employee groups.

---

### Participation Analysis

Participation segmentation showed that **Active Participants consistently outnumbered Inactive Participants** across departments, providing visibility into employee engagement with wellness initiatives.

---

### High-Risk Employee Characteristics

Employees classified as **High Risk** consistently demonstrated:

- High burnout risk
- Low engagement scores
- Short participation streaks
- Lower reward accumulation

These indicators provide a framework for identifying employees who may require additional wellness support.

---

### Work Mode Analysis

Employee engagement was analyzed across **Remote**, **Hybrid**, and **Onsite** work environments. Moderate engagement represented the largest employee segment across all work modes, while engagement distribution varied slightly between work arrangements.

---

### Wellness Program Analysis

Participation and engagement remained relatively balanced across wellness activities and wellness dimensions within the simulated dataset. The analysis demonstrates how SQL can be used to compare wellness initiatives and monitor employee participation patterns.

---

### Organizational Trends

Monthly engagement and burnout metrics remained relatively stable throughout the reporting period, providing a consistent baseline for workforce wellness monitoring.

> **Note:** This project uses a simulated workforce wellness dataset created for SQL analytics practice. The findings demonstrate analytical workflows and SQL techniques rather than real organizational performance.

---

# SQL Concepts Demonstrated

### Database Design

- Relational Database Design
- Primary & Foreign Keys

### SQL Querying

- SELECT
- CASE
- GROUP BY
- ORDER BY

### Joins

- INNER JOIN

### Aggregations

- COUNT()
- AVG()

### Advanced SQL

- SQL Views
- Common Table Expressions (CTEs)

---

# Repository Structure

```text
workforce-wellness-analytics/
│
├── workforce_wellness_analysis.sql
├── README.md
└── screenshots/
```

---

# Technologies Used

- MySQL
- SQL

---

# Skills Demonstrated

- SQL
- MySQL
- Relational Database Design
- Data Analysis
- Workforce Analytics
- HR Analytics
- Business Intelligence
- Data Segmentation
- SQL Views
- Common Table Expressions (CTEs)
- Joins
- Aggregations

---

# Author

**Sreelakshmi V T**

Data Analytics | Business Intelligence

Passionate about using SQL to transform operational data into actionable business insights that support workforce and organizational decision-making.
