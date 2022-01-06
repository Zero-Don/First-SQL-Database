
Drop Database vehicle_registration;



-- Question 1 

CREATE database Vehicle_Registration;


-- Question 2

use Vehicle_Registration;

CREATE table Owner (
 Owner_ID INT NOT NULL PRIMARY KEY,
 Owner_Type varchar(25),
 Owner_Name varchar(25),
 Address varchar(50),
 Telephone varchar(10)
);

CREATE table Driver (
 Driver_ID INT NOT NULL PRIMARY KEY,
 License_Number VARCHAR(11),
 Owner_ID INT NOT NULL,
 FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID)
);

CREATE table Registered_Vehicle (
 Vehicle_ID varchar(7) NOT NULL PRIMARY KEY,
 License_Plate_No varchar(6)
);

CREATE table Vehicle (
 Vehicle_ID varchar(7) NOT NULL,
 Foreign Key (Vehicle_ID) References Registered_Vehicle(Vehicle_ID),
 Vehicle_Type varchar(7),
 Engine_Serial_Number varchar(8) NOT NULL Primary Key,
 Make varchar(15),
 Model varchar(15),
 Vehicle_Year YEAR
);

CREATE table Owns (
 Owner_ID INT NOT NULL,
 Vehicle_ID varchar(7) NOT NULL,
 Purchase_Date DATE,
 Lien_Or_Regular varchar(7),
 Purchase_Price float, 
 primary key(Owner_ID, Vehicle_ID)
);

/* Question 3.*/

INSERT INTO Owner VALUES
 (100500, "Bank", "BNS", "5 Knutsford Boulevard", "8769066114"),
 (100501, "Person", "Roger Hyman", "12 Sandringham Ave", NULL),
 (100502, "Company", "Nestle Ja. Ltd", "1 South Street FerryPen", "8769053021"),
 (100503, "Bank", "NCB", "12 Knutsford Boulevard", "8767024876"),
 (100504, "Company", "LASCO", "20 Red Hills Road", "8769456754");

INSERT INTO Driver VALUES
 (100, "104-205-402", 100500),
 (101, "103-203-504", 100501),
 (102, "102-405-902", 100502),
 (103, "106-703-205", 100503),
 (104, "108-309-207", 100504);


INSERT INTO Registered_Vehicle VALUES
 ("A209065", "9432EF"),
 ("B309087", "7442FG"),
 ("C452098", "9776HF"),
 ("A456721", "9665HK"),
 ("C467823", "8765EH"),
 ("A306578", "7865JK"),
 ("B567897", "6543WX");


INSERT INTO Vehicle VALUES
 ("A209065", "CAR", "A69352CA", "Ford", "Mustang", 2019),
 ("B309087", "BUS", "B43696BU", "Oldsmobile", "Cutlass", 2015),
 ("C452098", "TRUCK", "X83554TR", "Toyota", "Delta", 2001),
 ("A456721", "CAR", "C43742CA", "Mercedes", "Benz", 2021),
 ("C467823", "TRUCK", "U28365TR", "Toyota", "XJS", 2012),
 ("A306578", "CAR", "Y82935CA", "Mazda", "YTS", 2017),
 ("B567897", "CAR", "W76589CA", "Honda", "Civic", 2021);

INSERT INTO Owns VALUES
 (100500, "A209065", "2000-01-22", "Regular" ,12000),
 (100501, "B309087", "2005-02-23", "Lien", 25000),
 (100502, "C452098", "2000-03-22", "Lien", 22000),
 (100503, "A456721", "2020-12-15", "Regular", 20000),
 (100504, "C467823", "2011-06-18", "Regular", 10000),
 (100500, "A306578", "2016-05-19", "Regular", 8000),
 (100501, "B567897", "2020-02-20", "Lien", 18000);





-- Question 4

SELECT *
FROM Owns
Where Owner_ID = 100500;


-- Question 5.

SELECT *
FROM Owns
WHERE Purchase_Date < "2017-01-01";


Set SQL_safe_updates = 0;

-- Question 6
UPDATE Owns
SET Purchase_Price = (Purchase_Price * (1 + 18/100));

Select * From Owns;


																				
-- Question 7
DELETE FROM DRIVER
WHERE Owner_ID = 100502;

Select * From Driver;


-- Question 8.
UPDATE Owner
SET Telephone = "8767675532"
WHERE Telephone = "8769053021";

Select * from Owner;


-- Question 9.
SELECT *
FROM Registered_Vehicle
WHERE License_PLate_No LIKE '9%';

Select * from Registered_Vehicle;


-- Question 10

SELECT SUM(Purchase_Price)
FROM Vehicle
INNER JOIN Owns
ON Vehicle.Vehicle_ID = Owns.Vehicle_ID
WHERE Vehicle_Type = "Car";


-- Question 11
ALTER TABLE Owner
ADD Vehicle_ID INT;

Select * from Owner;


-- Question 12

SELECT Owner_ID, Count(Owner_ID) AS Number_Of_Vehicle
FROM Owns
GROUP BY Owner_ID;

-- Question 13
SELECT *
FROM Owns
WHERE Purchase_Date LIKE "%-02-%";


-- Question 14
SELECT avg(Purchase_Price)
FROM Owns
WHERE Lien_Or_Regular = "Lien";


-- Question 15
SELECT Owner_Name
FROM Owner
WHERE Owner_Type = "Person";















