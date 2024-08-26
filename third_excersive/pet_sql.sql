
drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

SELECT SUM(COST)  AS SUM_OF_COST FROM PETRESCUE;

select max(QUANTITY) as Max, min(QUANTITY) from PETRESCUE;

select *  from PETRESCUE;

select avg(COST) as average_cost from PETRESCUE;

select round(COST, 0) from PETRESCUE;

select length(animal) as length_of_animal from PETRESCUE;

select ucase(animal) from PETRESCUE;

select lcase(animal) from PETRESCUE;

select day(rescuedate) from PETRESCUE;

select month(rescuedate) from PETRESCUE;

select year(rescuedate) from PETRESCUE;

select date_add(rescuedate, interval 3 day) from PETRESCUE;

select date_add(rescuedate, interval 2 month) from PETRESCUE;

select date_sub(rescuedate, interval 3 day) from PETRESCUE;

select datediff(current_date, rescuedate) from PETRESCUE;

select from_days( datediff(current_date, rescuedate) ) from PETRESCUE;

select avg(cost/QUANTITY) as average_dogs from PETRESCUE where lcase(animal) like "do%"; 

select distinct ucase(animal) from PETRESCUE;

select * from PETRESCUE where lcase(animal) = "cat";

select sum(QUANTITY) from PETRESCUE where month(rescuedate) = 05;

select id, date_add(rescuedate, interval 1 year) from PETRESCUE;
