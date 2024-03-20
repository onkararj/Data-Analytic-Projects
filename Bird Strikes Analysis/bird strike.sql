create database birds;
use birds;

CREATE TABLE bird (
	`Record ID` DECIMAL(38, 0) NOT NULL, 
	`Aircraft: Type` VARCHAR(8) NOT NULL, 
	`Airport: Name` VARCHAR(45) NOT NULL, 
	`Altitude bin` VARCHAR(9) NOT NULL, 
	`Aircraft: Make/Model` VARCHAR(20) NOT NULL, 
	`Wildlife: Number struck` VARCHAR(9) NOT NULL, 
	`Wildlife: Number Struck Actual` DECIMAL(38, 0) NOT NULL, 
	`Effect: Impact to flight` VARCHAR(21) NOT NULL, 
	`FlightDate` DATE NOT NULL, 
	`Effect: Indicated Damage` VARCHAR(13) NOT NULL, 
	`Aircraft: Number of engines?` DECIMAL(38, 0) NOT NULL, 
	`Aircraft: Airline/Operator` VARCHAR(33) NOT NULL, 
	`Origin State` VARCHAR(25) NOT NULL, 
	`When: Phase of flight` VARCHAR(12) NOT NULL, 
	`Conditions: Precipitation` VARCHAR(15) NOT NULL, 
	`Remains of wildlife collected?` BOOL NOT NULL, 
	`Remains of wildlife sent to Smithsonian` BOOL NOT NULL, 
	`Wildlife: Size` VARCHAR(6) NOT NULL, 
	`Conditions: Sky` VARCHAR(10) NOT NULL, 
	`Wildlife: Species` VARCHAR(29) NOT NULL, 
	`Pilot warned of birds or wildlife?` BOOL NOT NULL, 
	`Cost: Total $` DECIMAL(38, 0) NOT NULL, 
	`Feet above ground` DECIMAL(38, 0) NOT NULL, 
	`Number of people injured` DECIMAL(38, 0) NOT NULL, 
	`Is Aircraft Large?` BOOL NOT NULL
);


SET SESSION sql_mode = '';

LOAD DATA INFILE 
'D:\New_file.csv'
INTO TABLE bird
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from bird;

select * from bird_strikes;
select distinct(`Number of people injured`) from bird; 
select distinct (`Airport: Name`) from bird;
select count(distinct `Airport: Name`) from bird;
select distinct(`Aircraft: Type`) from bird;
select distinct(`Aircraft: Make/Model`) from bird;
select count(distinct`Aircraft: Make/Model`) from bird;
select distinct(`Wildlife: Number struck`) from bird;
SELECT COUNT(*) FROM bird WHERE `Wildlife: Number struck` IS NULL OR `Wildlife: Number struck` = '';
SELECT COUNT(*) FROM bird WHERE `Aircraft: Airline/Operator` IS NULL OR `Aircraft: Airline/Operator` = '';
select distinct(`Aircraft: Airline/Operator`) from bird;
select count(distinct`Aircraft: Airline/Operator`) from bird;
select count(`Aircraft: Airline/Operator`) from bird;
select `Aircraft: Airline/Operator` from bird;
select distinct(`Effect: Impact to flight`) from bird;
select count(distinct`Origin State`) from bird;
select distinct`Origin State` from bird;
select `Origin State`= 'Idaho' from bird;









