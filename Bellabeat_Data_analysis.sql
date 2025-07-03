-- users per each table
SELECT
  COUNT(DISTINCT (Id)) AS Users
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`

-- users' category by activity level
SELECT Id,
  COUNT(Id) AS Total_days_usage,
  CASE
  WHEN COUNT(Id) BETWEEN 0 AND 10 THEN 'Light_user'
  WHEN COUNT(Id) BETWEEN 11 AND 20 THEN 'Moderate_user'
  WHEN COUNT(Id) BETWEEN 21 AND 31 THEN 'Active_user'
END AS user_activity
FROM `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`
GROUP BY Id
ORDER BY user_activity

-- summary of minutes per category for each day
SELECT ActivityDate,
  SUM(SedentaryMinutes) AS Sedentary,
  SUM(LightlyActiveMinutes) AS Lightly_Active,
  SUM(FairlyActiveMinutes) AS Fairly_Active,
  SUM(VeryActiveMinutes) AS Very_Active
FROM `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`
GROUP BY ActivityDate
ORDER BY ActivityDate

-- active vs inactive mins
SELECT
  ROUND(AVG(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes),2) AS Avg_Active_Mins,
  ROUND(AVG(SedentaryMinutes),2) AS Avg_Sedentary_Mins
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`


-- average number of steps per day
SELECT 
  AVG(TotalSteps) AS Avg_Steps_Per_Day
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`

-- users activity category by number of steps
SELECT 
  Total_Steps,
  COUNT(*) AS User_Count
FROM(
  SELECT
  Id,
  ROUND(AVG(TotalSteps),2) AS AVG_Total_Steps,
  CASE
  WHEN ROUND(AVG(TotalSteps),2) < 4999 THEN 'Sedentary level activity user'
  WHEN ROUND(AVG(TotalSteps),2) BETWEEN 5000 AND 7499 THEN 'Low activity user'
  WHEN ROUND(AVG(TotalSteps),2) BETWEEN 7500 AND 9999 THEN 'Somewhat active user'
  WHEN ROUND(AVG(TotalSteps),2) BETWEEN 10000 AND 12499 THEN 'Active user'
  WHEN ROUND(AVG(TotalSteps),2) BETWEEN 15000 AND 20000 THEN 'Very activity user'
END
  AS Total_steps,
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`
GROUP BY 
  Id)
GROUP BY 
  Total_Steps
ORDER BY
  User_Count DESC

-- average intensity by hour of day
SELECT
  ActivityHour AS Hour_of_Day,
  ROUND(AVG(TotalIntensity),2) AS Avg_Intensity
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.hourlyIntensities`
GROUP BY
  Hour_of_Day

-- sleep vs. active level
SELECT
  ROUND(AVG(TotalMinutesAsleep)/60,2) AS Avg_Hours_Asleep
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.sleepDay`


-- count of users by sleeping category
SELECT
  Sleeping_category,
  COUNT(*) AS User_Count
FROM(
  SELECT
  Id,
  CASE
    WHEN ROUND(AVG(TotalMinutesAsleep)/60,2) < 6 THEN 'Not_Enough_Sleep'
    WHEN ROUND(AVG(TotalMinutesAsleep)/60,2) BETWEEN 6 AND 7 THEN 'Moderate_Amount_of_Sleep'
    WHEN ROUND(AVG(TotalMinutesAsleep)/60,2) BETWEEN 7 AND 13 THEN 'Long_Hours_of_Sleep'
  END
    AS Sleeping_category
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.sleepDay`
GROUP BY
  Id)
GROUP BY
  Sleeping_category
ORDER BY
  User_Count DESC


-- total time spent on activity each day
SELECT 
  ROUND(AVG(SedentaryMinutes),2) AS sedentary_mins,
  ROUND(AVG(LightlyActiveMinutes),2) AS lightly_active_mins,
  ROUND(AVG(FairlyActiveMinutes),2) AS fairly_active_mins,
  ROUND(AVG(VeryActiveMinutes),2) AS very_active_mins,
  ROUND(AVG(TotalTimeInBed),2) AS sleep_mins,
FROM `my-2nd-project-ag.CaseStudy_Bellabeat.sleep_and_dailyActivity` 
  WHERE
    TotalTimeInBed IS NOT NULL


-- sleep time vs steps made
SELECT
  sd.Id,
  sd.TotalMinutesAsleep,
  dd.TotalSteps
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.sleepDay` sd
INNER JOIN
  `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity` dd
ON
  sd.Id = dd.Id
  AND sd.SleepDay = dd.ActivityDate


-- day of the week
SELECT 
  *,
  FORMAT_DATE('%A', ActivityDate) AS Day_of_Week
FROM `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity` 


-- Activity vs Calories burned by the day of the week
SELECT
  Day_of_Week,
  ROUND(AVG(TotalSteps)) AS avg_steps,
  ROUND(AVG(Calories)) AS avg_calories,
FROM `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity_dayOfWeek` 
GROUP BY Day_of_Week 
ORDER BY 1 DESC

-- total steps vs. calories burnt
SELECT
  Id,
  TotalSteps,
  Calories
FROM
  `my-2nd-project-ag.CaseStudy_Bellabeat.dailyActivity`
WHERE
  TotalSteps > 0 AND Calories > 0


