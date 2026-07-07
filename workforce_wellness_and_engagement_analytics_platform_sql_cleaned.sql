-- =====================================================================
-- Workforce Wellness Analytics using SQL
-- =====================================================================

USE workforce_wellness;

-- =====================================================================
-- Database Preparation
-- =====================================================================

ALTER TABLE employees
RENAME COLUMN `ï»¿employee_id` TO employee_id;
ALTER TABLE wellness_events
RENAME COLUMN `ï»¿event_id` TO event_id;

-- =====================================================================
-- Analytical Views
-- =====================================================================

-- Employee Engagement Segmentation
CREATE VIEW vw_engagement_segmentation AS
SELECT
    employee_id,
    wellness_engagement_score,
    CASE
        WHEN wellness_engagement_score < 40 THEN 'Low Engagement'
        WHEN wellness_engagement_score BETWEEN 40 AND 70 THEN 'Moderate Engagement'
        ELSE 'High Engagement'
    END AS engagement_category
FROM daily_wellness_activities;

-- Burnout Risk Segmentation
CREATE VIEW vw_burnout_segmentation AS
SELECT
    employee_id,
    burnout_risk,
    CASE
        WHEN burnout_risk < 30 THEN 'Low Burnout Risk'
        WHEN burnout_risk BETWEEN 30 AND 60 THEN 'Moderate Burnout Risk'
        ELSE 'High Burnout Risk'
    END AS burnout_category
FROM daily_wellness_activities;

-- Participation Segmentation
CREATE VIEW vw_participation_segmentation AS
SELECT
    employee_id,
    participation_status,
    CASE
        WHEN participation_status = 'Completed'
            THEN 'Active Participant'
        ELSE 'Inactive Participant'
    END AS participation_category
FROM daily_wellness_activities;

-- Participation Consistency Segmentation
CREATE VIEW vw_streak_segmentation AS
SELECT
    employee_id,
    streak_days,
    CASE
        WHEN streak_days < 5 THEN 'Weak Consistency'
        WHEN streak_days BETWEEN 5 AND 15 THEN 'Moderate Consistency'
        ELSE 'Strong Consistency'
    END AS streak_category
FROM daily_wellness_activities;

-- High-Risk Employee Detection
CREATE VIEW vw_high_risk_employee_detection AS
SELECT
    employee_id,
    burnout_risk,
    wellness_engagement_score,
    participation_status,
    streak_days,
    reward_points,
    CASE
        WHEN burnout_risk > 70
             AND wellness_engagement_score < 40
            THEN 'High Risk'
        WHEN burnout_risk BETWEEN 40 AND 70
            THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS employee_risk_category
FROM daily_wellness_activities;

-- =====================================================================
-- Workforce Overview
-- =====================================================================

-- Engagement Distribution

SELECT
    engagement_category,
    COUNT(*) AS employee_count
FROM vw_engagement_segmentation
GROUP BY engagement_category;

-- Burnout Distribution

SELECT
    burnout_category,
    COUNT(*) AS employee_count
FROM vw_burnout_segmentation
GROUP BY burnout_category;

-- Participation Distribution

SELECT
    participation_category,
    COUNT(*) AS employee_count
FROM vw_participation_segmentation
GROUP BY participation_category;

-- Participation Consistency Distribution

SELECT
    streak_category,
    COUNT(*) AS employee_count
FROM vw_streak_segmentation
GROUP BY streak_category;

-- =====================================================================
-- Department Analysis
-- =====================================================================

-- Department Participation Segmentation

SELECT
    e.department,
    v.participation_category,
    COUNT(*) AS employee_count
FROM employees e
JOIN vw_participation_segmentation v
    ON e.employee_id = v.employee_id
GROUP BY
    e.department,
    v.participation_category
ORDER BY
    e.department,
    employee_count DESC;

-- =====================================================================
-- High-Risk Analysis
-- =====================================================================

-- Overall Risk Distribution

SELECT
    employee_risk_category,
    COUNT(*) AS employee_count
FROM vw_high_risk_employee_detection
GROUP BY employee_risk_category
ORDER BY employee_count DESC;

-- Department High-Risk Distribution

SELECT
    e.department,
    v.employee_risk_category,
    COUNT(*) AS employee_count
FROM employees e
JOIN vw_high_risk_employee_detection v
    ON e.employee_id = v.employee_id
GROUP BY
    e.department,
    v.employee_risk_category
ORDER BY
    e.department,
    employee_count DESC;

-- Top High-Risk Employees

SELECT
    employee_id,
    burnout_risk,
    wellness_engagement_score,
    streak_days,
    reward_points,
    employee_risk_category
FROM vw_high_risk_employee_detection
WHERE employee_risk_category = 'High Risk'
ORDER BY burnout_risk DESC
LIMIT 20;

-- =====================================================================
-- Work Mode Analysis
-- =====================================================================

SELECT
    e.work_mode,
    v.engagement_category,
    COUNT(*) AS employee_count
FROM employees e
JOIN vw_engagement_segmentation v
    ON e.employee_id = v.employee_id
GROUP BY
    e.work_mode,
    v.engagement_category
ORDER BY
    e.work_mode,
    employee_count DESC;

-- =====================================================================
-- Wellness Program Effectiveness
-- =====================================================================

-- Activity Performance

SELECT
    activity_name,
    ROUND(AVG(wellness_engagement_score),2) AS avg_engagement_score,
    COUNT(*) AS participation_count
FROM daily_wellness_activities
WHERE participation_status='Completed'
GROUP BY activity_name
ORDER BY avg_engagement_score DESC;

-- Wellness Dimension Performance

SELECT
    wellness_dimension,
    ROUND(AVG(wellness_engagement_score),2) AS avg_engagement_score,
    ROUND(AVG(burnout_risk),2) AS avg_burnout_risk,
    COUNT(*) AS participation_count
FROM daily_wellness_activities
WHERE participation_status='Completed'
GROUP BY wellness_dimension
ORDER BY avg_engagement_score DESC;

-- =====================================================================
-- Leadership Analysis
-- =====================================================================

SELECT
    e.manager_id,
    v.engagement_category,
    COUNT(*) AS employee_count
FROM employees e
JOIN vw_engagement_segmentation v
    ON e.employee_id = v.employee_id
GROUP BY
    e.manager_id,
    v.engagement_category
ORDER BY
    e.manager_id,
    employee_count DESC;

-- =====================================================================
-- Reward Effectiveness
-- =====================================================================

SELECT
    v.engagement_category,
    ROUND(AVG(d.reward_points),2) AS avg_reward_points,
    ROUND(AVG(d.reward_earned),2) AS avg_reward_earned,
    COUNT(*) AS employee_count
FROM vw_engagement_segmentation v
JOIN daily_wellness_activities d
    ON v.employee_id=d.employee_id
GROUP BY
    v.engagement_category
ORDER BY avg_reward_points DESC;

-- =====================================================================
-- Event Participation Analysis
-- =====================================================================

SELECT
    event_type,
    COUNT(*) AS participation_count,
    ROUND(AVG(engagement_score),2) AS avg_engagement_score,
    ROUND(AVG(final_reward_score),2) AS avg_reward_score
FROM wellness_events
WHERE participation_status='Attended'
GROUP BY event_type
ORDER BY participation_count DESC;

-- =====================================================================
-- Organizational Trends
-- =====================================================================

WITH monthly_wellness AS
(
    SELECT
        MONTH(STR_TO_DATE(date,'%d-%m-%Y')) AS month_number,
        ROUND(AVG(wellness_engagement_score),2) AS avg_engagement_score,
        ROUND(AVG(burnout_risk),2) AS avg_burnout_risk
    FROM daily_wellness_activities
    GROUP BY MONTH(STR_TO_DATE(date,'%d-%m-%Y'))
)

SELECT *
FROM monthly_wellness
ORDER BY month_number;

-- =====================================================================
-- Wellness Impact Analysis
-- =====================================================================

SELECT
    wellness_dimension,
    ROUND(AVG(burnout_risk),2) AS avg_burnout_risk,
    ROUND(AVG(wellness_engagement_score),2) AS avg_engagement_score,
    COUNT(*) AS participation_count
FROM daily_wellness_activities
WHERE participation_status='Completed'
GROUP BY wellness_dimension
ORDER BY avg_burnout_risk;


SHOW FULL TABLES
WHERE Table_type='VIEW';