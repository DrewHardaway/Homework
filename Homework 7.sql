-- 1. Using EVregistry, Write a query to select the ModelYear, Make, and Model off all of the vehicles in the registry.

SELECT ModelYear, Make, Model
FROM EVRegistry

-- 2. Using the EVRegistry table, Write a query that lists all of the unique types of EV's. your reult set should have one column, ElectricVehicleType.

SELECT DISTINCT ElectricVehicleType
FROM EVRegistry;

-- 3.  Using the EVregistry, write a query that returns the Make and Model of all of the EV's that have a BaseMSRP between 20000 and 35000?
SELECT *
FROM EVRegistry
WHERE ElectricVehicleType = "Battery Electric Vehicle (BEV)"

-- 4. Using the EVRegistry, write a query that returns the Make and Model of all of the EV's that have a BaseMSRP between 20000 and 35000?

SELECT DISTINCT Make, Model
FROM EVRegistry
WHERE BaseMSRP BETWEEN 20000 AND 35000

-- 7.2
-- 1. Using EVRegistry, write a query to find a record where the City attribute is NULL. Return all of the available columns.
SELECT *
FROM EVRegistry
WHERE City IS NULL

-- 2. Write a query to find the Make, Model, and ElectricVehicleType where the VIN number has that ends in '3E1EA1J'.
SELECT Make, Model, ElectricVehicleType
FROM EVRegistry
WHERE VIN like "%3E1EA1J"

-- 3.  Select the ModelYear, Make, Model, ElectricVehicleType, and range of the Tesla vehicles or Chevrolet vehicles in the registry. Order the result set by Make and Model year in from newest to oldest.
SELECT ModelYear, Make, Model, ElectricVehicleType, ElectricRange
FROM EVRegistry
WHERE Make = "CHEVROLET" OR Make = "TESLA”
ORDER BY Make, 
ModelYear DESC

-- 4. Using EVCharging, Write a query to find out how many many times those stations were used. Order them by the most used to the least used and limit the output to 5 records.
SELECT stationId, 
count(*) as Charges
From EVCharging
GROUP by stationId
ORDER by Charges DESC
LIMIT 5

-- 5. Using EVCharging, For the folks who charged longer than 0.5 hours, show the min and max of the charging time for each user. Your output columns should be userid, minTime, and maxTime. Order this result set by the last two columns respectively.

SELECT DISTINCT userId, 
MIN(chargeTimeHrs) as minHrs, 
MAX(chargeTimeHrs) as maxHrs
FROM EVCharging
WHERE chargeTimeHrs > 0.5
GROUP by userId
ORDER by minHrs, maxHrs

-- 7.3
-- 1. Using EVCharging, Which day of the week has the highest average charging time? Round the answer to 2 decimal points.

SELECT weekday, 
round(AVG(chargeTimeHrs),2) as AvgChargeTime
FROM EVCharging
GROUP by weekday
ORDER by AvgChargeTime DESC
LIMIT 1

-- 2. Using, EV charging, Find the total power consumed from charging EV's by each User. Return the userId and name the calculated column, totalPower. Round the answer to 2 decimal points and list the out put in highest to lowest order. Limit the order to the top 15 users.

SELECT userId, round(AVG(kwhTotal),2) as totalPower
FROM EVCharging
GROUP by userId
ORDER by totalPower DESC
LIMIT 15;

-- 3. Using dimfacility and factCharge, write a query to find out which type of facility (GROUP BY) has the most amount of charging stations. Return type Facility and name the calculated column numStation. Order the result set from highest to lowest number of charging stations.

SELECT dimFacility.typeFacility as 'Type of Facility', 
count(factcharge.stationId) as 'NumStation'
FROM dimFacility
INNER join factCharge 
ON dimFacility.FacilityKey = factCharge.facilityID
GROUP by dimFacility.typeFacility
ORDER by count(factCharge.stationId) DESC

-- 4.  In your own words, Briefly explain Primary Keys and Foreign Keys.
Foreign key is a reference to a primary key. Primary key are created from the local source. 

-- 5. Using EV Charging, For the folks who charged longer than one hour, show the min and max of the charging time for each user. Your output columns should be userid, minTime, and maxTime. Order this result set by the last two columns respectively. HINT: USE HAVING
SELECT userId, 
MIN(chargeTimeHrs) as minTime, 
MAX(chargeTimeHrs) as maxTime
FROM EVCharging
GROUP BY userId
HAVING chargeTimeHrs > 1
ORDER BY 2, 3 DESC