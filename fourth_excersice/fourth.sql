CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));

select * from DEPARTMENTS;

select * from EMPLOYEES
where SALARY < (select avg(SALARY) from EMPLOYEES);

select EMP_ID, SALARY, (select max(salary) from EMPLOYEES) as MAX_SALARY
from EMPLOYEES;

select f_name, l_name from EMPLOYEES
where B_DATE = (select min(B_DATE) from EMPLOYEES);

select avg(SALARY) from 
(select SALARY from EMPLOYEES 
order by SALARY desc limit 5) as SALARY_TABLE;

select avg(SALARY) from 
(select SALARY from EMPLOYEES order by SALARY limit 5) as SALARY_Table;

select * from EMPLOYEES
where B_DATE < (select avg(B_DATE) from EMPLOYEES) order by B_DATE;

select avg(B_DATE) from EMPLOYEES as averdate;

SELECT * 
FROM EMPLOYEES 
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE))) > 
    (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,B_DATE)))) 
    FROM EMPLOYEES);

select EMPL_ID, year(from_days(datediff(current_date, START_DATE))), 
	(select avg(year(from_days(datediff(current_date, START_DATE))))
	from JOB_HISTORY) as AVERAGE_YEAR 
from JOB_HISTORY;
