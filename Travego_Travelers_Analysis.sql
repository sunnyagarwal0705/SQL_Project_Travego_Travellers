create database travego;
use travego;

# Creating table Passengers.
create table passengers(
Passenger_id int primary key,
Passenger_name varchar(20),
Category varchar(10),
Gender varchar(1),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(10)
);

#Creating table Price 
create table price(
id	int primary key,
Bus_type varchar(10),
Distance int,
Price int
);

#Inserting records in the passengers table
insert into passengers (Passenger_id,Passenger_name ,Category,Gender ,Boarding_City ,Destination_City ,Distance ,Bus_Type) 
values (1,"Sejal","AC","F ","Bengaluru","Chennai",350,"Sleeper"),
(2,"Anmol","Non-AC","M","Mumbai ","Hyderabad",700,"Sitting"),
(3,"Pallavi","AC","F","Panaji ","Bengaluru",600,"Sleeper"),
(4,"Khusboo ","AC","F","Chennai","Mumbai",1500,"Sleeper"),
(5,"Udit","Non-AC ","M","Trivandrum","Panaji",1000,"Sleeper"),
(6,"Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting"),
(7,"Hemant","Non-AC","M","Panaji","Mumbai ",700,"Sleeper"),
(8,"Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting"),
(9,"Piyush","AC","M","Pune","Nagpur",700,"Sitting");

select * from passengers;

#inserting records in the price table.
insert into Price (id,Bus_type ,Distance,Price) 
values (1,"Sleeper",350,770),
(2,"Sleeper",500,1100),
(3,"Sleeper",600,1320),
(5,"Sleeper",1000,2200),
(6,"Sleeper",1200,2640),
(8,"Sitting",500,620),
(9,"Sitting",600,744),
(10,"Sitting",700,868),
(11,"Sitting",1000,1240),
(12,"Sitting",1200,1488),
(13,"Sitting",1500,1860);

select * from passengers;
select * from price;

#a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender, count(*) as Count
from passengers
where distance <= 600
group by gender;


#b.	Find the minimum ticket price of a Sleeper Bus. 
select min(price) as min_sleeper_price from price where bus_type = 'sleeper';

#c.	Select passenger names whose names start with character 'S' 
select passenger_name from passengers where passenger_name like 'S%';

#d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select p.passenger_name, p.boarding_city, p.destination_city, p.bus_type, pr.price 
from passengers p left join price pr 
on p.distance=pr.distance and p.bus_type = pr.bus_type;

#e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select p.passenger_name, pr.price 
from passengers p left join price pr 
on p.distance=pr.distance and p.bus_type = pr.bus_type
where p.distance = 1000 and p.bus_type='sitting';

#f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select p.passenger_name, p.destination_city as boarding_city, p.boarding_city as destination_city, pr.bus_type, pr.price
from passengers p left join price pr 
on p.distance = pr.distance 
where passenger_name = 'pallavi';

#g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
select distinct distance from price order by distance desc;

#h.	Display the passenger name and percentage of distance traveled by that 
-- passenger from the total distance traveled by all passengers without using user variables 
select passenger_name, concat(round((distance/(select sum(distance) as total_distance from passengers))*100,2),' %') as distance_travelled from passengers;


