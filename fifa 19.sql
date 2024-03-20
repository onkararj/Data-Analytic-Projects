create database fifa19;
use fifa19;

drop table fifa19;

CREATE TABLE fifa19 (
	a DECIMAL(38, 0) NOT NULL, 
	`ID` DECIMAL(38, 0) NOT NULL, 
	`Name` VARCHAR(22) NOT NULL, 
	`Age` DECIMAL(38, 0) NOT NULL, 
	`Photo` VARCHAR(46) NOT NULL, 
	`Nationality` VARCHAR(20) NOT NULL, 
	`Flag` VARCHAR(36) NOT NULL, 
	`Overall` DECIMAL(38, 0) NOT NULL, 
	`Potential` DECIMAL(38, 0) NOT NULL, 
	`Club` VARCHAR(35), 
	`Club Logo` VARCHAR(47) NOT NULL, 
	`Value` VARCHAR(7) NOT NULL, 
	`Wage` VARCHAR(5) NOT NULL, 
	`Special` DECIMAL(38, 0) NOT NULL, 
	`Preferred Foot` VARCHAR(5), 
	`International Reputation` varchar(38), 
	`Weak Foot` DECIMAL(38, 0), 
	`Skill Moves` DECIMAL(38, 0), 
	`Work Rate` VARCHAR(14), 
	`Body Type` VARCHAR(19), 
	`Real Face` varchar(5), 
	`Position` VARCHAR(3), 
	`Jersey Number` varchar(38), 
	`Joined` varchar(30), 
	`Loaned From` VARCHAR(35), 
	`Contract Valid Until` VARCHAR(50), 
	`Height` VARCHAR(4), 
	`Weight` VARCHAR(6), 
	`LS` VARCHAR(4), 
	`ST` VARCHAR(4), 
	`RS` VARCHAR(4), 
	`LW` VARCHAR(4), 
	`LF` VARCHAR(4), 
	`CF` VARCHAR(4), 
	`RF` VARCHAR(4), 
	`RW` VARCHAR(4), 
	`LAM` VARCHAR(4), 
	`CAM` VARCHAR(4), 
	`RAM` VARCHAR(4), 
	`LM` VARCHAR(4), 
	`LCM` VARCHAR(4), 
	`CM` VARCHAR(4), 
	`RCM` VARCHAR(4), 
	`RM` VARCHAR(4), 
	`LWB` VARCHAR(4), 
	`LDM` VARCHAR(4), 
	`CDM` VARCHAR(4), 
	`RDM` VARCHAR(4), 
	`RWB` VARCHAR(4), 
	`LB` VARCHAR(4), 
	`LCB` VARCHAR(4), 
	`CB` VARCHAR(4), 
	`RCB` VARCHAR(4), 
	`RB` VARCHAR(4), 
	`Crossing` DECIMAL(38, 0), 
	`Finishing` DECIMAL(38, 0), 
	`HeadingAccuracy` DECIMAL(38, 0), 
	`ShortPassing` DECIMAL(38, 0), 
	`Volleys` DECIMAL(38, 0), 
	`Dribbling` DECIMAL(38, 0), 
	`Curve` DECIMAL(38, 0), 
	`FKAccuracy` DECIMAL(38, 0), 
	`LongPassing` DECIMAL(38, 0), 
	`BallControl` DECIMAL(38, 0), 
	`Acceleration` DECIMAL(38, 0), 
	`SprintSpeed` DECIMAL(38, 0), 
	`Agility` DECIMAL(38, 0), 
	`Reactions` DECIMAL(38, 0), 
	`Balance` DECIMAL(38, 0), 
	`ShotPower` DECIMAL(38, 0), 
	`Jumping` DECIMAL(38, 0), 
	`Stamina` DECIMAL(38, 0), 
	`Strength` DECIMAL(38, 0), 
	`LongShots` DECIMAL(38, 0), 
	`Aggression` DECIMAL(38, 0), 
	`Interceptions` DECIMAL(38, 0), 
	`Positioning` DECIMAL(38, 0), 
	`Vision` DECIMAL(38, 0), 
	`Penalties` DECIMAL(38, 0), 
	`Composure` DECIMAL(38, 0), 
	`Marking` DECIMAL(38, 0), 
	`StandingTackle` DECIMAL(38, 0), 
	`SlidingTackle` DECIMAL(38, 0), 
	`GKDiving` DECIMAL(38, 0), 
	`GKHandling` DECIMAL(38, 0), 
	`GKKicking` DECIMAL(38, 0), 
	`GKPositioning` DECIMAL(38, 0), 
	`GKReflexes` DECIMAL(38, 0), 
	`Release Clause` VARCHAR(7)
);

SET SESSION sql_mode = '';

LOAD DATA INFILE 
'D:\fifaa19.csv'
INTO TABLE fifa19
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from fifa19;

desc fifa19;

-- Selecting data
SELECT * FROM 
    fifa19;

-- Filtering data
SELECT 
    Name,
    Age,
    Nationality,
    Overall,
    Potential
FROM 
    fifa19
WHERE 
    Club = 'FC Barcelona' AND
    Age < 25;

-- Aggregating data
SELECT 
    Club,
    AVG(Overall) AS Avg_Overall_Rating,
    AVG(Potential) AS Avg_Potential_Rating,
    MAX(Value) AS Max_Player_Value
FROM 
    fifa19
GROUP BY 
    Club;

-- Ordering data
SELECT 
    Name,
    Age,
    Overall,
    Potential
FROM 
    fifa19
ORDER BY 
    Overall DESC,
    Age ASC;

-- Filtering Players by Nationality:

SELECT Name, Age, Nationality, Overall, Potential
FROM fifa19
WHERE Nationality = 'Brazil';
-- This query retrieves players from Brazil, showing their names, ages, nationalities, overall ratings, and potential ratings. 
-- You can replace 'Brazil' with any other nationality to filter players accordingly.


-- Analyzing Players' Preferred Foot:

SELECT `Preferred Foot`, COUNT(*) AS Count
FROM fifa19
GROUP BY `Preferred Foot`;
-- This query analyzes the distribution of players' preferred foot (left or right) and counts the number of players for each preference. 
-- It provides insights into the prevalence of left-footed and right-footed players in the dataset.


-- Identifying Players with High Potential:

SELECT Name, Age, Potential
FROM fifa19
WHERE Potential > 90
order by Potential desc;
-- This query identifies players with high potential ratings (greater than 90) and displays their names, ages, and potential ratings. 
-- It helps in identifying young players with exceptional growth potential.


-- Comparing Players' Positions:

SELECT Position, AVG(Overall) AS Avg_Overall_Rating
FROM fifa19
GROUP BY Position
ORDER BY Avg_Overall_Rating DESC;


-- Finding Players with Specific Attributes:

SELECT Name, Age, Club, Position
FROM fifa19
WHERE Acceleration > 90 AND SprintSpeed > 90;

-- Identifying Key Players by Club:

SELECT Club, Name, Position, Overall
FROM fifa19
WHERE Club = 'Real Madrid' AND Overall >= 85
ORDER BY Overall DESC;



-- Analyzing Age Distribution:

SELECT 
    CASE 
        WHEN Age BETWEEN 16 AND 20 THEN '16-20'
        WHEN Age BETWEEN 21 AND 25 THEN '21-25'
        WHEN Age BETWEEN 26 AND 30 THEN '26-30'
        ELSE '31+'
    END AS Age_Group,
    COUNT(*) AS Player_Count
FROM fifa19
GROUP BY Age_Group;


-- Comparing Players' Wage by Position:
 
-- Finding Versatile Players:

SELECT Name, Position, Crossing, Dribbling, LongPassing, ShortPassing
FROM fifa19
WHERE Position IN ('RB', 'LB', 'RM', 'LM') 
    AND Crossing >= 80 
    AND Dribbling >= 80 
    AND LongPassing >= 80;


-- Top Goal Scorers by Position:

SELECT Position, Name, Finishing
FROM fifa19
WHERE Finishing >= 85
ORDER BY Finishing DESC;



-- Finding Players with High Potential and Low Overall Rating:

SELECT Name, Age, Potential, Overall
FROM fifa19
WHERE Potential > Overall AND Overall < 80
ORDER BY Potential DESC;


-- Analyzing Player Attributes by Body Type:

SELECT `Body Type`, 
       AVG(Acceleration) AS Avg_Acceleration, 
       AVG(SprintSpeed) AS Avg_SprintSpeed, 
       AVG(Shooting) AS Avg_Shooting, 
       AVG(Passing) AS Avg_Passing
FROM fifa19
GROUP BY `Body Type`;


-- Identifying Free Agents:

SELECT Name, Position, Overall, Value, Wage
FROM fifa19
WHERE Club IS NULL
ORDER BY Overall DESC;


-- Comparing Players' Defensive Attributes:

SELECT Name, Position, Marking, StandingTackle, SlidingTackle
FROM fifa19
WHERE Position IN ('CB', 'LB', 'RB', 'CDM')
ORDER BY Marking + StandingTackle + SlidingTackle DESC;



-- Identifying Midfield Maestros:

SELECT Name, Position, BallControl, ShortPassing AS Passing, Vision
FROM fifa19
WHERE Position IN ('CM', 'CAM', 'CDM')
AND BallControl >= 85 AND ShortPassing >= 85 AND Vision >= 85
ORDER BY BallControl + ShortPassing + Vision DESC;


-- Identifying Fastest Players:

SELECT Name, Position, Acceleration, SprintSpeed
FROM fifa19
ORDER BY (Acceleration + SprintSpeed) DESC
LIMIT 10;



UPDATE fifa19
SET Value = REPLACE(REPLACE(Value, '€', ''), 'M', '');

-- Analyzing Player Value Distribution:

SELECT 
    CASE
        WHEN Value < 50 THEN 'Low'
        WHEN Value BETWEEN 50 AND 100 THEN 'Medium'
        ELSE 'High'
    END AS Value_Category,
    COUNT(*) AS Player_Count
FROM fifa19
GROUP BY Value_Category;



-- Identifying Most Expensive Players by Position:

SELECT Position, Name, Value
FROM fifa19
WHERE Value = (SELECT MAX(Value) FROM fifa19)
ORDER BY Position;


-- Finding Players with High Potential Yet Low Wages:

SELECT Name, Position, Wage, Potential
FROM fifa19
WHERE Wage < 5000 AND Potential >= 85
ORDER BY wage ASC;


-- Comparing Player Attributes of Different Nationalities:

SELECT Nationality, AVG(Overall) AS Avg_Overall, AVG(Potential) AS Avg_Potential
FROM fifa19
GROUP BY Nationality
ORDER BY Avg_Overall DESC, Avg_Potential DESC;



-- Analyzing Player Growth Potential by Age Group:

SELECT 
    CASE
        WHEN Age <= 20 THEN 'Under 20'
        WHEN Age BETWEEN 21 AND 25 THEN '21-25'
        WHEN Age BETWEEN 26 AND 30 THEN '26-30'
        ELSE 'Over 30'
    END AS Age_Group,
    AVG(Potential) AS Avg_Potential
FROM fifa19
GROUP BY Age_Group
ORDER BY CASE 
    WHEN Age_Group = 'Under 20' THEN 1
    WHEN Age_Group = '21-25' THEN 2
    WHEN Age_Group = '26-30' THEN 3
    ELSE 4
END;


-- Finding Versatile Players:

SELECT Name, Position, Overall, Versatility
FROM (
    SELECT 
        Name, Position, Overall, 
        CASE 
            WHEN ST > 80 AND RW > 80 AND LW > 80 THEN 'Striker & Winger'
            WHEN CDM > 80 AND CM > 80 THEN 'Midfielder'
            ELSE 'Not Versatile'
        END AS Versatility
    FROM fifa19
) AS subquery
WHERE Versatility <> 'Not Versatile'
ORDER BY Overall DESC;


-- Analyzing Club Investment in Youth Players:

SELECT 
    Club, 
    COUNT(*) AS Youth_Players_Count, 
    AVG(Age) AS Avg_Age, 
    AVG(Potential) AS Avg_Potential
FROM fifa19
WHERE Age <= 21
GROUP BY Club
ORDER BY Youth_Players_Count DESC;

-- Identifying Most Impactful Players in Specific Positions:

SELECT 
    Position,
    Name,
    Overall,
    Value
FROM fifa19
WHERE Overall > 85 AND Position IN ('GK', 'CB', 'CM', 'ST')
ORDER BY Value DESC;

-- Comparing Players' Consistency with Reactions and Composure:

SELECT 
    Name,
    Position,
    Reactions,
    Composure
FROM fifa19
ORDER BY (Reactions + Composure) DESC
LIMIT 10;

-- Identifying Players with Strong Defensive Attributes:

SELECT 
    Name, Position, Marking, StandingTackle, SlidingTackle
FROM fifa19
WHERE Marking > 80 AND StandingTackle > 80 AND SlidingTackle > 80
ORDER BY Overall DESC;


-- Finding Players with Exceptional Long Shot Ability:

SELECT 
    Name, Position, LongShots
FROM fifa19
WHERE LongShots > 85
ORDER BY LongShots DESC;

-- Analyzing Player Distribution by Nationality:

SELECT 
    Nationality, COUNT(*) AS Player_Count
FROM fifa19
GROUP BY Nationality
ORDER BY Player_Count DESC
LIMIT 10;


--  Vision:

-- Players with Excellent Vision (Positive)
SELECT Name, Vision
FROM fifa19
WHERE Vision >= 85
ORDER BY Vision DESC;

-- Players with Poor Vision (Negative)
SELECT Name, Vision
FROM fifa19
WHERE Vision < 50
ORDER BY Vision ASC;



-- Penalties:

-- Players with Strong Penalty Skills (Positive)
SELECT Name, Penalties
FROM fifa19
WHERE Penalties >= 80
ORDER BY Penalties DESC;

-- Players with Weak Penalty Skills (Negative)
SELECT Name, Penalties
FROM fifa19
WHERE Penalties < 50
ORDER BY Penalties ASC;


-- Composure:
-- Players with High Composure (Positive)
SELECT Name, Composure
FROM fifa19
WHERE Composure >= 80
ORDER BY Composure DESC;

-- Players with Low Composure (Negative)
SELECT Name, Composure
FROM fifa19
WHERE Composure < 50
ORDER BY Composure ASC;


select * from fifa19;

SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'fifa19';

select count(name)
from fifa19;
#===============================================================

-- Create table for Goalkeepers
CREATE TABLE Goalkeepers AS
SELECT *
FROM fifa19
WHERE Position IN ('GK');
select * from Goalkeepers;
drop table Goalkeepers;

-- Create table for Defenders
CREATE TABLE Defenders AS
SELECT *
FROM fifa19
WHERE Position IN ('LWB', 'LDM', 'CDM', 'RDM', 'RWB', 'LB', 'LCB', 'CB', 'RCB', 'RB');
select * from Defenders;

-- Create table for Midfielders
CREATE TABLE Midfielders AS
SELECT *
FROM fifa19
WHERE Position IN ('LM', 'LCM', 'CM', 'RCM', 'RM', 'LAM', 'CAM', 'RAM');
select * from Midfielders; 

-- Create table for Forwards
CREATE TABLE Forwards AS
SELECT *
FROM fifa19
WHERE Position IN ('LF', 'CF', 'RF', 'LW', 'ST', 'RW');
select * from Forwards;


SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Position ORDER BY Overall DESC) AS position_rank_desc,
           ROW_NUMBER() OVER (PARTITION BY Position ORDER BY Overall ASC) AS position_rank_asc
    FROM fifa19
) AS ranked_players
WHERE position_rank_asc <= 20;


DELETE FROM fifa19
WHERE Position <> 'GK'
AND (LS = '' OR ST = '' OR RS = '' OR LW = '' OR LF = '' OR CF = '' OR RF = '' OR RW = '' OR LAM = '' OR CAM = '' OR RAM = '' OR LM = '' OR LCM = '' OR CM = '' OR RCM = '' OR RM = '' OR LWB = '' OR LDM = '' OR CDM = '' OR RDM = '' OR RWB = '' OR LB = '' OR LCB = '' OR CB = '' OR RCB = '' OR RB = '');
select * from fifa19;


CREATE TABLE NonGoalkeeperPlayers AS
SELECT ID, Name
FROM fifa19
WHERE Position NOT IN ('GK');

select * from NonGoalkeeperPlayers;


select distinct(Nationality) from fifa19;

select count(distinct(Club)) from fifa19;













