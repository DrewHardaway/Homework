Look at data 
-- 
-- SELECT *
-- FROM evCars
-- LIMIT 25;
-- 
-- SELECT Brand,
-- avg(Accel)
-- FROM evCars
-- GROUP by Brand
-- limit 25;
-- 
-- SELECT Accel FROM evCars
-- 
-- SELECT Accel, RTRIM(Accel, '  sec') 
-- FROM evCars
update evCars
SET Accel = RTRIM(Accel, '  sec') 

SELECT Accel from evCars

Alter table evCars
RENAME Accel to AccelSec

-- 2.2 Selecting the correct String Function
SELECT TopSpeed  FROM evCars


-- update evCars
-- SET RangeKm = RTRIM(Range, '  km')

--  2.3 Visualizing the Changes before making them
SELECT TopSpeed, 
RTRIM(TopSpeed, '  km/h')
FROM evCars 
-- 
--  2.4 UPDATE the records
update evCars
SET TopSpeed = RTRIM(TopSpeed, '  km/h');

-- 2.5 Check your work

sELECT TopSpeed  FROM evCars

-- 2.6 Convert the units to MPH

SELECT TopSpeed, round (TopSpeed* 0.621371, 2)
FROM evCars

UPDATE evCar 
SET TopSpeed = TopSpeed * 0.621371

-- - 2.7 Rename the column
ALTER TABLE evCars 
RENAME TopSpeed TO TopSpeedMPH

-- 2.8 Select All of the records to get a look at the whole table with your recent changes.
SELECT * 
FROM evCars

-- 3.1 Review the column that you are looking to change
SELECT Range  FROM evCars


--  3.2 Selecting the correct String Function
SELECT Range,
RTRIM(Range, ' km')
FROM evCars 

-- - 3.4 UPDATE the records
- update evCars
-- SET RangeKm = RTRIM(Range, '  km')

-- 3.5 Check your work
SELECT Range, RTRIM(Range, '  km')  FROM evCars

--  3.6 Convert the units to MPH
 
 SELECT Range, round (Range* 0.621371, 1)
FROM evCars

-- 3.7 Rename the column
ALTER TABLE evCars
RENAME Range to  RangeMiles

-- 3.8 Select All of the records to get a look at the whole table with your recent changes.
SELECT * 
FROM evCars

-- - 4.1 Write a select statement to review both of the columns that you are looking to change
 SELECT Efficiency, FastCharge  FROM evCars

--  4.2 Selecting the correct String Function that we need to remove for each column.

SELECT Efficiency, FastCharge,
RTRIM( Efficiency,'  Wh/km'), rtrim(FastCharge, 'km/h')
FROM evCars ;

-- - 4.4 UPDATE the records
UPDATE evCars
SET 
Efficiency = RTRIM( Efficiency,'  Wh/km')
,FastCharge = rtrim(FastCharge, 'km/h');

--  4.5 Check your work
 SELECT Efficiency, FastCharge  FROM evCars
 
--  - 4.6 Convert the FastCharge units to MPH
SELECT FastCharge, round (FastCharge* 0.621371, 1)
FROM evCars

UPDATE evCars
SET FastCharge = round (FastCharge* 0.621371, 1)

-- 4.7 Rename the column

ALTER TABLE evCars
RENAME FastCharge to  OneHourFastChargeMiles 

ALTER TABLE evCars
RENAME Efficiency to  efficiencyWHperKM


-- 4.8 Select All of the records to get a look at the whole table with your recent changes. 
SELECT * 
FROM evCars

-- # SECTION 5 

-- 
-- ### - 5.1 Working with `RapidCharge`
-- - Write a query that selects `RapidCharge` and counts all the records based on that attribute. (HINT: Remember GROUP BY from SQL Lesson 7.2)
-- - Take note of the counts for each unique attriute. You should use this to make sure that you are changing the correct number of rows with your update statement. 
-- 
SELECT RapidCharge, count(*)
FROM evCars
group by RapidCharge

-- ### - 5.2 making data cleaning choices 
-- - This attribute or column designates if the car had Rapid charging capability. 
-- - we are going to simplify the records 
--     - this can be done in a few different ways
--         1. you can make the values a boolean: either True or False
--         2. you can make the values a 1 for yes they are rapid charge capable or a 0 for no they are not capable. 
--         3. or you can do a yes or no. 


-- <br>
-- 
-- ### - 5.3 Please fill in the blank on your .md answer sheet
-- - For the purpose of this exercise, if the car's `RapidCharge` value equals _________________ then I want you to change the value to 'Yes' 
-- - If the `RapidCharge` value equals _______________ then I want you to change the value to 'No'. 
-- <br>
-- 
-- ```SQL
-- --write sql code here

Rapid charging not possible = No
Rapid charging possible= Yes
-- ```
-- ### - 5.2 Writing the update Statements  
-- - use this syntax reminder to help guide your update statement writing
-- - you are going to write two update statements, one for each of the conditions described above. 
-- <br>
-- 
-- 
-- ```SQL
UPDATE evCars
SET RapidCharge = 'No'
WHERE RapidCharge = 'Rapid charging not possible';

UPDATE evCars
SET RapidCharge = 'Yes'
WHERE RapidCharge = 'Rapid charging not possible'; 
-- 
-- # SECTION 6 
-- ### -6.1 Visualize the `Powertrain` records
-- - Write a query that selects `PowerTrain` and counts all the records. (HINT: Remember GROUP BY from SQL Lesson 7.2)
-- - Take note of the counts for each unique attriute. You should use this to make sure that you are changing the correct number of rows with your update statement. 
-- <br>

SELECT PowerTrain, count (*) 
FROM evCars
Group by PowerTrain
-- 
-
-- ```
-- 
-- ### - 6.2 Please fill in the blank on your .md answer sheet
-- - look at the three DISTINCT values from the query you wrote in 6.1 and fill in the blanks.
-- - If the PowerTrain equals 'All Wheel Drive' then I want you to change the value to 'AWD'
-- - If the PowerTrain equals __'Front Wheel Drive'__ then I want you to change the value to 'RWD'
-- - If the PowerTrain equals ___'Rear Wheel Drive'__ then I want you to change the value to 'FWD'

-- 
-- ### - 6.3 Write three update statements for the three different conditions 
-- 
UPdate evCars
Set PowerTrain= 'AWD'
WHERE PowerTrain = 'All Wheel Drive';

UPdate evCars
Set PowerTrain= 'FWD'
WHERE PowerTrain = 'Front Wheel Drive';

UPdate evCars
Set PowerTrain= 'RWD'
WHERE PowerTrain = 'Rear Wheel Drive';

-- ### - 6.4 Write a query to Select all of the records to view your changes. 
-- 
SELECT*
From evCars

-- 
-- # SECTION 7 
-- 
-- ### - 7.1 Convert the `PriceEuro` to `PriceUSD` 
-- - Let's convert the `PriceEuro` into US Dollar  
-- - Write a select statement to multiply the `PriceEuro` by 1.09 and Return `PriceEuro` and calculated column. Round the calculated column to 2 decimal places. 
-- - After writing and executing the above query to see the original and the converted values, review them side by side and if satisfied then move to the next step
-- 

SELECT PriceEuro, round((PriceEuro * 1.09),2) As PriceUSD
FROM evCars

-- ### - 7.2 Write the Update Statements 
-- - Turn this query into an UPDATE statement. Remember to round the calculation to two decimal points. 
-- - Write a select query from to check the PriceEuro column 
UPDATE evCars
SET PriceEuro =  round((PriceEuro * 1.09),2);

SELECT PriceEuro
from  evCars


-- ### - 7.3 Rename the Column
ALTER TABLE evCars
RENAME PriceEuro to  PriceUSD
