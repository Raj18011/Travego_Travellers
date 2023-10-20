
-- Task 1
create database travego;
use travego;

-- 1. (Easy) Creating the schema and required tables using MySQL workbench
-- a. Create a schema named Travego and create the tables mentioned above with the mentioned
-- column names. Also, declare the relevant datatypes for each feature/column in the dataset. (5
-- marks)
create table Passenger (
    Passenger_id int primary key,
    Passenger_name varchar(20),
    Category varchar(20),
    Gender varchar(20),
    Boarding_City varchar(20),
    Destination_City varchar(20),
    Distance int,
    Bus_Type varchar(20)
);
create table Price (
    id int primary key,
    Bus_type varchar(20),
    Distance int,
    Price int
);
-- b. Insert the data in the newly created tables. (3 marks)
insert into Passenger (Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
values
(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
(4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
select * from passenger;
insert into Price (Id,Bus_type, Distance, Price)
values
(1, 'Sleeper', 350, 770),
(2, 'Sleeper', 500, 1100),
(3, 'Sleeper', 600, 1320),
(4, 'Sleeper', 700, 1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200, 2640),
(7, 'Sleeper', 1500, 2700),
(8, 'Sitting', 500, 620),
(9, 'Sitting', 600, 744),
(10, 'Sitting', 700, 868),
(11, 'Sitting', 1000, 1240),
(12, 'Sitting', 1200, 1488),
(13, 'Sitting', 1500, 1860);
select * from price;
-- -------------------------------------------------------------------------------------------
-- Task 2
-- 2. (Medium) Perform read operation on the designed table created in the above task.
-- a. How many female passengers traveled a minimum distance of 600 KMs? (1 mark)
select count(gender) from passenger where gender like '%f%' and distance >=600;
-- -----------------------------------------
-- b. Write a query to display the passenger details whose travel distance is greater than 500 and
-- who are traveling in a sleeper bus. (2 marks)
select * from passenger where distance >500 and bus_type like '%sleeper%' ;
-- -----------------------------------------
-- c. Select passenger names whose names start with the character 'S'.(2 marks)
select passenger_name from passenger where passenger_name like 's%';
-- -----------------------------------------
-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output. (3 marks)
select p.passenger_name,p.Boarding_city,p.destination_city,p.bus_type,pr.price 
from passenger p join price pr 
on P.Bus_Type = PR.Bus_Type and P.Distance = PR.Distance;
-- -----------------------------------------
-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in
-- a bus? (4 marks)
select * from passenger;
select p.passenger_name,pr.price 
from passenger p join price pr 
on P.Bus_Type = PR.Bus_Type and P.Distance = PR.Distance
where p.distance = 1000 and p.bus_type = 'sitting';
-- -----------------------------------------
-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? (5
-- marks)
select * from price 
where distance = (select distance from passenger where passenger_name = 'pallavi');
-- -----------------------------------------
-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper (2 marks)
update Passenger
set Category = 'Non-AC'
where Bus_Type = 'Sleeper';
select * from passenger where bus_type like '%sleeper%';
-- -----------------------------------------
-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in
-- the database. (1 mark)
delete from passenger where passenger_name = 'piyush';
-- -----------------------------------------
-- i. Truncate the table passenger and comment on the number of rows in the table (explain if
-- required). (1 mark)
truncate table Passenger;
# After executing this statement all rows in the "Passenger" table will be deleted
# and the table will have zero rows
select * from passenger;
-- j. Delete the table passenger from the database. (1 mark)
drop table passenger;
select * from passenger;
show tables from travego;


