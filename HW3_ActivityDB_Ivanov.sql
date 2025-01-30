/*
CPI 101
HW 3 Activity Database

Name: Christian Ivanov
*/
 
/*
			TABLES
*/


Creating the ActivityLog Table
CREATE TABLE ActivityLog (
	logID INT PRIMARY KEY,
	activityID INT,
	durationMin INT,
	timeStart DATETIME,
	FOREGIN KEY (activityID) REFERENCES ActivityCalories(activityID)
);
*/

/*
CREATE TABLE ActivityCalories
    .... complete this
	CREATE TABLE ActivityCalories (
	 activityID INT PRIMARY KEY,
	 activity VARCHAR(255).
	 caloriesPerHour INT
);
*/

/*
INSERT INTO ActivityCalories .... complete this
*/
INSERT INTO ActivityCalories (activityID, activity, caloriesPerHour) VALUES
(1, 'walking', 300),
(2, 'jogging', 500),
(3, 'golf', 200),
(4, 'yoga', 100);
(5, 'tennis', 400),
(6, 'swimming', 600),
(7, 'biking', 500),

/*
Second table Here
*/

INSERT INTO ActivityLog (logID, activityID, durationMin, timeStart) VALUES
(1, 2, 60, '2024-02-01 08:00:00'),
(2, 4, 20, '2024-02-01 09:50:00'),
(3, 3, 180, '2024-02-04 08:00:00'),
(4, 6, 60, '2024-02-05 07:50:00'),
(5, 1, 120, '2024-02-06 07:50:00'),
(6, 2, 60, '2024-02-09 08:00:00'),
(7, 5, 100, '2024-02-11 08:50:00'),
(8, 7, 60, '2024-02-12 08:50:00'),
(9, 3, 180, '2024-02-15 09:50:00'),
(10, 2, 40, '2024-02-17 13:50:00'),
(11, 6, 40, '2024-02-20 16:50:00'),
(12, 5, 60, '2024-02-21 08:50:00'),


/*
			QUERIES
*/

/* 
---- This is the way your file should look.

*/

 Query the contents of the entire ActivityCalories table.
1. Retrieve all data from the Activity Claories tablr
	 SELECT * FROM  ActivityCalories;
 2. Retrieve all data from the ActivityLog table
	 SELECT * FORM ActivityLog;
 3. Retrieve activity and durationMIn from ActivityLog joined with ActivityCalories
	SELECT a.activity, l.durationMin
	FROM ActivityLog
	JOIN ActivityCalories a ON l.activityID = a.activityID;
 4. Retrieve activity and durationMIn from ActivityLog joined with ActivityCalories for entries on February 1, 2024
	SELECT ac.activity, al.durationMin
	FROM ActivityLog al
	JOIN ActivityCalories ac ON al.activityID = ac.activityID
	WHERE DATE(al.timeStart) = '2024-02-01';
 5.Retrieve the total duration of activity on February 1, 2024 
	SELECT SUM(durationMin) AS Total_Duration_On_Feb_1_2024
	FROM ActivityLog
	WHERE DATE(timeStart) = '2024-02-01';
 6.Retrieve the total minutes spent jogging 
	SELECT SUM(durationMin) AS Total_Minutes_Jogging
	FROM ActivityLog
	JOIN ActivityCalories a ON l.activityID = a.activityID;
	WHERE activity = 'jogging';
 7.Retrieve the days jogging and create a table with time started and duration 
	SELECT DATE(timeStart) AS day, durationMin
	FROM ActivityLog
	JOIN ActivityCalories a ON l.activityID = a.activityID;
	WHERE activity = 'jogging';
 8.Retrieve distinct activities logged in ActivityLog that are in the calorie count list 
	SELECT DISTINCT ac.activity
	FROM ActivityLog al
	JOIN ActivityCalories ac ON al.activityID = ac.activityID;		
/*


*/	

/*
SELECT .... you complete this
SELECT * FROM ActivityCalories;
And then paste your results here. It will look like this:

| activityID | activity | caloriesPerHour |
| ---------- | -------- | --------------- |
| 1          | walking  | 300             |
etc.
*/
**Schema (MySQL v8.0)**

---

**Query #1**

    SELECT * FROM ActivityCalories;

| activityID | activity | caloriesPerHour |
| ---------- | -------- | --------------- |
| 1          | walking  | 300             |
| 2          | jogging  | 500             |
| 3          | golf     | 200             |
| 4          | yoga     | 100             |
| 5          | tennis   | 400             |
| 6          | swimming | 600             |
| 7          | biking   | 500             |

---
**Query #2**

    SELECT * FROM ActivityLog;

| logID | activityID | durationMin | timeStart           |
| ----- | ---------- | ----------- | ------------------- |
| 1     | 2          | 60          | 2024-02-01 08:00:00 |
| 2     | 4          | 20          | 2024-02-01 09:50:00 |
| 3     | 3          | 180         | 2024-02-04 08:00:00 |
| 4     | 6          | 60          | 2024-02-05 07:50:00 |
| 5     | 1          | 120         | 2024-02-06 07:50:00 |
| 6     | 2          | 60          | 2024-02-09 08:00:00 |
| 7     | 5          | 100         | 2024-02-11 08:50:00 |
| 8     | 7          | 60          | 2024-02-12 08:50:00 |
| 9     | 3          | 180         | 2024-02-15 09:50:00 |
| 10    | 2          | 40          | 2024-02-17 13:50:00 |
| 11    | 6          | 40          | 2024-02-20 16:50:00 |
| 12    | 5          | 60          | 2024-02-21 08:50:00 |

---
**Query #3**

    SELECT ac.activity, al.durationMin
    FROM ActivityLog al
    JOIN ActivityCalories ac ON al.activityID = ac.activityID;

| activity | durationMin |
| -------- | ----------- |
| jogging  | 60          |
| yoga     | 20          |
| golf     | 180         |
| swimming | 60          |
| walking  | 120         |
| jogging  | 60          |
| tennis   | 100         |
| biking   | 60          |
| golf     | 180         |
| jogging  | 40          |
| swimming | 40          |
| tennis   | 60          |

---
**Query #4**

    SELECT ac.activity, al.durationMin
    FROM ActivityLog al
    JOIN ActivityCalories ac ON al.activityID = ac.activityID
    WHERE DATE(al.timeStart) = '2024-02-01';

| activity | durationMin |
| -------- | ----------- |
| jogging  | 60          |
| yoga     | 20          |

---
**Query #5**

    SELECT SUM(durationMin) AS Total_Duration_On_Feb_1_2024
    FROM ActivityLog
    WHERE DATE(timeStart) = '2024-02-01';

| Total_Duration_On_Feb_1_2024 |
| ---------------------------- |
| 80                           |

---
**Query #6**

    SELECT SUM(durationMin) AS Total_Minutes_Jogging
    FROM ActivityLog al
    JOIN ActivityCalories ac ON al.activityID = ac.activityID
    WHERE ac.activity = 'jogging';

| Total_Minutes_Jogging |
| --------------------- |
| 160                   |

---
**Query #7**

    SELECT DATE(timeStart) AS day, durationMin
    FROM ActivityLog al
    JOIN ActivityCalories ac ON al.activityID = ac.activityID
    WHERE ac.activity = 'jogging';

| day        | durationMin |
| ---------- | ----------- |
| 2024-02-01 | 60          |
| 2024-02-09 | 60          |
| 2024-02-17 | 40          |

---
**Query #8**

    SELECT DISTINCT ac.activity
    FROM ActivityLog al
    JOIN ActivityCalories ac ON al.activityID = ac.activityID;

| activity |
| -------- |
| walking  |
| jogging  |
| golf     |
| yoga     |
| tennis   |
| swimming |
| biking   |

---

*/


 