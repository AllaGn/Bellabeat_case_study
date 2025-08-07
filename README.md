Bellabeat Case Study Analysis
By Alla Golban
July 3, 2025

Introduction

A pioneer in the fem-tech realm, Bellabeat is a women’s wellness company that has helped millions of women track their cycle, pregnancies, and live more in sync with their cycles. In period of 2016-2024 this small but very innovative company has won several awards, including The Europas award for Best Health Startup and BIG SEE Award for their products. Bellabeat has all the potential for grow thanks to the strategy and vision of its Co-founders Urska Srsen and Sandro Mur, and five products, developed by Bellabeat team – Leaf (Nature, Urban, Chakra), Spring, Airi, Time, and Ivy. 

Scenario: Data Analytics team has been asked to analyze smart device data to understand how consumers use their smart devices. The insights discovered will then help guide the marketing strategy for the company. 

Business Task:
•	Reveal opportunities to improve Bellabeat’s products.
•	Guide data-driven marketing strategies to attract new customers and retain existing ones.
Scope of study:
•	Identify trends in physical activity (active minutes, calories burned, intensity) and sleep quality.
•	Correlate activity levels with sleep metrics.
Tools used in project:
1.	MS Excel for storing raw data.
2.	MS Excel and BigQuery for cleaning, analyzing, and transforming data.
3.	MS Excel and Tableau for visualizing data.
4.	MS Word for creating project document.

Project approach:
•	Followed six phases of data analysis process:
 
•	ROCCC framework for ensuring data credibility:
R – Reliable. Data is reliable, as it was collected by Fitbit, and was collected via survey. 
O – Originality. Data was collected from 30 eligible Fitbit users, who consented as participants.
C – Comprehensive. Even though the data is small (size of 30), it is the minimum number of data points for proving statistical significance, and contains activity, calories, steps, intensities, sleep and heart rates.
C – Current. The data was collected in 2016 and is not current.
C – Cited. The data source is Kaggle.com, without any information on author of the data. The dataset use for analysis is available through Fitbit Tracker Data. 

1.	ASK
Analyze smart tracking device usage to gain insight into how consumers use non-Bellabeat smart devices and use those insights to guide Bellabeat’s marketing strategy.
Guiding questions:
1.	What are some trends in smart device usage?
2.	How could these trends apply to Bellabeat customers?
3.	How could these trends help Bellabeat improve its marketing strategy?

2.	PREPARE
Datasets used were downloaded in zip file from Mobius in Kaggle and licensed under the CCO Public Domain. 18 csv files representing 18 datasets were extracted. 
First, I observed the data in each dataset to understand the scope and the following was discovered:
•	The data is stored in long format, with each ID having data in multiple rows.
•	The data was collected in 2016, so it is outdated.
•	The duration of data collected is in the timeframe between 03-12-2016 and 05-12/1016 but only 31 days are shown.
•	The description of dataset suggests that it contains data for 30 eligible Fitbit users, but further analysis shows that there’s data collected for 33 users.

3.	PROCESS
There were 18 tables available in Bellabeat dataset, but after brief review I decided to take a closer look at the following:
•	dailyactivity_merged.csv
•	dailycalories_merged.csv
•	dailyIntensities_merged.csv
•	dailysteps_merged.csv
•	hourlycalories_merged.csv
•	hourlyintensities_merged.csv
•	hourlysteps_merged.csv
•	minutesleep_merged.csv
•	sleepday_merged.csv
•	weightLogInfo_merged.csv
Cleaning datasets using Excel were done by performing following steps:
•	Sorting and filtering data.
•	Checking for blanks.
•	Formatted the date column from General to Date format by using the ‘Text to Column’ tool to separate dates and time.
•	Modified ‘hourlyIntensities.csv’ table to convert the time column from AM/PM to 24 hrs.
•	Found and removed duplicates from sleepday_merged.csv file (3 duplicates removed, 410 unique values remained).
•	Found and removed duplicates from minutesleep_merged.csv file (543 duplicates removed, 187978 unique values remained)

4.	Analyze
Steps performed to analyze datasets:
1.	Uploaded modified csv files to BigQuery for analysis
2.	Ran the following query for each table to get the count of distinct Id’s to match all tables for further analysis.
 

•	dailyactivity_merged.csv – 33 users
•	dailycalories_merged.csv - 33 users
•	dailyIntensities_merged.csv - 33 users
•	dailysteps_merged.csv - 33 users
•	hourlycalories_merged.csv – 33 users
•	hourlyintensities_merged.csv – 33 users
•	hourlysteps_merged.csv – 33 users
•	minutesleep_merged.csv – 24 users
•	sleepday_merged.csv – 24 users
•	weightLogInfo_merged.csv – 8 users

So, I decided to use only dailyactivity_merged.csv, dailycalories_merged.csv, dailyIntensities_merged.csv, dailysteps_merged.csv, hourlycalories_merged.csv, hourlyintensities_merged.csv, hourlysteps_merged.csv tables as other 3 did not have enough data for analysis.
3.	By reviewing the dailycalories, dailyIntensities, dailysteps I figured that they contain the same data as dailyactivity_merged.csv, so dailyactivity_merged.csv will be used for all 4.

4.	First, I wanted to find out for how long each user was wearing their Fitbit, or being logged in. Knowing that observed period was 31 days, I classified them in three categories - Active, Moderate, or Light users, by running the following query:
 
The result shows that most users were Active (29 users), 3 were Moderate (3) and 1 Light. I used Google spreadsheet to create the chart:
 

5.	Summary of minutes per category for each day:
 
 
2.	To see the relation the users are, I ran the query to find the total amount of active and inactive (sedentary) minutes logged:

 

The result shows that in average users spend most time of the day at Sedentary state.
3.	By running the following query, I found the average number of steps made by users per day:
 
This amount is lower than recommended, which is 8,000-10,000 steps per day.
According to heathline article the table below displays the activity level and steps per day accordingly:
Activity level	Steps per day
Basal	Below 2,500
Limited	2,500–4,999
Low	5,000–7,499
Somewhat active	7,500–9,999
Active	10,000-12,499
Very active	over 12,500

I used this classification to categorize users by the total number of steps.
 
The result of query above reveals that out of 33 the most of users - 18 fall into ‘Low active’ and ‘Somewhat active category, 8 users are at ‘Sedentary level’, 5 are active and 2 are very active:
 
 

4.	Finding the average intensity by hour of day:
 
The peak of the activity falls at around 5-7 pm:
  

5.	Sleep vs Active level – to find out I needed to see what the average amount of sleep is in hours. The result shows 6.99 hours of average sleep for Fitbit users:
 
The Harvard study shows that the minimum amount of sleep for adults is 7 hours, so 6.99 is just below that recommendation, and means that our observed users were not getting enough sleep in that period of time. 

6.	I decided to see if there is a relation between how much sleep users get and their activity level. To do that I divided their sleeping records in 3 categories:
 


7.	Total time spent on activity every day:
 
This is not enough, as per WHO the adults aged 18-64 years should do at least 20-25 mins of moderate-intensity physical activity per day and 40-42 minutes more for additional health benefits.
So, in average each user spent 32% of their daily activity on sleep, 50% they are in sedentary state, and 18% they are active:
 

8.	Next, I wanted to see the correlation between sleep time and steps made.
 

9.	Ran this query to distinguish the days of the week:
 

To see the Activity vs Calories burned by the day of the week:
 
According to this query the most active days are Tuesday and Saturday, with not much difference in calories burnt by day of the week:
 

10.	Also, I wanted to see if there’s any correlation between the Total Steps and Calories burnt:
 

5.	Share
These are some insights made during the analysis stage:
a.	Average users spend 81% of their day at sedentary stage, and only 19% of time they are active
 

b.	On average users do not make amount of daily recommended steps with average of 7,637.91 steps per day.
c.	Chart below breaks down the activity level as per number of steps made:
 
d.	The peak of activity is around 5-7 PM:
 
e.	The sleep level of average user is below recommended – 6.99 hours per day.
f.	Users were not getting enough sleep either, with average amount of 6.99 hours. Out of 24 user who logged their sleep patterns half were getting long hours of sleep, and half of them 7 or less hours of sleep:
 
g.	There’s no correlation between steps made and amount of sleep:
 
a.	But I see positive correlation between steps made and calories burnt, which means the more active users tend to burn more calories:
 

6.	Act
Recommended Marketing strategy:
1.	Implement a Smart Reminder Feature
Introduce a smartwatch feature that sends users periodic reminders to move throughout the day, with a suggested target of minimum 250 steps per hour to promote regular physical activity.
2.	Promote Calorie Tracking Tool
Develop and market the feature that helps users monitor and manage daily calorie consumption and support better weight management.
3.	Encourage Workout Adherence
Launch motivational tools or in-app notifications that help users stick to their workout schedules, reinforcing consistent activity and goal completion.
4.	Build a Supportive Women’s Community
Create an interactive platform where Bellabeat’s predominantly female users can share success stories, discuss challenges, and draw inspiration from one another to foster connection and accountability.
5.	Offer Access to Online Workout Classes
Provide users with on-demand virtual workout classes, enabling them to stay active outside of their usual routines—at home, while traveling, or during busy schedules.
